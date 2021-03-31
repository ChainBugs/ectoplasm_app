import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skeleton_project/models/investigator.dart';

class InvestigatorRepository {
  Future<List<Investigator>> getInvestigators() async {
    List<Investigator> investigators = [];
    FirebaseFirestore.instance
        .collection('investigators')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc != null) {
          final user = Investigator.fromFirebaseDocument(doc.data());
          investigators.add(user);
        }
      });
    });
    final filteredUsers = investigators.where((element) => element != null);
    return filteredUsers;
  }

  Future<Investigator> getInvestigator(String documentID) async {
    final investigator = await FirebaseFirestore.instance
        .collection('investigators')
        .doc(documentID)
        .get()
        .then(
      (document) {
        return Investigator.fromFirebaseDocument(
          document.data(),
        );
      },
    );
    return investigator;
  }

  Future<void> addInvestigator(Map<String, dynamic> data) async {
    final role = data["role"].toString().toLowerCase();
    await FirebaseFirestore.instance
        .collection('investigators')
        .doc(role)
        .set(data)
        .then((value) => print("User successfully added"))
        .catchError((error) => print("Error when adding new user: $error"));
  }
}
