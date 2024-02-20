import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.neutral100,
      body: Padding(
        padding: EdgeInsets.all(6.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(0.5.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppTheme.neutral100,
                      ),
                      clipBehavior: Clip.none,
                      width: 24.w,
                      height: 3.5.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppTheme.neutral200,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            child: Image.asset(
                              AppImages.authMethods,
                            ),
                          ),
                          Text(
                            'nation',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Space(
              height: 4.h,
            ),
            Container(
              padding: EdgeInsets.all(2.h),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    3.w,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 50,
                      ),
                      Column(
                        children: [
                          Text(
                            'data',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('data'),
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    AppImages.arrow,
                    height: 3.h,
                    width: 3.h,
                  ),
                ],
              ),
            ),
            Space(
              height: 2.5.h,
            ),
            MyContainer(),
            Space(
              height: 2.5.h,
            ),
            MyContainer(),
            Space(
              height: 2.h,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppTheme.neutral300,
                ),
                borderRadius: BorderRadius.circular(
                  3.w,
                ),
              ),
              padding: EdgeInsets.all(1.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.neutral300,
                    ),
                  ),
                  SvgPicture.asset(
                    AppImages.arrow,
                    height: 2.5.h,
                    width: 2.5.h,
                    color: AppTheme.neutral300,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget MyContainer() {
  return Container(
    padding: EdgeInsets.all(2.h),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(
        3.w,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'data',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SvgPicture.asset(
              AppImages.arrow,
              height: 2.5.h,
              width: 2.5.h,
            ),
          ],
        ),
        Space(
          height: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'data',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SvgPicture.asset(
              AppImages.arrow,
              height: 2.5.h,
              width: 2.5.h,
            ),
          ],
        ),
      ],
    ),
  );
}
