import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luvit/service_layer/service_locator.dart';

///Custom Painter for bottom navigation bar outline
class BottomNavigationBarContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(217.804.w, 10.h)
      ..lineTo(370.w, 10.h)
      ..cubicTo(385.627.w, 10, 390.w, 15.3726, 390.w, 22.h)
      ..lineTo(390.w, 94.h)
      ..lineTo(-1.w, 94.h)
      ..lineTo(-1.w, 22.h)
      ..cubicTo(0.w, 15.3726.h, 5.37258.w, 10, 12.w, 10.h)
      ..lineTo(172.196.w, 10.h)
      ..cubicTo(177.861.w, 3.85172.h, 185.981.w, 0, 195.w, 0)
      ..cubicTo(204.019.w, 0, 212.139.w, 3.85172.h, 217.80.w, 10.h)
      ..close();

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = themeService.state.homeScreenBackground;
    canvas.drawPath(path_0, paint0Fill);

    final paint1Fill = Paint()
      ..style = PaintingStyle.stroke
      ..color = themeService.state.primaryBorderColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.5;
    canvas.drawPath(path_0, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
