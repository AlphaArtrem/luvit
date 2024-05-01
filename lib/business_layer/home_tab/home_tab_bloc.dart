import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luvit/data_layer/models/user_profile_data.dart';
import 'package:luvit/presentation_layer/home/tabs/home_tab/home_tab.dart';
import 'package:luvit/repository/user_data/user_data_repository.dart';
import 'package:luvit/service_layer/service_locator.dart';

part 'home_tab_events.dart';
part 'home_tab_state.dart';

///[Bloc] for [HomeTab]
class HomeTabBloc extends Bloc<HomeTabEvent, HomeTabState> {
  ///[HomeTabBloc] default constructor which takes in [HomeTabState]
  ///as a required parameter
  HomeTabBloc(this.userDataRepository) : super(HomeTabStateLoading()) {
    on<HomeTabEventFetch>(_fetchUserProfiles);
    on<HomeTabEventError>(
      (event, emit) => emit(HomeTabStateError(event.error)),
    );
    on<HomeTabEventDataFetched>(
      (event, emit) => emit(HomeTabStateDataFetched(event.profiles)),
    );
    on<HomeTabEventRemoveProfile>(_removeProfile);
    add(HomeTabEventFetch());
  }

  ///Instance of [UserDataRepository] to fetch user profiles from
  ///realtime database
  final UserDataRepository userDataRepository;

  void _fetchUserProfiles(
    HomeTabEventFetch event,
    Emitter<HomeTabState> emit,
  ) {
    userDataRepository.getAllUserProfiles().listen((event) {
      final userProfiles = <UserProfileData>[];
      var error = '';
      if (event.snapshot.value != null) {
        final data = event.snapshot.value! as Map;
        for (final key in data.keys) {
          try {
            final profile = data[key] as Map;
            userProfiles.add(
              UserProfileData.fromJson(profile.cast<String, dynamic>()),
            );
          } catch (e) {
            error = 'Unable to parse data';
            apiService.log.d(e);
          }
        }
      }
      if (userProfiles.isNotEmpty) {
        add(HomeTabEventDataFetched(userProfiles));
      } else {
        add(
          HomeTabEventError(
            error.isNotEmpty ? error : 'Something went wrong',
          ),
        );
      }
    });
  }

  void _removeProfile(
    HomeTabEventRemoveProfile event,
    Emitter<HomeTabState> emit,
  ) {
    if (state is HomeTabStateDataFetched) {
      final state = this.state as HomeTabStateDataFetched;
      state.profiles.removeAt(event.index);
      final profiles = List<UserProfileData>.from(state.profiles);
      emit(state.copyWith(profiles));
    }
  }
}
