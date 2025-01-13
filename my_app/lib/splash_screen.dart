import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to main screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/main');
    });

    return Scaffold(
      // Gradient Background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightGreen[100]!, Colors.green[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Static Logo
              Image.asset(
                'assets/logo.png', // Ensure correct path for your logo
                height: 250,
                width: 250,
              ),
              SizedBox(height: 20),
              // App Title
              Text(
                'GREEN INDIA CLEAN INDIA',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                  letterSpacing: 2.0, // Adds spacing between letters
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
