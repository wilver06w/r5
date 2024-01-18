import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class R5FirebaseInstance {
  R5FirebaseInstance._();
  static final _singleton = R5FirebaseInstance._();

  factory R5FirebaseInstance() => _singleton;

  late FirebaseAuth _firebaseAuth;
  late FirebaseFirestore _firebaseFirestore;

  FirebaseAuth get firebaseAuth => _firebaseAuth;
  FirebaseFirestore get firebaseFirestore => _firebaseFirestore;

  R5FirebaseInstance getInstance() {
    _singleton._firebaseAuth = FirebaseAuth.instance;
    _singleton._firebaseFirestore = FirebaseFirestore.instance;
    return _singleton;
  }
}
