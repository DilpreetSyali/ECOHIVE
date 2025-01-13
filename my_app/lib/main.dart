import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'main_page.dart';
import 'details_page.dart'; // Import the details page
import 'about_page.dart';
import 'notifications_page.dart';

void main() {
  runApp(EcoHiveApp());
}

class EcoHiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoHive App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/main': (context) => MainPage(),
        '/details': (context) => DetailsPage(
          timeLeft: 'Unknown',  // Default values
          binStatus: 'Unknown',
          batteryLevel: 'Unknown',
        ),  // Default values for now
        '/about': (context) => AboutPage(),
      },
    );
  }
}
