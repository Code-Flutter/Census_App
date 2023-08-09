import 'package:Census/database/database.dart';
import 'package:flutter/material.dart';

class Play extends StatelessWidget {
  const Play({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseService householdData = DatabaseService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HouseHolds regestered'),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              color: Colors.grey[100], // Off-white color
              elevation: 0, // No shadow
              margin: EdgeInsets.all(0), // No margin
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Testing',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 16), // Add some spacing
            // ElevatedButton(
            //     onPressed: () async {
            //       await householdData.fetchData();
            //     },
            //     child: Text('Get Data')),
            Text('Welcome to the Play Screen!'),
          ],
        ),
      ),
    );
  }
}
