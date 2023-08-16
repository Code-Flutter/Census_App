import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:Census/database/database.dart'; // Import your database service here

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  DatabaseService households = DatabaseService();
  int registeredPeopleCount = 0;
  int registeredHouseholdsCount = 0;
  int targetHouseholdsCount = 100;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait(
          [households.numberOfHouseholds(), households.numberOfPeople()]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          int numberOfHouseholds = snapshot.data![0];
          int numberOfPeople = snapshot.data![1];
          double progress = numberOfHouseholds / targetHouseholdsCount;

          return Scaffold(
            appBar: AppBar(
              title: Text('Transaction Details'),
            ),
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    color: Colors.blue,
                    child: Text(
                      'For a person to make a withdrawal, they should first register 100 households at least.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        LiquidLinearProgressIndicator(
                          value: progress,
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                          backgroundColor: Colors.white,
                          borderColor: Colors.blue,
                          borderWidth: 2.0,
                          borderRadius: 12.0,
                          direction: Axis.vertical,
                          center: Text(
                            '$numberOfHouseholds / $targetHouseholdsCount',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          bottom: 20.0,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Implement the logic for withdrawing money
                            },
                            child: Text('Withdraw Money'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.blue,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Number of People Registered',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  '$numberOfPeople',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Card(
                          color: Colors.blue,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Number of Households Registered',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  '$numberOfHouseholds',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Transactions(),
  ));
}
