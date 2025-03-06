// lib/GentleCuts.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GentleCutsFirebase {
  // Initialize Firebase
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  // Firestore instance
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Firebase Auth instance
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign Up a new user
  static Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Sign-Up Error: $e');
      return null;
    }
  }

  // Sign In an existing user
  static Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Sign-In Error: $e');
      return null;
    }
  }

  // Sign Out
  static Future<void> signOut() async {
    await _auth.signOut();
  }

  // Add user data to Firestore
  static Future<void> addUserData(String userId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(userId).set(data);
      print('User data added successfully.');
    } catch (e) {
      print('Error adding user data: $e');
    }
  }

  // Get user data from Firestore
  static Future<DocumentSnapshot> getUserData(String userId) async {
    return await _firestore.collection('users').doc(userId).get();
  }

  // Update user data
  static Future<void> updateUserData(String userId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(userId).update(data);
      print('User data updated successfully.');
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

  // Delete user data
  static Future<void> deleteUserData(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
      print('User data deleted successfully.');
    } catch (e) {
      print('Error deleting user data: $e');
    }
  }
}
