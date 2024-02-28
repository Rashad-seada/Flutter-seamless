import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../blocs/register/register_cubit.dart';

// ignore: must_be_immutable
class MessageScreen extends StatelessWidget {
  String title;
  String description;
  void Function()? onTap;

  MessageScreen(
      {Key? key, required this.title, required this.description, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: ListView(
          children: [
            Space(
              height: 25.h,
            ),
            Center(
              child: SvgPicture.asset(
                AppImages.done,
                width: 86.w,
                height: 20.h,
              ),
            ),
            Space(
              height: 5.h,
            ),
            Text(LocaleKeys.all_done,
                    style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral900,
                      fontSize: 25.sp,
                    ),
                    textAlign: TextAlign.center)
                .tr(),
            Space(
              height: 2.h,
            ),
            Text(LocaleKeys.all_done_description,
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral700, fontSize: 12.sp),
                    textAlign: TextAlign.center)
                .tr(),
            Space(
              height: 15.h,
            ),
            MainButton(
              width: 86.w,
              height: 7.h,
              label: Text(
                LocaleKeys.done,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral100, fontSize: 14.sp),
              ).tr(),
              onTap: () => context.read<RegisterCubit>().onDoneClick(context),
            )
          ],
        ),
      ),
    ));
  }
}
