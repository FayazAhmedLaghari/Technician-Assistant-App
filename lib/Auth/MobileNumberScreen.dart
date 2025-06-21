// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:technician_assistant_app/Auth/otp_screen.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  State<MobileNumberScreen> createState() => _otp_dashboardState();
}

class _otp_dashboardState extends State<MobileNumberScreen> {
  TextEditingController phonenumberController = TextEditingController();
  bool _validatePhoneNumber = false;
  bool _isSendingOTP = false;

  Future<void> sendOTP() async {
    final phone = phonenumberController.text.trim();

    if (phone.isEmpty || !phone.startsWith('+')) {
      setState(() {
        _validatePhoneNumber = true;
      });
      return;
    }

    setState(() {
      _validatePhoneNumber = false;
      _isSendingOTP = true;
    });

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to send OTP: ${ex.message}")),
          );
          print("Phone Auth Error: ${ex.code} - ${ex.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("OTP Sent Successfully")),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => otp_screen(verificationid: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    } finally {
      setState(() {
        _isSendingOTP = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mobile Number Otp Screen',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 8, 30, 228),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(9),
              child: TextField(
                controller: phonenumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  suffixIcon:
                      Icon(Icons.call, color: Color.fromRGBO(10, 221, 45, 1)),
                  labelText: 'Mobile Number (e.g. +1234567890)',
                  labelStyle: TextStyle(color: Colors.black87),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  errorText: _validatePhoneNumber
                      ? 'Enter valid mobile number with country code'
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isSendingOTP ? null : sendOTP,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                    255, 243, 25, 10), // 👈 This sets the background color
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isSendingOTP
                  ? const CircularProgressIndicator(
                      strokeWidth: 2,
                    )
                  : const Text(
                      'Send OTP',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors
                            .white, // Optional: Make text white for contrast
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
