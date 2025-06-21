// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:technician_assistant_app/Auth/Login.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  bool _isLoading = false;

  // Password validation for strong passwords
  bool _isValidPassword(String password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}$');
    return regex.hasMatch(password);
  }

  Future<void> _changePassword() async {
    setState(() => _isLoading = true);
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email;

    try {
      if (email == null) throw FirebaseAuthException(code: 'no-email');

      final credential = EmailAuthProvider.credential(
        email: email,
        password: _currentPasswordController.text.trim(),
      );

      await user!.reauthenticateWithCredential(credential);
      await user.updatePassword(_newPasswordController.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password changed successfully!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => loginOnly()), // Replace with your target page
      );
      _currentPasswordController.clear();
      _newPasswordController.clear();
    } on FirebaseAuthException catch (e) {
      String message = 'Error';
      if (e.code == 'wrong-password') {
        message = 'Current password is incorrect.';
      } else if (e.code == 'weak-password') {
        message = 'New password too weak.';
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      hintText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.redAccent),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF001E62), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Change password ",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _currentPasswordController,
                obscureText: true,
                decoration: _inputDecoration("Current Password", Icons.lock),
                validator: (value) =>
                    value!.isEmpty ? 'Enter current password' : null,
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: _inputDecoration("New Password", Icons.lock_open),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter new password';
                  } else if (!_isValidPassword(value)) {
                    return 'Password must be at least 8 characters,\ninclude upper, lower case & a special character';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _changePassword();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                      ),
                      child: Text(
                        "Change",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
