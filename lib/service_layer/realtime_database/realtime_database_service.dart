import 'package:firebase_database/firebase_database.dart';
import 'package:luvit/service_layer/realtime_database/realtime_database_service_interface.dart';

///Implementation of [RealtimeDatabaseServiceInterface] for Firebase Realtime
///Database service
class RealtimeDatabaseService implements RealtimeDatabaseServiceInterface {
  @override
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  @override
  DatabaseReference getDbReference([String? path]) {
    return firebaseDatabase.ref(path);
  }
}
