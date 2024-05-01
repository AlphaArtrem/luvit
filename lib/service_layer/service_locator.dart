import 'package:get_it/get_it.dart';
import 'package:luvit/business_layer/home_tab/home_tab_bloc.dart';
import 'package:luvit/business_layer/theme/theme_cubit.dart';
import 'package:luvit/repository/user_data/user_data_repository.dart';
import 'package:luvit/service_layer/api_service/api_service.dart';
import 'package:luvit/service_layer/app_config/app_config_service_impl.dart';
import 'package:luvit/service_layer/navigation/navigation_sevice.dart';
import 'package:luvit/service_layer/realtime_database/realtime_database_service.dart';
import 'package:luvit/service_layer/routes/app_router_service.dart';

///Service locator to get dependencies
GetIt serviceLocator = GetIt.instance;

///Service to manage in app navigation
final navigationService = serviceLocator<NavigationService>();

///Service to manage app theme
final themeService = serviceLocator<ThemeCubit>();

///Service to manage API calls
final apiService = serviceLocator<ApiService>();

///Service to manage app configurations
final appConfig = serviceLocator<AppConfigService>();

///Service to manage Realtime Database requests
final realtimeDatabaseService = serviceLocator<RealtimeDatabaseService>();

///Function to setup app services. Should be called before running the app.
Future<void> setupServiceLocator() async {
  serviceLocator
    ..registerSingleton(AppRoutersService())
    ..registerSingleton(AppConfigService())
    ..registerSingleton(NavigationService(serviceLocator<AppRoutersService>()))
    ..registerSingleton(ThemeCubit(ThemeState(isLight: false)))
    ..registerSingleton(ApiService(appConfig))
    ..registerSingleton(RealtimeDatabaseService())
    ..registerLazySingleton(() => UserDataRepository(realtimeDatabaseService))
    ..registerLazySingleton<HomeTabBloc>(
      () => HomeTabBloc(serviceLocator<UserDataRepository>()),
    );
}
