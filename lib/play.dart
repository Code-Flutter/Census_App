import 'package:Census/database/database.dart';
import 'package:flutter/material.dart';

class Play extends StatelessWidget {
  const Play({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseService householdData = DatabaseService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await householdData.fetchData();
                },
                child: Text('Get Data')),
            Text('Welcome to the Play Screen!'),
          ],
        ),
      ),
    );
  }
}
