import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  int registeredPeopleCount = 0;
  int registeredHouseholdsCount = 0;
  int targetHouseholdsCount = 100;

  @override
  Widget build(BuildContext context) {
    double progress = registeredHouseholdsCount / targetHouseholdsCount;

    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
                      '$registeredHouseholdsCount / $targetHouseholdsCount',
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
                            '$registeredPeopleCount',
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
                            '$registeredHouseholdsCount',
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
}
