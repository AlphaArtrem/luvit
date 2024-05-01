import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luvit/business_layer/profile_card/profile_card_cubit.dart';
import 'package:luvit/data_layer/static/svg_string_assets.dart';
import 'package:luvit/presentation_layer/home/common/star_with_score_badge.dart';
import 'package:luvit/presentation_layer/home/tabs/home_tab/user_tag_badge.dart';
import 'package:luvit/service_layer/service_locator.dart';

///Profile card for home screen
class ProfileCard extends StatelessWidget {
  ///Constructor for [ProfileCard]
  const ProfileCard({
    required this.bloc,
    required this.onCardRemoved,
    super.key,
  });

  ///Profile data
  final ProfileCardCubit bloc;

  ///Callback to remove card on swipe
  final VoidCallback onCardRemoved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: BlocBuilder<ProfileCardCubit, ProfileCardState>(
        bloc: bloc,
        builder: (BuildContext context, ProfileCardState state) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return GestureDetector(
                onTapDown: (details) => _onTapDown(
                  details,
                  constraints,
                ),
                onPanUpdate: bloc.onPanUpdate,
                onPanEnd: (details) => bloc.onPanEnd(
                  details,
                  onCardRemoved,
                ),
                child: _body(
                  state,
                  constraints,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _body(ProfileCardState state, BoxConstraints constraints) {
    final center = constraints.smallest.center(Offset.zero);
    final rotate = Matrix4.identity()
      ..translate(center.dx, center.dy)
      ..rotateZ(state.angle)
      ..translate(-center.dx, -center.dy);
    return AnimatedContainer(
      duration: Duration.zero,
      transform: rotate
        ..translate(
          state.position.dx,
          state.position.dy,
        ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: themeService.state.primaryBorderColor,
        ),
        color: themeService.state.homeScreenBackground,
      ),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topLeft,
        children: [
          _image(state),
          _shader(),
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _currentImageIndicator(state),
                const Spacer(flex: 70),
                _details(state),
                const Spacer(flex: 4),
                Center(
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: themeService.state.primaryTextColor,
                    size: 25.h,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _image(ProfileCardState state) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: CachedNetworkImage(
        cacheKey: state.profileData.images[state.imageIndex],
        fit: BoxFit.cover,
        imageUrl: state.profileData.images[state.imageIndex],
        placeholder: (context, url) => Center(
          child: SizedBox(
            height: 30.r,
            width: 30.r,
            child: const CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Center(
          child: Icon(
            Icons.error,
            color: themeService.state.secondaryTextColor,
          ),
        ),
      ),
    );
  }

  Widget _currentImageIndicator(ProfileCardState state) {
    return Row(
      children: List.generate(
        state.profileData.images.length,
        (index) => Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 5.w),
            height: 3.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: state.imageIndex == index
                  ? themeService.state.selectedProfileImageIndicatorGradient
                  : null,
              color: state.imageIndex != index
                  ? themeService.state.unselectedProfileImageIndicatorColor
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  Widget _details(ProfileCardState state) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StarWithScoreBadge(
                score: state.profileData.likeCount,
                showFilledStar: false,
              ),
              SizedBox(height: 5.h),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: themeService.state.primaryTextColor,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: state.profileData.name,
                    ),
                    TextSpan(
                      text: ' ${state.profileData.age}',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.h),
              if (state.imageIndex <= 1)
                Text(
                  state.imageIndex == 0
                      ? '${state.profileData.location} \u00B7 2km 거리에 있음'
                      : state.profileData.description,
                  style: TextStyle(
                    color:
                        themeService.state.secondaryTextColor.withOpacity(0.75),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,
                  ),
                )
              else ...[
                const UserTagBadge(
                  text: '진지한 연애를 찾는 중',
                  isHighlighted: true,
                ),
                SizedBox(height: 7.h),
                Wrap(
                  runSpacing: 7.h,
                  spacing: 7.w,
                  children: List.generate(
                    state.profileData.tags.length,
                    (index) {
                      return UserTagBadge(
                        text: state.profileData.tags[index],
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
        SvgPicture.string(SvgStringAssets.likeButton),
      ],
    );
  }

  Widget _shader() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black,
            Colors.black.withOpacity(0.75),
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.25),
          ],
          stops: const [
            0,
            0.1,
            0.2,
            0.3,
          ],
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details, BoxConstraints constraints) {
    if (details.localPosition.dy < constraints.maxHeight / 2) {
      if (details.localPosition.dx > constraints.maxWidth / 2) {
        bloc.showNextImage();
      } else if (details.localPosition.dx < constraints.maxWidth / 2) {
        bloc.showPreviousImage();
      }
    }
  }
}
