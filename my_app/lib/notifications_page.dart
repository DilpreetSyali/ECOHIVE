import 'package:flutter/material.dart';
import 'details_page.dart';  // Make sure to import DetailsPage

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.notifications, color: Colors.black54 , size: 28), // Icon before title
            SizedBox(width: 8), // Space between the icon and title
            Text(
              'Notifications',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotificationTile(
              title: 'Truck ETA: 15 mins',
              subtitle: 'Your pickup truck is on its way.',
              timeLeft: '15 minutes',
              binStatus: 'Full',
              batteryLevel: '80%',
            ),
            NotificationTile(
              title: 'Next Collection: 2 days',
              subtitle: 'Your next scheduled pickup is soon.',
              timeLeft: '',
              binStatus: '',
              batteryLevel: '',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timeLeft;
  final String binStatus;
  final String batteryLevel;

  const NotificationTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.timeLeft,
    required this.binStatus,
    required this.batteryLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: ElevatedButton(
          onPressed: () {
            // Navigate to DetailsPage and pass the arguments
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  timeLeft: timeLeft,
                  binStatus: binStatus,
                  batteryLevel: batteryLevel,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: Text('Details'),
        ),
      ),
    );
  }
}
