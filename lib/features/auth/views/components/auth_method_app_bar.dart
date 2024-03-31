import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/features/language/views/screens/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class AuthMethodAppBar extends StatelessWidget {
  _navigateToLanguageScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => LanguageScreen()));
  }

  AuthMethodAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 9.h,
          color: AppTheme.secondary900,
        ),
        GestureDetector(
          onTap: () => _navigateToLanguageScreen(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
            child: Container(
              height: 6.h,
              width: 13.w,
              decoration: BoxDecoration(
                color: AppTheme.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(
                  Icons.language,
                  color: AppTheme.secondary900,
                  size: 25,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
