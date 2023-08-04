import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  // collection
  final CollectionReference householdCollection =
      FirebaseFirestore.instance.collection('Households');

  Future updateHouseholdData(
    String nameOfHouseholdHead,
    String typeOfDwelling,
    int numberOfPeopleLivingIn,
    String district,
    String county,
    String subcounty,
    String parish,
    String village,
  ) async {
    return await householdCollection.doc(uid).set({
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
}
