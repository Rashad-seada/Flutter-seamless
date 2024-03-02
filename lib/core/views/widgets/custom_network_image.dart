import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_images.dart';
import '../../config/app_theme.dart';
import 'custom_progress_indicator.dart';

class CustomNetworkImage extends StatelessWidget {
  String url;
  double? width;
  double? height;
  BoxFit? fit;
  CustomNetworkImage({super.key,required this.url,this.width,this.height,this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: url,
      placeholder: (context, url) => CustomProgressIndicator(
        color: AppTheme.secondary900,
      ),
      errorWidget: (context, url, error) => Center(
        child: SvgPicture.asset(
          AppImages.imageError,
          width: 9.w,
          height: 9.w,
          color: AppTheme.neutral500,
        ),
      ),
    );
  }
}
