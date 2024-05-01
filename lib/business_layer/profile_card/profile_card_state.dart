part of 'profile_card_cubit.dart';

///State for profile card
class ProfileCardState extends Equatable {
  ///Constructor for [ProfileCardState]
  const ProfileCardState({
    required this.profileData,
    this.imageIndex = 0,
    this.position = Offset.zero,
    this.angle = 0,
  });

  ///Current image index to show on profile card
  final int imageIndex;

  ///Profile data
  final UserProfileData profileData;

  ///Position of the card to add swiping
  final Offset position;

  ///Rotate angle of card
  final double angle;

  ///Copy Constructor for [ProfileCardState]
  ProfileCardState copyWith({
    UserProfileData? profileData,
    int? imageIndex,
    Offset? position,
    double? angle,
  }) {
    return ProfileCardState(
      imageIndex: imageIndex ?? this.imageIndex,
      profileData: profileData ?? this.profileData,
      position: position ?? this.position,
      angle: angle ?? this.angle,
    );
  }

  @override
  List<Object?> get props => [
        imageIndex,
        profileData,
        position,
        angle,
      ];
}
