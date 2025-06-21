// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:technician_assistant_app/Auth/Login.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../User Screens/VerificationCode.dart';
import 'MobileNumberScreen.dart';
import 'email_otp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // user cancelled

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Optional: Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google Sign-In successful")),
      );

      // ✅ Navigate to LoginPage or HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => loginOnly()), // Replace with your target page
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google Sign-In failed: $e")),
      );
    }
  }

  bool _isValidPassword(String password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}$');
    return regex.hasMatch(password);
  }

  void _register() async {
    String recipientEmail = _emailController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        _showSnackBar("No internet connection.");
        return;
      }
    }

    if (recipientEmail.isEmpty ||
        username.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _showSnackBar("Please fill in all fields.");
      return;
    }

    if (password != confirmPassword) {
      _showSnackBar("Passwords do not match!");
      return;
    }

    if (!_isValidPassword(password)) {
      _showSnackBar(
          "Password must have at least 8 characters, one uppercase, one lowercase, and one special character.");
      return;
    }

    setState(() => _isLoading = true);

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: recipientEmail,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'uid': userCredential.user!.uid,
        'email': recipientEmail,
        'username': username,
        'createdAt': FieldValue.serverTimestamp(),
      });

      String generatedOtp = generateOTP();
      bool otpSent = await sendOTP(recipientEmail, generatedOtp);
      if (otpSent) {
        _showSnackBar("Registration successful! Check your email for OTP.",
            isSuccess: true);
        await Future.delayed(Duration(seconds: 2));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationCode(
              correctOTP: generatedOtp,
              onResendOTP: () => sendOTP(recipientEmail, generatedOtp),
            ),
          ),
        );
      } else {
        _showSnackBar("Failed to send OTP.");
      }
    } on FirebaseAuthException catch (e) {
      _showSnackBar("Registration failed: ${e.message}");
    } catch (e) {
      _showSnackBar("An error occurred: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message, {bool isSuccess = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: isSuccess ? Colors.green : Colors.red,
    ));
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String label,
      required IconData icon,
      bool obscure = false,
      bool showToggle = false,
      VoidCallback? toggleVisibility}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          suffixIcon: showToggle
              ? IconButton(
                  icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: toggleVisibility,
                )
              : null,
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: height * 0.2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF001E62), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Center(
              child: Text(
                "Register",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  buildCustomTextField(
                    controller: _usernameController,
                    label: 'Full Name',
                    icon: Icons.person,
                  ),
                  buildCustomTextField(
                    controller: _emailController,
                    label: 'Email',
                    icon: Icons.email,
                  ),
                  buildCustomTextField(
                    controller: _passwordController,
                    label: 'Password',
                    icon: Icons.lock,
                    obscure: _obscurePassword,
                    showToggle: true,
                    toggleVisibility: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                  buildCustomTextField(
                    controller: _confirmPasswordController,
                    label: 'Confirm Password',
                    icon: Icons.lock_outline,
                    obscure: _obscureConfirmPassword,
                    showToggle: true,
                    toggleVisibility: () {
                      setState(() =>
                          _obscureConfirmPassword = !_obscureConfirmPassword);
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _register,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Color.fromRGBO(235, 4, 35, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: _isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      if (!_isLoading) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const loginOnly()),
                        );
                      }
                    },
                    child: Text(
                      "Already have an account? Sign In",
                      style: TextStyle(
                        color: Colors.blueGrey.shade700,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Or continue with",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(137, 49, 10, 223)),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Aligns both icons center vertically
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MobileNumberScreen()),
                            );
                          },
                          child: Icon(
                            Icons.call,
                            size: 30,
                            color: Color(0xFF1877F2), // Facebook Blue
                          ),
                        ),
                        SizedBox(width: 30), // Adjust spacing between icons
                        GestureDetector(
                          onTap: () {
                            _handleGoogleSignIn();
                          },
                          child: Icon(
                            FontAwesomeIcons.google,
                            size: 30,
                            color: Color(0xFF4285F4), // Google Blue
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCustomTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscure = false,
    bool showToggle = false,
    VoidCallback? toggleVisibility,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blueGrey),
          suffixIcon: showToggle
              ? IconButton(
                  icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: toggleVisibility,
                )
              : null,
          labelText: label,
          labelStyle: TextStyle(color: Colors.black87),
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}
