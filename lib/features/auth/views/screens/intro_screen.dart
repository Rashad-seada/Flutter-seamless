import 'dart:async';

import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/auth/views/blocs/intro/intro_cubit.dart';
import 'package:Mawthoq/features/onboarding/view/screens/00_on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:visibility_detector/visibility_detector.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  void setupSystemNavigationBar() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    await Future.delayed(Duration(seconds: 3)).then(
            (value) => context.read<IntroCubit>().getUser(context)
    );
  }

  void disposeSystemNavigationBar() {
    AppTheme.initSystemNavAndStatusBar();
  }



  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('uniqueKey'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 0) {
          // Call your function here when the widget is not visible
          disposeSystemNavigationBar();
        }else {
          setupSystemNavigationBar();
        }
      },
      child: Scaffold(
        backgroundColor: AppTheme.secondary900,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                  alignment: Alignment.center,
                  child: Image.asset("images/logo.jpeg",width:100.w,height: 30.w,fit: BoxFit.fitWidth,)),
              Space(height: 2.h,),
              SizedBox(
                width: 5.w,height: 5.w,
                child: CircularProgressIndicator(
                  color: AppTheme.primary900,
                  strokeWidth: 0.5.w,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
