import 'package:Mawthoq/core/views/widgets/wave_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          WaveContainer(),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            children: [
              Space(
                height: 20.h,
              ),
              Center(
                child: Image.asset(
                  'images/confirm_email _image.png',
                  width: 86.w,
                  height: 20.h,
                ),
              ),
              Space(
                height: 5.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'An email has been received',
                    style: AppTheme.mainTextStyle(
                      fontSize: 20.sp,
                      color: AppTheme.secondary900,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Space(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'An Email has been sent to ',
                        style: AppTheme.mainTextStyle(
                          fontSize: 12.sp,
                          color: AppTheme.secondary900,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'email@gmail.com',
                          style: AppTheme.mainTextStyle(
                            fontSize: 12.sp,
                            color: AppTheme.primary900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Please Verify your account from the link in the mail',
                    style: AppTheme.mainTextStyle(
                      fontSize: 10.sp,
                      color: AppTheme.secondary900,
                    ),
                  ),
                ],
              ),
              Space(
                height: 25.h,
              ),
              MainButton(
                color: AppTheme.primary900,
                width: 86.w,
                height: 7.h,
                label: Text(
                  LocaleKeys.done,
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.secondary900, fontSize: 14.sp),
                ).tr(),
                onTap: () => context.read<RegisterCubit>().onDoneClick(context),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
