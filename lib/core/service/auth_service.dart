import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coffecustomer/core/base/auth_base.dart';
import 'package:coffecustomer/core/model/customer_model.dart';
import 'package:coffecustomer/core/model/error_model.dart';
import 'package:coffecustomer/error_code.dart';
import 'package:coffecustomer/firestore_paths.dart';

class AuthService implements AuthBase {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Object?> getCurrentCustomer() async {
    try {
      User? user = firebaseAuth.currentUser;

      if (user != null) {
        CollectionReference customer =
            firebaseFirestore.collection(customerPath);
        DocumentSnapshot documentSnapshot = await customer.doc(user.uid).get();

        if (documentSnapshot.exists) {
          Map<String, dynamic> map =
              documentSnapshot.data() as Map<String, dynamic>;
          return CustomerModel.fromJson(map);
        }
      }
      return ErrorModel(message: userNotFoundMessage, code: userNotFoundCode);
    } on FirebaseAuthException catch (e) {
      return ErrorModel(message: e.message ?? errorMessage, code: e.code);
    }
  }

  @override
  Future<Object?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return getCurrentCustomer();
    } on FirebaseAuthException catch (e) {
      return ErrorModel(message: e.message ?? errorMessage, code: e.code);
    }
  }

  @override
  Future signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<Object?> createUserWithEmailAndPassword(
      String email, String password, String nameSurname) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      CollectionReference customers =
          firebaseFirestore.collection(customerPath);
      await customers.doc(firebaseAuth.currentUser!.uid).set({
        "uid": firebaseAuth.currentUser!.uid,
        "email": email,
        "nameSurname": nameSurname,
      });
      return getCurrentCustomer();
    } on FirebaseAuthException catch (e) {
      return ErrorModel(message: e.message ?? errorMessage, code: e.code);
    }
  }

  @override
  Future<Object?> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      return ErrorModel(message: e.message ?? errorMessage, code: e.code);
    }
  }
}
