import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/blog_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class BlogScreeen extends StatelessWidget {
  const BlogScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
      ),
      body: Padding(
        padding: EdgeInsets.all(3.w),
        child: ListView(
          children: [
            Text(
              'Learn more about investing',
              style: AppTheme.mainTextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
            Space(
              height: 1.5.h,
            ),
            GridView.count(
              childAspectRatio: 2 / 1.4,
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                BlogCard(),
                BlogCard(),
                BlogCard(),
                BlogCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
