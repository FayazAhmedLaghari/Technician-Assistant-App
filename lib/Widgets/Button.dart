import 'package:flutter/material.dart';

class CustomBlueButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomBlueButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor:
                Color.fromARGB(255, 230, 15, 15), // Blue background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded edges
            ),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
