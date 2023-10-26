import 'package:assignment/app/core/helpers/firebase_error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/helpers/prefs.dart';
import '../../data/dtos/raw_data.dart';

class AuthController extends GetxController {
  final PrefRepository _prefRepository;
  final FirebaseAuth _firebaseAuth;
  AuthController(
      {FirebaseAuth? firebaseAuth,
      PrefRepository? prefRepository,
      FirebaseFirestore? userCollectionRef})
      : _prefRepository = prefRepository ?? PrefRepository(),
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  RxBool showPassWord = true.obs;

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  Future<RawData> logOut() async {
    try {
      await _firebaseAuth.signOut();
      return RawData(operationResult: OperationResult.success, data: true);
    } on FirebaseAuthException catch (e) {
      String message = e.getErrorMessage();

      return RawData(operationResult: OperationResult.fail, data: message);
    } catch (e) {
      return RawData(operationResult: OperationResult.fail, data: e.toString());
    }
  }

  Future<RawData> loginWithEmail(
      {required String email, required String password}) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      await _prefRepository.saveToken(user.credential!.token.toString());
      String userUid = user.user!.uid;
      await _prefRepository.saveToken(userUid);
      return RawData(operationResult: OperationResult.success, data: user.user);
    } on FirebaseAuthException catch (e) {
      String message = e.getErrorMessage();
      return RawData(operationResult: OperationResult.fail, data: message);
    } catch (e) {
      return RawData(operationResult: OperationResult.fail, data: e.toString());
    }
  }

  Future<RawData> signupWithEmail(
      {required String email, required String password}) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      String userUid = user.user!.uid;
      await _prefRepository.saveToken(userUid);
      return RawData(operationResult: OperationResult.success, data: user.user);
    } on FirebaseAuthException catch (e) {
      String message = e.getErrorMessage();

      return RawData(operationResult: OperationResult.fail, data: message);
    } catch (e) {
      return RawData(operationResult: OperationResult.fail, data: e.toString());
    }
  }
}
