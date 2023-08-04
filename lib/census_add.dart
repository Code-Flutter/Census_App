import 'package:census_app/auth.dart';
import 'package:flutter/material.dart';
import 'package:census_app/members.dart';
import 'database/database.dart';

class Census_count extends StatefulWidget {
  @override
  _Census_countState createState() => _Census_countState();
}

class _Census_countState extends State<Census_count> {
  String? userUID = AuthService().getUserUID();

  bool isRented = false;
  bool hasElectricity = false;
  bool hasWater = false;
  bool hasHealthCare = false;
  String typeOfOwnership = '';

  String? selectedDistrict;
  String? selectedCounty;
  String? selectedSubcounty;
  String? selectedParish;
  String? selectedVillage;

  void onDistrictChanged(String? newValue) {
    setState(() {
      selectedDistrict = newValue;
    });
  }

  void onCountyChanged(String? newValue) {
    setState(() {
      selectedCounty = newValue;
    });
  }

  void onSubcountyChanged(String? newValue) {
    setState(() {
      selectedSubcounty = newValue;
    });
  }

  void onParishChanged(String? newValue) {
    setState(() {
      selectedParish = newValue;
    });
  }

  void onVillageChanged(String? newValue) {
    setState(() {
      selectedVillage = newValue;
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
                      decoration: InputDecoration(
                          labelText: 'Name of the head of the household')),
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
                                  value: selectedDistrict,
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
                                  value: selectedCounty,
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
                                  value: selectedSubcounty,
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
                                  value: selectedParish,
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
                            value: selectedVillage,
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
              onPressed: () async {
                await DatabaseService(uid: userUID).updateHouseholdData(
                    'Trevor',
                    'flat',
                    5,
                    'Wakiso',
                    'Busiro',
                    'Naguru',
                    'Bukoto',
                    'home');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MembersPage(),
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
