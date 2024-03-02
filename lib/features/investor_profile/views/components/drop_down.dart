import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

class DropdownWidget<T> extends StatefulWidget {

  List<T> options;
  String label;
  void Function(Object?)? onChanged;

  late T selectedItem;

  DropdownWidget({super.key,required this.selectedItem,required this.options,required this.label,this.onChanged});
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      alignment: Alignment.center,
      height: 4.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppTheme.neutral200),
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.w)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(2.w),
          isExpanded: true, // here need to change
          value: widget.selectedItem,
          onChanged: (newValue) {
            setState(() {
              widget.selectedItem = newValue!;
            });
            if(widget.onChanged != null){
              widget.onChanged!(newValue);
            }
          },
          items: widget.options.map((option) {
            return DropdownMenuItem(
              value: option,
              child: Text(
                "$option   ${widget.label}",
                style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w600,

                    color: AppTheme.neutral900, fontSize: 9.sp),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}