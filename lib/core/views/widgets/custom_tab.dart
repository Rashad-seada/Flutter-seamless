import 'package:Mawthoq/core/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_theme.dart';

class CustomTab extends StatefulWidget {
  List<String> tabsLabels;
  List<Widget> pages;

  CustomTab({super.key, this.tabsLabels = const [], this.pages = const []});

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabsLabels.length,
      child: Column(
        children: [
          TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                color: Colors.green,
              ),
              tabs: List.generate(
                  widget.tabsLabels.length,
                      (index) => Tab(
                    text: widget.tabsLabels[index],
                  ))),
          SizedBox(
            height: 69.h,
              child: TabBarView(children: widget.pages)),
        ],
      ),
    );
  }
}

Widget tab(String label) {
  return MainButton(
    label: Text(
      label,
      style:
          AppTheme.mainTextStyle(color: AppTheme.neutral900, fontSize: 14.sp),
    ),
  );
}
