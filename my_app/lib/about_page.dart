import 'package:flutter/material.dart';
import 'notifications_page.dart'; // Ensure this file exists with the NotificationsPage

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.info, color: Colors.black54, size: 28, semanticLabel: 'Info Icon'),
            SizedBox(width: 8),
            Text(
              'About EcoHive',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black54, // Changed color to black54
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLogoSection(),
              SizedBox(height: 20),
              _buildSection(
                title: 'Our Mission',
                content:
                'EcoHive is dedicated to revolutionizing waste management through innovative technology, fostering a sustainable environment for future generations.',
              ),
              SizedBox(height: 20),
              _buildTechnologySection(),
              SizedBox(height: 20),
              _buildGetInvolvedSection(context),
              SizedBox(height: 20),
              _buildContactSection(context),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Column(
      children: [
        Image.asset(
          'assets/logo.png', // Replace with your logo path
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10),
        Text(
          'Ready to Make an Impact?',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[800]),
        ),
      ],
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green[200]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green[800]),
          ),
          SizedBox(height: 10),
          Text(content, style: TextStyle(fontSize: 16, color: Colors.green[700])),
        ],
      ),
    );
  }

  Widget _buildTechnologySection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green[200]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technology Behind Sensor-Based Dustbins',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green[800]),
          ),
          SizedBox(height: 10),
          Text(
            'Our sensor-equipped dustbins monitor waste levels in real-time, ensuring timely collection and reducing environmental impact.',
            style: TextStyle(fontSize: 16, color: Colors.green[700]),
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/dustbin.jpg', // Replace with your image path
            height: 120,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _buildGetInvolvedSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green[200]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get Involved',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green[800]),
          ),
          SizedBox(height: 10),
          Text(
            'Join our community of eco-conscious citizens. Participate in events, volunteer, or provide feedback to help us improve.',
            style: TextStyle(fontSize: 16, color: Colors.green[700]),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () => _showJoinDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text('Join Us', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green[200]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact & Resources',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green[800]),
          ),
          SizedBox(height: 10),
          _buildContactRow(Icons.email, 'contact@ecohive.com'),
          _buildContactRow(Icons.phone, '+1 (555) 123-4567'),
          InkWell(
            onTap: () {
              // Add logic to open blog URL
            },
            child: Row(
              children: [
                Icon(Icons.web, color: Colors.green[600]),
                SizedBox(width: 10),
                Text(
                  'Visit Our Blog',
                  style: TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green[600]),
          SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 16, color: Colors.green[700])),
        ],
      ),
    );
  }

  void _showJoinDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Join Us'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(decoration: InputDecoration(labelText: 'Your Name')),
              TextField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showThanksPopup(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showThanksPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Thank You!'),
          content: Text('Thanks for reaching out. We will contact you soon.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
