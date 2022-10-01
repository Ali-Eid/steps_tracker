import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:step_tracker/core/error/exception.dart';

abstract class FireBaseAuthRemoteDataSource {
  // Future<User?> signInAnonymously();
  Future<UserCredential> signInAnonymously(String name);
}

class FireBaseAuthRemoteDataSourceImpl implements FireBaseAuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  FireBaseAuthRemoteDataSourceImpl(this.firebaseAuth, this.firestore);
  @override
  Future<UserCredential> signInAnonymously(String name) async {
    try {
      final response = await firebaseAuth.signInAnonymously();
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('users');
      collectionReference
          .doc(response.user!.uid)
          .set({'name': name, 'uid': response.user!.uid, 'allHealthPoint': 0});
      collectionReference
          .doc(response.user!.uid)
          .collection('myHealthPoint')
          .add({
        'HealthPoint': 0,
        'todaySteps': 0,
        'date': (DateTime.now()).toString().substring(0, 10),
        //without Package
      });
      return response;
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }
}
