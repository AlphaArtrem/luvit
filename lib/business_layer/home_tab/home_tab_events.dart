part of 'home_tab_bloc.dart';

///Events for [HomeTabBloc]
abstract class HomeTabEvent extends Equatable {}

///Events to fetch user profiles form realtime database
/// for [HomeTabBloc]
class HomeTabEventFetch implements HomeTabEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

///Events to show error for [HomeTabBloc]
class HomeTabEventError implements HomeTabEvent {
  ///Constructor for [HomeTabEventError]
  HomeTabEventError(this.error);

  ///Reason for error
  final String error;

  @override
  List<Object?> get props => [error];

  @override
  bool? get stringify => true;
}

///Data loaded event for [HomeTabBloc]
class HomeTabEventDataFetched implements HomeTabEvent {
  ///Constructor for [HomeTabEventRemoveProfile]
  HomeTabEventDataFetched(this.profiles);

  ///[List] of [UserProfileData]
  final List<UserProfileData> profiles;

  @override
  List<Object?> get props => [profiles];

  @override
  bool? get stringify => true;
}

///Remove profile event for [HomeTabBloc]
class HomeTabEventRemoveProfile implements HomeTabEvent {
  ///Constructor for [HomeTabEventRemoveProfile]
  HomeTabEventRemoveProfile(this.index);

  ///Index of [UserProfileData] to remove
  final int index;

  @override
  List<Object?> get props => [index];

  @override
  bool? get stringify => true;
}
