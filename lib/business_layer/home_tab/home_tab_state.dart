part of 'home_tab_bloc.dart';

///abstract state for [HomeTabBloc]
abstract class HomeTabState extends Equatable {
  @override
  List<Object?> get props => [];
}

///Initial state for [HomeTabBloc]
class HomeTabStateLoading implements HomeTabState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

///Error state for [HomeTabBloc]
class HomeTabStateError implements HomeTabState {
  ///Constructor for [HomeTabStateError]
  HomeTabStateError(this.error);

  ///Reason for error
  final String error;

  @override
  List<Object?> get props => [error];

  @override
  bool? get stringify => true;
}

///Data loaded state for [HomeTabBloc]
class HomeTabStateDataFetched implements HomeTabState {
  ///Constructor for [HomeTabStateDataFetched]
  HomeTabStateDataFetched(this.profiles);

  ///Reason for error
  final List<UserProfileData> profiles;

  ///Copy constructor for [HomeTabStateDataFetched]
  HomeTabStateDataFetched copyWith(List<UserProfileData>? profiles) {
    return HomeTabStateDataFetched(profiles ?? this.profiles);
  }

  @override
  List<Object?> get props => [profiles];

  @override
  bool? get stringify => true;
}
