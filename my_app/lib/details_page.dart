import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String timeLeft;
  final String binStatus;
  final String batteryLevel;

  const DetailsPage({
    Key? key,
    required this.timeLeft,
    required this.binStatus,
    required this.batteryLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 8), // Space between icon and text
            Text(
              'Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors. black54,
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
            if (timeLeft.isNotEmpty) ...[
              Text(
                'Truck ETA: $timeLeft',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _truckETA(),
            ],
            if (timeLeft.isEmpty && binStatus.isEmpty) ...[
              Text(
                'Next Collection Steps:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _garbageCollectionSteps(),
            ],
            SizedBox(height: 20),
           // Text(
              //'Battery Level: $batteryLevel',
             // style: TextStyle(fontSize: 16, color: Colors.green),
          //  ),
          ],
        ),
      ),
    );
  }

  // Truck ETA Visual Appeal
  Widget _truckETA() {
    return Card(
      color: Colors.green[50],
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.timer, color: Colors.green),
            SizedBox(width: 10),
            Text(
              'Truck will arrive in $timeLeft',
              style: TextStyle(fontSize: 18, color: Colors.green[800]),
            ),
          ],
        ),
      ),
    );
  }

  // Garbage Collection Steps Visual Appeal
  Widget _garbageCollectionSteps() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _stepCard('Step 1', 'Collecting trash from bins around the city.'),
        _stepCard('Step 2', 'Sorting recyclables from non-recyclables.'),
        _stepCard('Step 3', 'Transferring the trash to disposal sites.'),
        _stepCard('Step 4', 'Recycling waste materials wherever possible.'),
      ],
    );
  }

  // Step Card Visual Appeal
  Widget _stepCard(String step, String description) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(step, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
