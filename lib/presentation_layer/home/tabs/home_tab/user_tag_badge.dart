import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luvit/presentation_layer/home/tabs/home_tab/profile_card.dart';
import 'package:luvit/service_layer/service_locator.dart';

///Badge to user tags in [ProfileCard]
class UserTagBadge extends StatelessWidget {
  ///Default constructor for [UserTagBadge]
  const UserTagBadge({
    required this.text,
    this.isHighlighted = false,
    super.key,
  });

  ///Text to show
  final String text;

  ///Show badge dark or light
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isHighlighted
              ? themeService.state.userTagBadgeLightBorderColor
              : themeService.state.userTagBadgeDarkBorderColor,
        ),
        borderRadius: BorderRadius.circular(
          20.r,
        ),
        color: isHighlighted
            ? themeService.state.userTagBadgeLightBackgroundColor
            : themeService.state.userTagBadgeDarkBackgroundColor,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 12.h,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${_iconSymbol()} $text',
            style: TextStyle(
              color: themeService.state.primaryTextColor,
              fontSize: 14.sp,
              fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.w400,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }

  String _iconSymbol() {
    if (isHighlighted) {
      return '💖';
    }
    switch (text.toLowerCase()) {
      case 'smoking' || 'smocking' || '비흡연':
        return '🚬';
      case 'exercise' || '매일 1시간 이상':
        return '💪🏻';
      case 'drinking' || '전혀 안 함':
        return '🍸';
      case 'i like meeting' || '만나는 걸 좋아함' || 'handshake' || 'friendship':
        return '🤝';
    }
    return '';
  }
}
