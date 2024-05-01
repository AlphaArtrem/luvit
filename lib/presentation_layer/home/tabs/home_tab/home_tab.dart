import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luvit/business_layer/home_tab/home_tab_bloc.dart';
import 'package:luvit/business_layer/profile_card/profile_card_cubit.dart';
import 'package:luvit/presentation_layer/common/base_view.dart';
import 'package:luvit/presentation_layer/home/home_screen.dart';
import 'package:luvit/presentation_layer/home/tabs/home_tab/profile_card.dart';
import 'package:luvit/service_layer/service_locator.dart';

///Home screen tab for [HomeScreen]
class HomeTab extends StatelessWidget {
  ///Default constructor for [HomeTab]
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStreamableView<HomeTabBloc, HomeTabState>(
      builder: (context, themeState, state) => _body(state),
    );
  }

  Widget _body(HomeTabState state) {
    if (state is HomeTabStateLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is HomeTabStateError) {
      return Center(
        child: Text(
          state.error,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: themeService.state.secondaryTextColor,
            fontSize: 12.sp,
          ),
        ),
      );
    } else if (state is HomeTabStateDataFetched) {
      if (state.profiles.isEmpty) {
        return Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '추천 드릴 친구들을 준비 중이에요\n',
                  style: TextStyle(
                    color: themeService.state.primaryTextColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    height: 2.sp,
                  ),
                ),
                TextSpan(
                  text: '매일 새로운 친구들을 소개시켜드려요',
                  style: TextStyle(
                    color: themeService.state.secondaryTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.profiles.length,
            controller: PageController(
              viewportFraction: 0.95,
            ),
            itemBuilder: (BuildContext context, int index) {
              return ProfileCard(
                bloc: ProfileCardCubit(
                  profileData: state.profiles[index],
                ),
                onCardRemoved: () {
                  context
                      .read<HomeTabBloc>()
                      .add(HomeTabEventRemoveProfile(index));
                },
              );
            },
          ),
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}
