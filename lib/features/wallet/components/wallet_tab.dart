import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WalletTab extends StatefulWidget {
  List<String> tabsLabels;
  List<Widget> pages;

  WalletTab({super.key, this.tabsLabels = const [], this.pages = const []});

  @override
  State<WalletTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<WalletTab> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabsLabels.length,
      child: Column(
        children: [
          TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              labelStyle: AppTheme.mainTextStyle(
                fontSize: 10.sp,
              ),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
                color: AppTheme.secondary900,
              ),
              tabs: List.generate(
                  widget.tabsLabels.length,
                  (index) => Tab(
                        text: widget.tabsLabels[index],
                      ))),
          SizedBox(height: 1, child: TabBarView(children: widget.pages)),
        ],
      ),
    );
  }
}

Widget tab(String label, Color color) {
  return MainButton(
    label: Text(
      label,
      style: AppTheme.mainTextStyle(color: Colors.white, fontSize: 12.sp),
    ),
  );
}
