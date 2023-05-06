import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coccidiosisdetection_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserRepository extends ChangeNotifier {
  bool isLoading = false;
  UserModel? userData;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    isLoading = true;
      notifyListeners();
    try {
      
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('users').doc(currentUser.uid).get();
        userData =   UserModel.fromSnap(documentSnapshot);
      log("${userData?.toJson()}");
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        isLoading = false;

        notifyListeners();
        return false;
      }
    } on FirebaseAuthException catch (e) {
      log('$e');
      isLoading = false;

      notifyListeners();
      return false;
    } catch (err) {
      isLoading = false;

      notifyListeners();
      return false;
    }
  }

  Future<bool> signUpUser({
    required String email,
    required String name,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      isLoading = true;

      notifyListeners();
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("auth done");

      UserModel user = UserModel(
          email: email,
          phoneNumber: phoneNumber,
          uid: cred.user!.uid,
          fullName: name);

      // adding user in our database
      await _firestore
          .collection("users")
          .doc(cred.user!.uid)
          .set(user.toJson());
      print("cloud firestore done");
      isLoading = false;

      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      log('$e');
      isLoading = false;

      notifyListeners();
      return false;
    } catch (err) {
      log("$err");
      return false;
    }
  }
}
