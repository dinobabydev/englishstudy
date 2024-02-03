import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String username;
  final String email;
  final String uid;
  final String photoUrl;

  User({
    required this.email,
    required this.photoUrl,
    required this.username,
    required this.uid,
  });


  Map<String, dynamic> toJson() =>{
    "username" : username,
    "email" : email,
    "photoUrl" : photoUrl,
    "uid" : uid,
  };

  static User fronSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        email: snapshot["email"],
        photoUrl: snapshot["photoUrl"],
        username: snapshot["username"],
        uid: snapshot["uid"],
    );
  }
}