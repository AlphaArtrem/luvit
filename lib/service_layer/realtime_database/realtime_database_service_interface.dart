import 'package:firebase_database/firebase_database.dart';

///Interface for Firebase Realtime Database service
abstract class RealtimeDatabaseServiceInterface {
  ///Constructor for [RealtimeDatabaseServiceInterface]
  RealtimeDatabaseServiceInterface(this.firebaseDatabase);

  ///Instance for [FirebaseDatabase]
  final FirebaseDatabase firebaseDatabase;

  ///Function to get [DatabaseReference] for the given [path]
  DatabaseReference getDbReference([String? path]) {
    throw UnimplementedError();
  }
}
