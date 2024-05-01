import 'package:firebase_database/firebase_database.dart';
import 'package:luvit/service_layer/realtime_database/realtime_database_service_interface.dart';

///Abstract class to get user data from [FirebaseDatabase]
abstract class UserDataRepositoryInterface {
  ///Default constructor of [UserDataRepositoryInterface]
  UserDataRepositoryInterface(this.realtimeDatabaseService);

  ///Instance of [RealtimeDatabaseServiceInterface] implemented class to
  ///connect and fetch data from [FirebaseDatabase]
  final RealtimeDatabaseServiceInterface realtimeDatabaseService;

  ///Get all user profiles as a [Stream] of [DatabaseEvent]
  Stream<DatabaseEvent> getAllUserProfiles() {
    throw UnimplementedError();
  }
}
