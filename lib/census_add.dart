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

  void onDistrictChanged(String? newValue) {
    setState(() {
      householdData.selectedDistrict = newValue;
      householdData.selectedCounty = null; // Reset selected county
      householdData.selectedSubcounty = null; // Reset selected subcounty
      householdData.selectedParish = null; // Reset selected parish
      householdData.selectedVillage = null; // Reset selected village
    });
  }

  void onCountyChanged(String? newValue) {
    setState(() {
      householdData.selectedCounty = newValue;
      householdData.selectedSubcounty = null; // Reset selected subcounty
      householdData.selectedParish = null; // Reset selected parish
      householdData.selectedVillage = null; // Reset selected village
    });
  }

  void onSubcountyChanged(String? newValue) {
    setState(() {
      householdData.selectedSubcounty = newValue;
      householdData.selectedParish = null; // Reset selected parish
      householdData.selectedVillage = null; // Reset selected village
    });
  }

  void onParishChanged(String? newValue) {
    setState(() {
      householdData.selectedParish = newValue;
      householdData.selectedVillage = null; // Reset selected village
    });
  }

  void onVillageChanged(String? newValue) {
    setState(() {
      householdData.selectedVillage = newValue;
    });
  }

  List<DropdownMenuItem<String>> _getCountyItems(String? selectedDistrict) {
    List<String> counties = [];

    // Populate counties based on selected district
    if (selectedDistrict == 'Kampala') {
      counties = [
        'Kawempe Division',
        'Central Division',
        'Nakawa Division',
        'Makindye division',
        'Rubaga division'
      ];
    } else if (selectedDistrict == 'Mbale') {
      counties = ['Bufumbo', 'Bukonde', 'Bukyiende'];
    } else if (selectedDistrict == 'Wakiso') {
      counties = ['Gombe', 'Kakiri', 'Kasanje'];
    }

    // ... Add more conditions for other districts

    return counties.map((county) {
      return DropdownMenuItem(
        value: county,
        child: Text(county),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> _getSubcountyItems(String? selectedCounty) {
    List<String> subcounties = [];

    // Populate subcounties based on selected county
    if (selectedCounty == 'Central Division') {
      subcounties = ['Central'];
    } else if (selectedCounty == 'Kawempe Division') {
      subcounties = ['Kawempe'];
    } else if (selectedCounty == 'Nakawa Division') {
      subcounties = ['Nakawa'];
    } else if (selectedCounty == 'Makindye Division') {
      subcounties = ['Makindye'];
    } else if (selectedCounty == 'Rubaga Division') {
      subcounties = ['Rubaga'];
    } else if (selectedCounty == 'Bufumbo') {
      subcounties = ['Bufumbo'];
    } else if (selectedCounty == 'Bukonde') {
      subcounties = ['Bukonde'];
    } else if (selectedCounty == 'Bukyiende') {
      subcounties = ['Gombe'];
    } else if (selectedCounty == 'Kakiri') {
      subcounties = ['Kakiri'];
    } else if (selectedCounty == 'Kasanje') {
      subcounties = ['Kasanje'];
    } else if (selectedCounty == 'Gombe') {
      subcounties = ['Gombe'];
    }
    // ... Add more conditions for other counties

    return subcounties.map((subcounty) {
      return DropdownMenuItem(
        value: subcounty,
        child: Text(subcounty),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> _getParishItems(String? selectedSubcounty) {
    List<String> parishes = [];

    // Populate parishes based on selected subcounty
    if (selectedSubcounty == 'Kawempe') {
      parishes = ['Komamboga', 'Bwaise', 'Mulago'];
    } else if (selectedSubcounty == 'Nakawa') {
      parishes = ['Kyambogo', 'Luzira', 'Bugolobi'];
    } else if (selectedSubcounty == 'Rubaga') {
      parishes = ['Busega', ' Kabowa ', 'Kasubi'];
    } else if (selectedSubcounty == 'Makindye') {
      parishes = ['Buziga ', 'Ggaba', ' Kabalagala'];
    } else if (selectedSubcounty == 'Central') {
      parishes = ['Central'];
    } else if (selectedSubcounty == 'Bufumbo') {
      parishes = ['Bubyangu ', 'Bumadanda', ' Jewa'];
    } else if (selectedSubcounty == 'Bukonde') {
      parishes = ['Bulweta ', 'Bumuluya ', 'Lwasso'];
    } else if (selectedSubcounty == 'Bukyiende') {
      parishes = [
        'Bumutsopa',
        'Bunashimolo ',
        'Burukuru',
      ];
    } else if (selectedSubcounty == 'Gombe ') {
      parishes = ['Buwambo', ' Gombe', ' Kavule'];
    } else if (selectedSubcounty == 'Kakiri') {
      parishes = ['Buwanuka', 'Kakiri', 'Kamuli'];
    } else if (selectedSubcounty == 'Kasanje') {
      parishes = [
        'Bulumbu',
        'Bussi',
        'Jjungo',
      ];
    }

    // ... Add more conditions for other subcounties

    return parishes.map((parish) {
      return DropdownMenuItem(
        value: parish,
        child: Text(parish),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> _getVillageItems(String? selectedParish) {
    List<String> villages = [];

    // Populate villages based on selected parish
    if (selectedParish == 'Bwaise') {
      villages = [
        'Bishop Mukwaya Zone I',
        'Bishop Mukwaya Zone II',
        'Bishop Mukwaya Zone III',
        'Bubajwe Zone A',
        'Bubajwe Zone B',
        'Bwaise 1',
        'Bwaise 2',
        'Industrial Area A',
        'Industrial Area B',
      ];
    } else if (selectedParish == 'Komamboga') {
      villages = [
        'Central Zone A',
        'Central Zone B',
        'Central Zone C',
        'Kanyanya',
        'Kanyanya-komamboga A',
        'Kanyanya-komamboga B',
      ];
    } else if (selectedParish == 'Mulago') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Kyambogo') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Luzira') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Bugolobi') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == ' Kabowa ') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Busega') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Kasubi') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == ' Kabalagala') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Buziga ') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Ggaba') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Central') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Bubyangu ') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Bumadanda') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == ' Jewa') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Bulweta ') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Bumuluya ') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Lwasso') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Bumutsopa') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Bunashimolo ') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Burukuru') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Buwambo') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == ' Gombe') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == ' Kavule') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Buwanuka') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Kakiri') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Bulumbu') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Bussi') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Jjungo') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    } else if (selectedParish == 'Kamuli') {
      villages = [
        'Beckry Zone',
        'Butaka Bukirwa A',
        'Butaka Bukirwa B',
        'Doctors Zone',
        'Hospital Zone',
        'Kaatale Zone',
        'Kafeero Zone',
        'Kibawo',
      ];
    }
    // ... Add more conditions for other parishes

    return villages.map((village) {
      return DropdownMenuItem(
        value: village,
        child: Text(village),
      );
    }).toList();
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
                                  items: [
                                    'Kampala',
                                    'Mbale',
                                    'Wakiso',
                                  ]
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
                                  items: _getCountyItems(
                                      householdData.selectedDistrict),
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
                                  items: _getSubcountyItems(
                                      householdData.selectedCounty),
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
                                  items: _getParishItems(
                                      householdData.selectedSubcounty),
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
                            items:
                                _getVillageItems(householdData.selectedParish),
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
