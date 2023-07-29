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

class CensusCount extends StatelessWidget {
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

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _dateOfBirth = '';
  String _gender = '';
  String _maritalStatus = '';
  String _nationality = '';
  String _ethnicityRace = '';
  String _citizenshipStatus = '';
  String _address = '';
  String _householdId = '';
  String _housingType = '';
  String _numberOfPeople = '';
  String _employmentStatus = '';
  String _occupation = '';
  String _industryOfEmployment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Date of Birth'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your date of birth';
                }
                // You can add more complex date validation here if needed.
                return null;
              },
              onSaved: (value) {
                _dateOfBirth = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Gender'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your gender';
                }
                // You can add more complex gender validation here if needed.
                return null;
              },
              onSaved: (value) {
                _gender = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Marital Status'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your marital status';
                }
                // You can add more complex marital status validation here if needed.
                return null;
              },
              onSaved: (value) {
                _maritalStatus = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nationality'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your nationality';
                }
                return null;
              },
              onSaved: (value) {
                _nationality = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Ethnicity or Race'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your ethnicity or race';
                }
                return null;
              },
              onSaved: (value) {
                _ethnicityRace = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Citizenship Status'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your citizenship status';
                }
                return null;
              },
              onSaved: (value) {
                _citizenshipStatus = value!;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Residential Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Address'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
              onSaved: (value) {
                _address = value!;
              },
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Household Identification Number'),
              onSaved: (value) {
                _householdId = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Housing Type'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your housing type';
                }
                return null;
              },
              onSaved: (value) {
                _housingType = value!;
              },
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Number of People in Household'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the number of people living in the household';
                }
                // You can add more complex validation for the number of people if needed.
                return null;
              },
              onSaved: (value) {
                _numberOfPeople = value!;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Employment',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Employment Status'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your employment status';
                }
                return null;
              },
              onSaved: (value) {
                _employmentStatus = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Occupation'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your occupation';
                }
                return null;
              },
              onSaved: (value) {
                _occupation = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Industry of Employment'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the industry of employment';
                }
                return null;
              },
              onSaved: (value) {
                _industryOfEmployment = value!;
              },
            ),
            ElevatedButton(
              onPressed: () {
                //add logic here how it will deposit this work to database
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    ));
  }
}
