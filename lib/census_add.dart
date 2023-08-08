import 'package:census_app/members.dart';
import 'package:flutter/material.dart';
import 'package:census_app/database/database.dart';
import 'auth.dart';

class HouseHoldData {
  String? headOfHousehold = '';
  String? typeOfDwelling = '';
  int? numberOfPeople = 0;

  // District, County, Subcounty, Parish, and Village Variables
  String? selectedDistrict;
  String? selectedCounty;
  String? selectedSubcounty;
  String? selectedParish;
  String? selectedVillage;
}

class Census_count extends StatefulWidget {
  @override
  Census_countState createState() => Census_countState();
}

class Census_countState extends State<Census_count> {
  // DatabaseService newHousehold = DatabaseService();
  // Household Information Variables
  DatabaseService newRecord = DatabaseService();
  AuthService uid = AuthService();

  HouseHoldData householdData = HouseHoldData();

  // Dropdown Button onChanged Functions
  void onDistrictChanged(String? newValue) {
    setState(() {
      householdData.selectedDistrict = newValue;
    });
  }

  void onCountyChanged(String? newValue) {
    setState(() {
      householdData.selectedCounty = newValue;
    });
  }

  void onSubcountyChanged(String? newValue) {
    setState(() {
      householdData.selectedSubcounty = newValue;
    });
  }

  void onParishChanged(String? newValue) {
    setState(() {
      householdData.selectedParish = newValue;
    });
  }

  void onVillageChanged(String? newValue) {
    setState(() {
      householdData.selectedVillage = newValue;
    });
  }

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
                    onChanged: (value) {
                      householdData.headOfHousehold = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Name of the head of the household',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    onChanged: (value) {
                      householdData.typeOfDwelling = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Type of dwelling (Bungalow, Apartment, etc.)',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    onChanged: (value) {
                      householdData.numberOfPeople = int.tryParse(value) ?? 0;
                    },
                    decoration: InputDecoration(
                      labelText: 'Number of people living in the household',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16.0),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: householdData.selectedDistrict,
                                  onChanged: onDistrictChanged,
                                  items:
                                      ['District A', 'District B', 'District C']
                                          .map((district) => DropdownMenuItem(
                                                value: district,
                                                child: Text(district),
                                              ))
                                          .toList(),
                                  decoration: InputDecoration(
                                    labelText: 'District',
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: householdData.selectedCounty,
                                  onChanged: onCountyChanged,
                                  items: ['County A', 'County B', 'County C']
                                      .map((county) => DropdownMenuItem(
                                            value: county,
                                            child: Text(county),
                                          ))
                                      .toList(),
                                  decoration: InputDecoration(
                                    labelText: 'County',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: householdData.selectedSubcounty,
                                  onChanged: onSubcountyChanged,
                                  items: [
                                    'Subcounty A',
                                    'Subcounty B',
                                    'Subcounty C'
                                  ]
                                      .map((subcounty) => DropdownMenuItem(
                                            value: subcounty,
                                            child: Text(subcounty),
                                          ))
                                      .toList(),
                                  decoration: InputDecoration(
                                    labelText: 'Subcounty',
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: householdData.selectedParish,
                                  onChanged: onParishChanged,
                                  items: ['Parish A', 'Parish B', 'Parish C']
                                      .map((parish) => DropdownMenuItem(
                                            value: parish,
                                            child: Text(parish),
                                          ))
                                      .toList(),
                                  decoration: InputDecoration(
                                    labelText: 'Parish',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          DropdownButtonFormField<String>(
                            value: householdData.selectedVillage,
                            onChanged: onVillageChanged,
                            items: ['Village A', 'Village B', 'Village C']
                                .map((village) => DropdownMenuItem(
                                      value: village,
                                      child: Text(village),
                                    ))
                                .toList(),
                            decoration: InputDecoration(
                              labelText: 'Village',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 40.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MembersPage(
                      houseHoldData: householdData,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text('Register Members'),
            ),
          ),
        ],
      ),
    );
  }
}
