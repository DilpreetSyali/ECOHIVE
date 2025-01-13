import 'package:flutter/material.dart';

class BinStatusPage extends StatefulWidget {
  @override
  _BinStatusPageState createState() => _BinStatusPageState();
}

class _BinStatusPageState extends State<BinStatusPage> {
  List<String> locations = ['Location 1', 'Location 2', 'Location 3'];
  String? selectedLocation;
  List<BinTile> bins = [
    BinTile(binName: 'Bin 1', location: 'Location 1', fillLevel: 60, batteryLevel: '85%'),
    BinTile(binName: 'Bin 2', location: 'Location 2', fillLevel: 75, batteryLevel: '90%'),
    BinTile(binName: 'Bin 3', location: 'Location 3', fillLevel: 90, batteryLevel: '25%'),
  ];

  List<BinTile> sortedBins = [];

  @override
  void initState() {
    super.initState();
    sortedBins = List.from(bins);
  }

  void sortByFillLevel() {
    sortedBins.sort((a, b) => b.fillLevel.compareTo(a.fillLevel)); // Sort in descending order
    setState(() {});
  }

  void filterByLocation(String location) {
    setState(() {
      selectedLocation = location;
      sortedBins = bins.where((bin) => bin.location == location).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.delete, color: Colors.black54, size: 28),
            SizedBox(width: 8),
            Text(
              'Bin Status',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _showLocationDialog(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Sort by Location'),
                ),
                ElevatedButton(
                  onPressed: sortByFillLevel,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Sort by Fill Level'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: sortedBins.map((bin) {
                return BinTile(
                  binName: bin.binName,
                  location: bin.location,
                  fillLevel: bin.fillLevel,
                  batteryLevel: bin.batteryLevel,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _showLocationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Location"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: locations.map((location) {
              return ListTile(
                title: Text(location),
                onTap: () {
                  filterByLocation(location);
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class BinTile extends StatelessWidget {
  final String binName;
  final String location;
  final int fillLevel;
  final String batteryLevel;

  const BinTile({
    required this.binName,
    required this.location,
    required this.fillLevel,
    required this.batteryLevel,
  });

  @override
  Widget build(BuildContext context) {
    // Determine color based on fill level
    Color fillColor = fillLevel < 50
        ? Colors.green
        : fillLevel < 75
        ? Colors.orange
        : Colors.red;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bin Name with Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.delete, color: fillColor),
                    SizedBox(width: 10),
                    Text(
                      binName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                // Location
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Fill Level Progress Indicator
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: fillLevel / 100,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(fillColor),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '$fillLevel%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: fillColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Battery Level and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.battery_std, color: Colors.blue),
                    SizedBox(width: 5),
                    Text(
                      'Battery: $batteryLevel',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                // Status based on fill level
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: fillColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    fillLevel < 50
                        ? 'Low'
                        : fillLevel < 75
                        ? 'Moderate'
                        : 'High',
                    style: TextStyle(color: fillColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
