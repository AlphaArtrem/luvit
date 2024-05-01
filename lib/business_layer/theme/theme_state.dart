part of 'theme_cubit.dart';

///App theme state
class ThemeState extends Equatable {
  ///Default constructor for [ThemeState] takes in [isLight] parameter to
  ///determine app colors accordingly
  ThemeState({required this.isLight}) {
    splashScreenBackground =
        isLight ? const Color(0xFF7555CF) : const Color(0XFF0E0D0D);

    homeScreenBackground =
        isLight ? const Color(0xFF7555CF) : const Color(0XFF0E0D0D);

    primaryTextColor = isLight ? Colors.white : const Color(0XFFFCFCFC);

    secondaryTextColor =
        isLight ? Colors.white.withOpacity(0.75) : const Color(0XFFD9D9D9);

    unselectedTabColor =
        isLight ? Colors.white.withOpacity(0.75) : const Color(0XFF3A3A3A);

    primaryBorderColor = isLight ? Colors.grey : const Color(0xFF212121);

    notificationPendingColor = isLight ? Colors.red : const Color(0xFFEA0000);

    selectedProfileImageIndicatorGradient = isLight
        ? const LinearGradient(
            colors: [
              Colors.lightBlueAccent,
              Colors.lightBlue,
            ],
          )
        : const LinearGradient(
            colors: [
              Color(0xFFFF006B),
              Color(0xFFFF4593),
            ],
          );

    unselectedProfileImageIndicatorColor =
        isLight ? Colors.white : const Color(0xFF202020);

    userTagBadgeDarkBackgroundColor =
        isLight ? Colors.black : const Color(0xFF1A1A1A);

    userTagBadgeDarkBorderColor =
        isLight ? Colors.grey : const Color(0xFF3A3A3A);

    userTagBadgeLightBackgroundColor =
        isLight ? Colors.blue : const Color(0xFFFF006B).withOpacity(0.3);

    userTagBadgeLightBorderColor =
        isLight ? Colors.blueAccent : const Color(0xFFFF016B);

    userTagBadgeLightTextColor =
        isLight ? Colors.white : const Color(0xFFFF006B);
  }

  ///[isLight] parameter determines app colors according to
  ///light and dark themes
  final bool isLight;

  ///Background color for splash screen
  late final Color splashScreenBackground;

  ///Background color for home screen
  late final Color homeScreenBackground;

  ///Primary text color
  late final Color primaryTextColor;

  ///Primary border color
  late final Color primaryBorderColor;

  ///Secondary text color
  late final Color secondaryTextColor;

  ///Unselected tab text color
  late final Color unselectedTabColor;

  ///Notification pending  color
  late final Color notificationPendingColor;

  ///Color for selected profile image
  late final Color unselectedProfileImageIndicatorColor;

  ///Color for dark user tag badge background
  late final Color userTagBadgeDarkBackgroundColor;

  ///Color for dark user tag badge border
  late final Color userTagBadgeDarkBorderColor;

  ///Color for light user tag badge background
  late final Color userTagBadgeLightBackgroundColor;

  ///Color for light user tag badge border
  late final Color userTagBadgeLightBorderColor;

  ///Color for light user tag badge text
  late final Color userTagBadgeLightTextColor;

  ///Gradient for selected profile image
  late final LinearGradient selectedProfileImageIndicatorGradient;

  @override
  List<Object?> get props => [isLight];
}
