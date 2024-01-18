import 'package:firebase_auth/firebase_auth.dart';

class R5FirebaseInstance {
  R5FirebaseInstance._();
  static final _singleton = R5FirebaseInstance._();

  factory R5FirebaseInstance() => _singleton;

  late FirebaseAuth _firebaseAuth;

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  R5FirebaseInstance getInstance() {
    _singleton._firebaseAuth = FirebaseAuth.instance;
    return _singleton;
  }
}
