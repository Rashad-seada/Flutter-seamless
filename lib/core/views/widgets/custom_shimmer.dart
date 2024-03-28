import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../config/app_theme.dart';

class CustomShimmer extends StatelessWidget {
  Widget child;
  CustomShimmer({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppTheme.neutral200,
      highlightColor: AppTheme.neutral300,
      child: child,
    );
  }
}
