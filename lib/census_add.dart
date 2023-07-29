import 'package:cencus/members.dart';
import 'package:flutter/material.dart';
// import 'package:census/RegisterMembersPage.dart';

class Census_count extends StatefulWidget {
  @override
  _Census_countState createState() => _Census_countState();
}

class _Census_countState extends State<Census_count> {
  bool isRented = false;
  bool hasElectricity = false;
  bool hasWater = false;
  bool hasHealthCare = false;
  String typeOfOwnership = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Census Form')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Household Information',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.0),
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Name of the head of the household')),
                  SizedBox(height: 16.0),
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Address of the household')),
                  SizedBox(height: 16.0),
                  TextFormField(
                      decoration: InputDecoration(
                          labelText:
                              'Type of dwelling (Bungalow, Apartment, etc.)')),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Number of people living in the household'),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Access to basic services:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Checkbox(
                        value: hasElectricity,
                        onChanged: (newValue) {
                          setState(() {
                            hasElectricity = newValue ?? false;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      Text('Electricity'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: hasWater,
                        onChanged: (newValue) {
                          setState(() {
                            hasWater = newValue ?? false;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      Text('Water'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: hasHealthCare,
                        onChanged: (newValue) {
                          setState(() {
                            hasHealthCare = newValue ?? false;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      Text('Health care'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Type of ownership:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Radio(
                        value: 'Owned',
                        groupValue: typeOfOwnership,
                        onChanged: (newValue) {
                          setState(() {
                            typeOfOwnership = newValue.toString();
                            isRented = false;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      Text('Owned'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'Rented',
                        groupValue: typeOfOwnership,
                        onChanged: (newValue) {
                          setState(() {
                            typeOfOwnership = newValue.toString();
                            isRented = true;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      Text('Rented'),
                    ],
                  ),
                  if (isRented) ...[
                    SizedBox(height: 16.0),
                    TextFormField(
                        decoration: InputDecoration(
                            labelText:
                                'Tenure status (Specify lease details)')),
                  ],
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                          labelText:
                              'Source of livelihood (agriculture, services, etc.)')),
                  SizedBox(height: 24.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MembersPage(),
                          ),
                        );
                      },
                      child: Text('Go to MembersPage'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
