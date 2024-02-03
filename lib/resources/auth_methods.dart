import 'dart:collection';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishstudy/resources/storage_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:englishstudy/models/user.dart' as model;
class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async{
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await _firestore.collection("users").doc(currentUser.uid).get();
    return model.User.fronSnap(snap);
  }


  // sign up user
Future<String> signupUser({
      required String email,
      required String password,
      required String username,
      required Uint8List file

  }) async {
    String res = "Some error occurred";
    try{
      if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || file != null){
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(cred.user!.uid);
        String photoUrl = await StorageMethods()
                                  .uploadImageToStorage('profilePics', file, false);
        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          photoUrl: photoUrl
        );

        await _firestore.collection("users").doc(cred.user!.uid).set(user.toJson());
        return "success";
      }
    }catch(e){
      print(e);
      res =  e.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
        UserCredential cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
        print(cred.user!.uid);
        return "success";
      }else {
        res = "Please enter all the fields";
      }
    }catch(e){
      print(e);
      res =  e.toString();
    }
    return res;
  }

}