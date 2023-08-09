import 'package:Census/database/database.dart';
import 'package:Census/navrbarpage.dart';
import 'package:flutter/material.dart';
import 'personal_information_form.dart';
import 'census_add.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key, this.houseHoldData, this.personalInformation});
  final HouseHoldData? houseHoldData;
  final PersonalInformation? personalInformation;

  // final int numberOfPeople;
  // MembersPage({required this.numberOfPeople});

  @override
  MembersPageState createState() => MembersPageState();
}

class MembersPageState extends State<MembersPage> {
  DatabaseService newRecord = DatabaseService();
  List<PersonalInformation> registeredPeople = [];

  // Household information and other details
  String nameOfHeadOfHousehold = '';
  String addressOfHousehold = '';
  String typeOfDwelling = '';
  int numberOfPeopleInHousehold = 0;
  bool hasElectricity = false;
  bool hasWater = false;
  bool hasHealthCare = false;
  String typeOfOwnership = '';

  void _saveDetails() {
    // Implement the saving of details here
    // You can use the data collected in the Household Information and Personal Information forms
    // to save the details in a database or send it to a server.
    // For simplicity, let's just print the details to the console.

    print('Household Information:');
    print('Name of Head of Household: $nameOfHeadOfHousehold');
    print('Address of Household: $addressOfHousehold');
    print('Type of Dwelling: $typeOfDwelling');
    print('Number of People in Household: $numberOfPeopleInHousehold');
    print('Has Electricity: $hasElectricity');
    print('Has Water: $hasWater');
    print('Has Health Care: $hasHealthCare');
    print('Type of Ownership: $typeOfOwnership');

    print('Registered People:');
    for (var person in registeredPeople) {
      print(person);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registered Members')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: registeredPeople.length + 1,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          if (index == 0) {
            // Show the "Add Person" grid
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalInformationForm(),
                  ),
                ).then((newPerson) {
                  // After returning from the PersonalInformationForm page,
                  // add the new person to the list of registered people
                  if (newPerson != null) {
                    setState(() {
                      registeredPeople.add(newPerson);
                    });
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          } else {
            // Show the grid for the registered people
            PersonalInformation personName = registeredPeople[index - 1];
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  personName.firstName,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        // onPressed: _saveDetails,
        onPressed: () async {
          await newRecord.updateHouseholdData(
              widget.houseHoldData?.headOfHousehold,
              widget.houseHoldData?.typeOfDwelling,
              widget.houseHoldData?.numberOfPeople,
              widget.houseHoldData?.selectedDistrict,
              widget.houseHoldData?.selectedCounty,
              widget.houseHoldData?.selectedSubcounty,
              widget.houseHoldData?.selectedParish,
              widget.houseHoldData?.selectedVillage);

          for (int i = 0; i < registeredPeople.length; i++) {
            await newRecord.updateInhabitantData(
                registeredPeople[i].firstName,
                registeredPeople[i].givenName,
                registeredPeople[i].lastName,
                registeredPeople[i].day,
                registeredPeople[i].month,
                registeredPeople[i].year,
                registeredPeople[i].gender,
                registeredPeople[i].maritalStatus,
                registeredPeople[i].educationLevel,
                registeredPeople[i].employmentStatus,
                registeredPeople[i].occupation,
                registeredPeople[i].citizenship,
                registeredPeople[i].ninNumber,
                registeredPeople[i].countryOfOrigin,
                registeredPeople[i].ethnicity,
                registeredPeople[i].languageSpoken,
                registeredPeople[i].religion,
                registeredPeople[i].migratoryStatus);
          }
          ;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        label: const Text('Save Details'),
        icon: const Icon(Icons.save),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
