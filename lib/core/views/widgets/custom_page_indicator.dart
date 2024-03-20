import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import '/core/config/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class CustomPageIndicator extends StatelessWidget {
  int index;
  int count;

  CustomPageIndicator({Key? key,this.index = 0,this.count = 3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: index,
      count: count,
      effect: WormEffect(
        dotColor: AppTheme.neutral200,
        activeDotColor: AppTheme.primary900,
        dotHeight: 2.w,
        dotWidth: 2.w
      ),
    );
  }
}
