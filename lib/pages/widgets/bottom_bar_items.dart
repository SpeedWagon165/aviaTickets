import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../themes/text_styles.dart';

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({super.key, required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0x000c0c0c),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              icon,
              height: 24,
              width: 24,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 7),
            Text(
              text,
              style: AppTextStyles.bottomBar,
            ),
          ],
        ),
      ),
    );
  }
}
