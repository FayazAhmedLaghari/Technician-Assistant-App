// ignore_for_file: prefer_const_constructors, camel_case_types

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technician_assistant_app/Auth/Login.dart';
import 'package:technician_assistant_app/Widgets/Button.dart';

class otp_screen extends StatefulWidget {
  String verificationid;
  otp_screen({Key? key, required this.verificationid}) : super(key: key);

  @override
  State<otp_screen> createState() => _otp_screenState();
}

class _otp_screenState extends State<otp_screen> {
  TextEditingController otpController = TextEditingController();

  Future<void> signInWithOTP() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationid,
        smsCode: otpController.text.toString(),
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        // OTP is correct, navigate to the next screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Successfully logged in')),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => loginOnly(),
          ),
        );
      } else {
        // OTP is incorrect
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid OTP. Please try again.')),
        );
      }
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP or Network issues')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OTP Screen',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(9),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: otpController,
                decoration: InputDecoration(
                  suffixIcon: Icon(FontAwesomeIcons.code,
                      color: Color.fromRGBO(10, 221, 45, 1)),
                  labelText: 'Enter otp (e.g. 842849)',
                  labelStyle: TextStyle(color: Colors.black87),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            CustomBlueButton(
                text: 'Verify otp',
                onPressed: () {
                  signInWithOTP();
                })
          ],
        ),
      ),
    );
  }
}
