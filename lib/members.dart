import 'package:flutter/material.dart';
import 'personal_information_form.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  // final int numberOfPeople;
  // MembersPage({required this.numberOfPeople});

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  List<String> registeredPeople = [];

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
                    builder: (context) =>  PersonalInformationForm(),
                  ),
                ).then((newPerson) {
                  // After returning from the PersonalInformationForm page,
                  // add the new person to the list of registered people
                  if (newPerson != null && newPerson.isNotEmpty) {
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
            final personName = registeredPeople[index - 1];
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  personName,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _saveDetails,
        label: const Text('Save Details'),
        icon: const Icon(Icons.save),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
