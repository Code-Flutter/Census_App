import 'package:flutter/material.dart';

class PersonalInformationForm extends StatefulWidget {
  @override
  _PersonalInformationFormState createState() =>
      _PersonalInformationFormState();
}

class _PersonalInformationFormState extends State<PersonalInformationForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController givenNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  bool isMale = false;
  bool isFemale = false;
  String maritalStatus = '';
  String educationLevel = '';
  bool isEmployed = false;
  bool isUnemployed = false;
  bool isSelfEmployed = false;
  final TextEditingController occupationController = TextEditingController();
  bool isCitizen = false;
  bool isNonCitizen = false;
  final TextEditingController ninController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController ethnicityController = TextEditingController();
  final TextEditingController languageSpokenController =
      TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController migratoryStatusController =
      TextEditingController();

  String calculateAge() {
    final currentDate = DateTime.now();
    final int birthYear = int.tryParse(yearController.text) ?? 0;
    final int birthMonth = int.tryParse(monthController.text) ?? 1;
    final int birthDay = int.tryParse(dayController.text) ?? 1;

    final dob = DateTime(birthYear, birthMonth, birthDay);

    int age = currentDate.year - dob.year;

    if (currentDate.month < dob.month ||
        (currentDate.month == dob.month && currentDate.day < dob.day)) {
      age--;
    }

    return age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Information')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(labelText: 'First Name'),
                  ),
                ),
                SizedBox(width: 16.0),
                Flexible(
                  child: TextFormField(
                    controller: givenNameController,
                    decoration: InputDecoration(labelText: 'Given Name'),
                  ),
                ),
                SizedBox(width: 16.0),
                Flexible(
                  child: TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(labelText: 'Last Name'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextFormField(
                    controller: dayController,
                    decoration: InputDecoration(labelText: 'Day'),
                  ),
                ),
                SizedBox(width: 16.0),
                Flexible(
                  child: TextFormField(
                    controller: monthController,
                    decoration: InputDecoration(labelText: 'Month'),
                  ),
                ),
                SizedBox(width: 16.0),
                Flexible(
                  child: TextFormField(
                    controller: yearController,
                    decoration: InputDecoration(labelText: 'Year'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // TextFormField(
            //   // controller: ageController,
            //   decoration: InputDecoration(labelText: 'Age'),
            //   readOnly: true,
            //   initialValue: calculateAge(),
            // ),
            SizedBox(height: 16.0),
            Text('Gender'),
            Row(
              children: [
                Checkbox(
                  value: isMale,
                  onChanged: (newValue) {
                    setState(() {
                      isMale = newValue ?? false;
                      isFemale = !isMale;
                    });
                  },
                ),
                Text('Male'),
                SizedBox(width: 16.0),
                Checkbox(
                  value: isFemale,
                  onChanged: (newValue) {
                    setState(() {
                      isFemale = newValue ?? false;
                      isMale = !isFemale;
                    });
                  },
                ),
                Text('Female'),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Marital Status'),
            Row(
              children: [
                Checkbox(
                  value: maritalStatus == 'Married',
                  onChanged: (newValue) {
                    setState(() {
                      maritalStatus = newValue == true ? 'Married' : '';
                    });
                  },
                ),
                Text('Married'),
                SizedBox(width: 16.0),
                Checkbox(
                  value: maritalStatus == 'Single',
                  onChanged: (newValue) {
                    setState(() {
                      maritalStatus = newValue == true ? 'Single' : '';
                    });
                  },
                ),
                Text('Single'),
                SizedBox(width: 16.0),
                Checkbox(
                  value: maritalStatus == 'Cohabiting',
                  onChanged: (newValue) {
                    setState(() {
                      maritalStatus = newValue == true ? 'Cohabiting' : '';
                    });
                  },
                ),
                Text('Cohabiting'),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Education Level'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile(
                  title: Text('Not Educated'),
                  value: 'Not Educated',
                  groupValue: educationLevel,
                  onChanged: (newValue) {
                    setState(() {
                      educationLevel = newValue.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Primary Level'),
                  value: 'Primary Level',
                  groupValue: educationLevel,
                  onChanged: (newValue) {
                    setState(() {
                      educationLevel = newValue.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Secondary Level'),
                  value: 'Secondary Level',
                  groupValue: educationLevel,
                  onChanged: (newValue) {
                    setState(() {
                      educationLevel = newValue.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('University'),
                  value: 'University',
                  groupValue: educationLevel,
                  onChanged: (newValue) {
                    setState(() {
                      educationLevel = newValue.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Vocational'),
                  value: 'Vocational',
                  groupValue: educationLevel,
                  onChanged: (newValue) {
                    setState(() {
                      educationLevel = newValue.toString();
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Employment Status'),
            Row(
              children: [
                Checkbox(
                  value: isEmployed,
                  onChanged: (newValue) {
                    setState(() {
                      isEmployed = newValue ?? false;
                      isUnemployed = !isEmployed;
                      isSelfEmployed = !isEmployed;
                      if (!isEmployed) {
                        occupationController.clear();
                      }
                    });
                  },
                ),
                Text('Employed'),
                SizedBox(width: 16.0),
                Checkbox(
                  value: isUnemployed,
                  onChanged: (newValue) {
                    setState(() {
                      isUnemployed = newValue ?? false;
                      isEmployed = !isUnemployed;
                      isSelfEmployed = !isUnemployed;
                      if (!isUnemployed) {
                        occupationController.clear();
                      }
                    });
                  },
                ),
                Text('Unemployed'),
                SizedBox(width: 16.0),
                Checkbox(
                  value: isSelfEmployed,
                  onChanged: (newValue) {
                    setState(() {
                      isSelfEmployed = newValue ?? false;
                      isEmployed = !isSelfEmployed;
                      isUnemployed = !isSelfEmployed;
                      if (!isSelfEmployed) {
                        occupationController.clear();
                      }
                    });
                  },
                ),
                Text('Self'),
              ],
            ),
            if (isEmployed || isSelfEmployed) ...[
              SizedBox(height: 16.0),
              TextFormField(
                controller: occupationController,
                decoration: InputDecoration(labelText: 'Occupation'),
              ),
            ],
            SizedBox(height: 16.0),
            Text('Citizenship'),
            Row(
              children: [
                Checkbox(
                  value: isCitizen,
                  onChanged: (newValue) {
                    setState(() {
                      isCitizen = newValue ?? false;
                      isNonCitizen = !isCitizen;
                      if (!isCitizen) {
                        ninController.clear();
                      }
                    });
                  },
                ),
                Text('Citizen'),
                SizedBox(width: 16.0),
                Checkbox(
                  value: isNonCitizen,
                  onChanged: (newValue) {
                    setState(() {
                      isNonCitizen = newValue ?? false;
                      isCitizen = !isNonCitizen;
                      if (!isNonCitizen) {
                        countryController.clear();
                      }
                    });
                  },
                ),
                Text('Non Citizen'),
              ],
            ),
            if (isCitizen) ...[
              SizedBox(height: 16.0),
              TextFormField(
                controller: ninController,
                decoration: InputDecoration(labelText: 'NIN Number'),
              ),
            ],
            if (isNonCitizen) ...[
              SizedBox(height: 16.0),
              TextFormField(
                controller: countryController,
                decoration: InputDecoration(labelText: 'Country of Origin'),
              ),
            ],
            SizedBox(height: 16.0),
            TextFormField(
              controller: ethnicityController,
              decoration: InputDecoration(labelText: 'Ethnicity/Race'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: languageSpokenController,
              decoration: InputDecoration(labelText: 'Language Spoken'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: religionController,
              decoration: InputDecoration(labelText: 'Religion'),
            ),
            SizedBox(height: 16.0),
            if (!isCitizen) ...[
              TextFormField(
                controller: migratoryStatusController,
                decoration: InputDecoration(labelText: 'Migratory Status'),
              ),
            ],
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                        context); // Discard button goes back to the previous page
                  },
                  child: Text('Discard'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save button returns to the previous page and sends the name back
                    Navigator.pop(context, firstNameController.text);
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
