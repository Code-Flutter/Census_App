import 'package:census_app/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DatabaseService {
  final String? houseHoldUID = Uuid().v4();
  DatabaseService();
  // collection
  final CollectionReference householdCollection =
      FirebaseFirestore.instance.collection('Households');

  final CollectionReference inhabitantsCollection =
      FirebaseFirestore.instance.collection('Inhabitants');

  Future updateHouseholdData(
    String? nameOfHouseholdHead,
    String? typeOfDwelling,
    int? numberOfPeopleLivingIn,
    String? district,
    String? county,
    String? subcounty,
    String? parish,
    String? village,
  ) async {
    AuthService userUid = AuthService();
    return await householdCollection.doc().set({
      'Collector ID': await userUid.getUserUID(),
      'HouseHold ID': houseHoldUID,
      'Head of the HouseHold': nameOfHouseholdHead,
      'Type of Dwelling': typeOfDwelling,
      'Number of people living in Household': numberOfPeopleLivingIn,
      'District': district,
      'County': county,
      'Subcounty': subcounty,
      'Parish': parish,
      'Village': village
    });
  }

  Future updateInhabitantData(
    String firstName,
    String givenName,
    String lastName,
    int day,
    int month,
    int year,
    String gender,
    String maritalStatus,
    String educationLevel,
    String employmentStatus,
    String occupation,
    String citizenship,
    String ninNumber,
    String countryOfOrigin,
    String ethnicity,
    String languageSpoken,
    String religion,
    String migratoryStatus,
  ) async {
    AuthService userUid = AuthService();
    return await inhabitantsCollection.doc().set({
      'Collector ID': await userUid.getUserUID(),
      'HouseHold ID': houseHoldUID,
      'First Name': firstName,
      'Given Name': givenName,
      'Last Name': lastName,
      'Date of Birth': '$day/$month/$year',
      'Gender': gender,
      'Marital Status': maritalStatus,
      'Education Level': educationLevel,
      'Employment Status': employmentStatus,
      'Occupation': occupation,
      'Citizenship': citizenship,
      'NIN': ninNumber,
      'Country of Origin': countryOfOrigin,
      'Ethnicity': ethnicity,
      'Language Spoken': languageSpoken,
      'Religion': religion,
      'Migratory Status': migratoryStatus,
    });
  }
}
