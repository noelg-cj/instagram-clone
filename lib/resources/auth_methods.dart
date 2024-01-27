// import 'dart:typed_data';

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file
  }) async {
    print("Signup started");
    String res = "Some error occured";
    try {
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty && bio.isNotEmpty) {
        print("0");
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        print("1");
        String photoUrl = await StorageMethods().uploadImageToStorage('profilePics', file, false);
        print("2");
        await _firestore.collection("users").doc(cred.user!.uid).set({
          "username": username,
          "uid": cred.user!.uid,
          "email": email,
          "bio": bio,
          "followers": [],
          "following": [],
          "photoUrl": photoUrl,
        });
        res = "Success";
      }
    }
    catch(e) {
      res = e.toString();
    }
    print("Signing up ended");
    return res;
  }
}