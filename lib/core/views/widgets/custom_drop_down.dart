import 'package:Mawthoq/features/verification/views/utils/drop_down_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

class CustomDropDown extends StatelessWidget {
  double? width;
  double? height;


  List<DropDownItemModel> menuItems;
  DropDownItemModel? selectedItem;
  String hint;

  void Function(DropDownItemModel?)? onChanged;

  CustomDropDown({super.key,this.height,this.width,this.onChanged, required this.menuItems,required this.selectedItem,required this.hint});

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.w),
        border: Border.all(color: AppTheme.neutral200,width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<DropDownItemModel>(

          hint: Text(hint),
          style: AppTheme.mainTextStyle(
              color: AppTheme.neutral400, fontSize: 12.sp),
          value: selectedItem,
          onChanged: (city){
              if(onChanged != null){
                onChanged!(city);
              }
          },
          items: menuItems
              .map<DropdownMenuItem<DropDownItemModel>>(
                  (DropDownItemModel value) {
                return DropdownMenuItem<DropDownItemModel>(
                  value: value,
                  child: Text(value.title),
                );
              }
          ).toList(),
        ),
      ),

    );
  }
}

