import 'dart:io';

import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class UploadIdCard extends StatelessWidget {
  String label;
  XFile? image;
  void Function()? onTap;
  UploadIdCard({super.key, required this.label, this.onTap,this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 18.h,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          color: AppTheme.neutral200,
          borderRadius: BorderRadius.circular(
            3.w,
          ),
        ),
        child: (image == null)? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.uploadId),
            Space(
              height: 1.h,
            ),
            Text(
              label,
              style: AppTheme.mainTextStyle(
                fontSize: 11.sp,
              ),
            ),
          ],
        ) : Expanded(child: Image.file(File(image!.path),fit: BoxFit.cover,)),
      ),
    );
  }
}
