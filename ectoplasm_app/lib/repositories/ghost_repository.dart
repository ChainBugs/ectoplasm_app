import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skeleton_project/models/ghost.dart';

class GhostRepository {
  Future<List<Ghost>> getUsers() async {
    List<Ghost> ghosts = [];
    FirebaseFirestore.instance
        .collection('ghosts')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc != null) {
          final user = Ghost.fromFirebaseDocument(doc.data());
          ghosts.add(user);
        }
      });
    });
    final filteredUsers = ghosts.where((element) => element != null);
    return filteredUsers;
  }

  Future<Ghost> getGhost(String documentID) async {
    final ghost = await FirebaseFirestore.instance
        .collection('ghosts')
        .doc(documentID)
        .get()
        .then(
      (document) {
        return Ghost.fromFirebaseDocument(
          document.data(),
        );
      },
    );
    return ghost;
  }

  Future<void> addGhost(Map<String, dynamic> data) async {
    final ghost = data["name"].toString().toLowerCase();
    await FirebaseFirestore.instance
        .collection('ghosts')
        .doc(ghost)
        .set(data)
        .then((value) => print("User successfully added"))
        .catchError((error) => print("Error when adding new user: $error"));
  }
}
