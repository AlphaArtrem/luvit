import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luvit/data_layer/models/user_profile_data.dart';

part 'profile_card_state.dart';

///Cubit for managing profile card state
class ProfileCardCubit extends Cubit<ProfileCardState> {
  ///Current image index to show on profile card
  ProfileCardCubit({
    required UserProfileData profileData,
  }) : super(ProfileCardState(profileData: profileData));

  ///Show next image on profile card
  void showNextImage() {
    if (state.profileData.images.length - 1 > state.imageIndex) {
      emit(state.copyWith(imageIndex: state.imageIndex + 1));
    }
  }

  ///Show previous image on profile card
  void showPreviousImage() {
    if (state.imageIndex > 0) {
      emit(state.copyWith(imageIndex: state.imageIndex - 1));
    }
  }

  ///Update card position on dragging
  void onPanUpdate(DragUpdateDetails details) {
    if (state.position.dx <= 0 && state.position.dy >= -10) {
      final position = state.position + details.delta;
      emit(
        state.copyWith(
          position: position,
          angle: (45 * position.dx / 1.sw) * pi / 180,
        ),
      );
    }
  }

  ///Remove or retain cards on drag end
  void onPanEnd(DragEndDetails details, VoidCallback onCardRemove) {
    if (state.position.dx <= 50 && state.position.dy >= 100) {
      onCardRemove();
    } else {
      emit(state.copyWith(position: Offset.zero, angle: 0));
    }
  }
}
