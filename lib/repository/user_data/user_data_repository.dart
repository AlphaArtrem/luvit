import 'package:firebase_database/firebase_database.dart';
import 'package:luvit/repository/user_data/user_data_repository_interface.dart';
import 'package:luvit/service_layer/realtime_database/realtime_database_service.dart';

///Implementation of [UserDataRepositoryInterface] to get user data from
///[FirebaseDatabase]
class UserDataRepository implements UserDataRepositoryInterface {
  ///Default constructor for [UserDataRepository]
  UserDataRepository(this.realtimeDatabaseService);

  @override
  RealtimeDatabaseService realtimeDatabaseService;

  @override
  Stream<DatabaseEvent> getAllUserProfiles() {
    return realtimeDatabaseService.getDbReference('data').onValue;
  }
}
