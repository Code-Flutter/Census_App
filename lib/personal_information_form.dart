import 'package:flutter/material.dart';

class PersonalInformation {
  String firstName = '';
  String givenName = '';
  String lastName = '';
  int day = 0;
  int month = 0;
  int year = 0;
  String gender = '';
  String maritalStatus = '';
  String educationLevel = '';
  String employmentStatus = '';
  String occupation = '';
  String citizenship = '';
  String ninNumber = '';
  String countryOfOrigin = '';
  String ethnicity = '';
  String languageSpoken = '';
  String religion = '';
  String migratoryStatus = '';
}

class PersonalInformationForm extends StatefulWidget {
  @override
  PersonalInformationFormState createState() => PersonalInformationFormState();
}

class PersonalInformationFormState extends State<PersonalInformationForm> {
  PersonalInformation personalInfo = PersonalInformation();
  // Variables to store the data collected from the form fields
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController givenNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  bool isMale = false;
  bool isFemale = false;
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
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: SingleChildScrollView(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'First Name is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Flexible(
                    child: TextFormField(
                      controller: givenNameController,
                      decoration: InputDecoration(labelText: 'Given Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Given Name is required';
                        }
                        return null;
                      },
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
                      decoration: InputDecoration(labelText: 'DD'),
                      maxLength: 2,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Flexible(
                    child: TextFormField(
                      controller: monthController,
                      decoration: InputDecoration(labelText: 'MM'),
                      maxLength: 2,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Flexible(
                    child: TextFormField(
                      controller: yearController,
                      decoration: InputDecoration(labelText: 'Year'),
                      maxLength: 4,
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
                    value: personalInfo.maritalStatus == 'Married',
                    onChanged: (newValue) {
                      setState(() {
                        personalInfo.maritalStatus =
                            newValue == true ? 'Married' : '';
                      });
                    },
                  ),
                  Text('Married'),
                  SizedBox(width: 16.0),
                  Checkbox(
                    value: personalInfo.maritalStatus == 'Single',
                    onChanged: (newValue) {
                      setState(() {
                        personalInfo.maritalStatus =
                            newValue == true ? 'Single' : '';
                      });
                    },
                  ),
                  Text('Single'),
                  SizedBox(width: 16.0),
                  Checkbox(
                    value: personalInfo.maritalStatus == 'Cohabiting',
                    onChanged: (newValue) {
                      setState(() {
                        personalInfo.maritalStatus =
                            newValue == true ? 'Cohabiting' : '';
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
                    groupValue: personalInfo.educationLevel,
                    onChanged: (newValue) {
                      setState(() {
                        personalInfo.educationLevel = newValue.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Primary Level'),
                    value: 'Primary Level',
                    groupValue: personalInfo.educationLevel,
                    onChanged: (newValue) {
                      setState(() {
                        personalInfo.educationLevel = newValue.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Secondary Level'),
                    value: 'Secondary Level',
                    groupValue: personalInfo.educationLevel,
                    onChanged: (newValue) {
                      setState(() {
                        personalInfo.educationLevel = newValue.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('University'),
                    value: 'University',
                    groupValue: personalInfo.educationLevel,
                    onChanged: (newValue) {
                      setState(() {
                        personalInfo.educationLevel = newValue.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Vocational'),
                    value: 'Vocational',
                    groupValue: personalInfo.educationLevel,
                    onChanged: (newValue) {
                      setState(() {
                        personalInfo.educationLevel = newValue.toString();
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
                  maxLength: 14,
                  validator: (value) {
                    if (value?.isEmpty == true) {
                      return 'NIN Number is required'; // Custom error message for required field
                    } else if (value?.length != 14) {
                      return 'NIN Number must be exactly 14 characters';
                    }
                    return null; // Return null if validation passes
                  },
                ),
              ],
              // if (isNonCitizen) ...[
              //   SizedBox(height: 16.0),
              //   TextFormField(
              //     controller: countryController,
              //     decoration: InputDecoration(labelText: 'Country of Origin'),
              //   ),
              // ],
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
                      if (_formKey.currentState?.validate() == true) {
                        // Save button returns to the previous page and sends the data back
                        setState(() {
                          personalInfo.firstName = firstNameController.text;
                          personalInfo.givenName = givenNameController.text;
                          personalInfo.lastName = lastNameController.text;
                          personalInfo.day =
                              int.tryParse(dayController.text) ?? 0;
                          personalInfo.month =
                              int.tryParse(monthController.text) ?? 0;
                          personalInfo.year =
                              int.tryParse(yearController.text) ?? 0;
                          personalInfo.gender = isMale ? 'Male' : 'Female';
                          personalInfo.employmentStatus = isEmployed
                              ? 'Employed'
                              : (isUnemployed ? 'Unemployed' : 'Self-Employed');
                          personalInfo.citizenship =
                              isCitizen ? 'Citizen' : 'Non Citizen';
                          personalInfo.ethnicity = ethnicityController.text;
                          personalInfo.languageSpoken =
                              languageSpokenController.text;
                          personalInfo.religion = religionController.text;
                          if (isEmployed || isSelfEmployed) {
                            personalInfo.occupation = occupationController.text;
                          }
                          if (isCitizen) {
                            personalInfo.ninNumber = ninController.text;
                          } else {
                            personalInfo.countryOfOrigin =
                                countryController.text;
                          }
                          if (!isCitizen) {
                            personalInfo.migratoryStatus =
                                migratoryStatusController.text;
                          }
                        });
                        Navigator.pop(context, personalInfo);
                      }
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
