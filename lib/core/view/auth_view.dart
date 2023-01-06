import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:coffecustomer/core/base/auth_base.dart';
import 'package:coffecustomer/core/model/customer_model.dart';
import 'package:coffecustomer/core/model/error_model.dart';
import 'package:coffecustomer/core/service/auth_service.dart';
import 'package:coffecustomer/error_code.dart';
import 'package:coffecustomer/locator.dart';

enum AuthProcess {
  idle,
  busy,
}

enum AuthState {
  authorized,
  auth,
  landing,
  intro,
}

class AuthView with ChangeNotifier implements AuthBase {
  AuthService authService = locator<AuthService>();

  AuthProcess _authProcess = AuthProcess.idle;
  AuthState _authState = AuthState.landing;

  CustomerModel? customerModel;

  AuthProcess get authProcess => _authProcess;

  set authProcess(AuthProcess value) {
    _authProcess = value;
    notifyListeners();
  }

  AuthState get authState => _authState;

  set authState(AuthState value) {
    _authState = value;
    notifyListeners();
  }

  AuthView() {
    getCurrentCustomer();
  }

  @override
  Future<Object?> getCurrentCustomer() async {
    try {
      authProcess = AuthProcess.busy;
      var res = await authService.getCurrentCustomer();
      if(res is CustomerModel){
        authState = AuthState.authorized;
        customerModel = res;
        debugPrint(
          "AuthView - Current Customer : $customerModel",
        );
        return customerModel;
      }else{
        authState = AuthState.auth;
        return res;
      }
    } catch (e) {
      debugPrint(
        "AuthView - Exception - getCurrentCustomer : ${e.toString()}",
      );
      return ErrorModel(message: e.toString(), code: errorCode);
    } finally {
      authProcess = AuthProcess.idle;
    }
  }

  @override
  Future<Object?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      authProcess = AuthProcess.busy;
      var res = await authService.signInWithEmailAndPassword(email, password);
      if (res is CustomerModel) {
        customerModel = res;
        authState = AuthState.authorized;
        return customerModel;
      } else {
        authState = AuthState.auth;
        return res;
      }
    } catch (e) {
      debugPrint(
        "AuthView - Exception - signInWithEmailAndPassword : ${e.toString()}",
      );
      return ErrorModel(message: e.toString(), code: errorCode);
    } finally {
      authProcess = AuthProcess.idle;
    }
  }

  @override
  Future signOut() async {
    try {
      await authService.signOut();
      authState = AuthState.auth;
      customerModel = null;
      debugPrint(
        "AuthView - signOut : $customerModel",
      );
    } catch (e) {
      debugPrint(
        "AuthView - Exception - signOut : ${e.toString()}",
      );
    }
  }

  @override
  Future<Object?> createUserWithEmailAndPassword(
      String email, String password, String nameSurname) async {
    try {
      authProcess = AuthProcess.busy;
      var res = await authService.createUserWithEmailAndPassword(
          email, password,nameSurname);
      if (res is CustomerModel) {
        customerModel = res;
        authState = AuthState.authorized;
        return customerModel;
      } else {
        authState = AuthState.auth;
        return res;
      }
    } catch (e) {
      debugPrint(
        "AuthView - Exception - createUserWithEmailAndPassword : ${e.toString()}",
      );
      return ErrorModel(message: e.toString(), code: errorCode);
    } finally {
      authProcess = AuthProcess.idle;
    }
  }

  @override
  Future<Object?> sendPasswordResetEmail(String email) async {
    try {
      authProcess = AuthProcess.busy;
      var res = await authService.sendPasswordResetEmail(email);
      if (res is bool) {
        return true;
      } else {
        return res;
      }
    } catch (e) {
      debugPrint(
        "AuthView - Exception - createUserWithEmailAndPassword : ${e.toString()}",
      );
      return ErrorModel(message: e.toString(), code: errorCode);
    } finally {
      authProcess = AuthProcess.idle;
    }
  }

}
