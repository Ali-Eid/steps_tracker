import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:step_tracker/core/constants/constatns.dart';

abstract class FireBaseStepsRemoteDataSource {
  Future<void> saveSteps(int steps);
  Future<Stream<int>> countSteps(int steps);
}

class FireBaseStepsRemoteDataSourceImpl
    implements FireBaseStepsRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  FireBaseStepsRemoteDataSourceImpl(this.firebaseFirestore);
  @override
  Future<void> saveSteps(int steps) async {
    CollectionReference collectionReference =
        firebaseFirestore.collection('users');
    collectionReference.doc(token).collection('myHealthPoint').add({
      'HealthPoint': steps ~/ 100,
      'todaySteps': steps,
      'date': (DateTime.now()).toString().substring(0, 10)
    });
  }

  @override
  Future<Stream<int>> countSteps(int steps) async {
    Stream<int>? steps;
    CollectionReference collectionReference =
        firebaseFirestore.collection('users');
    collectionReference.snapshots().listen((event) {
      event.docs.map((e) {
        steps = e['todaySteps'];
      });
    });
    return steps!;
  }
}
