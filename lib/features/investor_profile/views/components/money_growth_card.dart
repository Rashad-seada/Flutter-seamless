import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../utils/custom_track.dart';
import 'drop_down.dart';

class MoneyGrowthCard extends StatefulWidget {
  MoneyGrowthCard({super.key});

  @override
  State<MoneyGrowthCard> createState() => _MoneyGrowthCardState();
}

class _MoneyGrowthCardState extends State<MoneyGrowthCard> {
  int selectedYear = 1;

  List<int> years = [1,2,3,5,7,10];

  double selectedReturns = 1.5;

  List<double> returns = [1.5,3.5,5,11.5];

  TextEditingController textEditingController = TextEditingController(text: "1000");


  double calculateNetReturns(double value,double percentage){
    return (value * percentage) / 100;
  }

  double calculateMonthlyReturns(double value,double percentage,int years){
    return calculateNetReturns(value,percentage) / (years * 12);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),

      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(
            height: 2.h,
          ),
          Text(
            LocaleKeys.money_grows.tr(),
            style: AppTheme.mainTextStyle(
                fontWeight: FontWeight.w600,
                color: AppTheme.neutral900,
                fontSize: 13.sp),
          ),

          Space(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.monthly_deposits.tr(),
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral400, fontSize: 11.sp),
              ),
              customTextField(textEditingController,(value){
                setState(() {

                });
              })
            ],
          ),

          Space(
            height: 1.5.h,
          ),
          SizedBox(
            width: 100.w,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                overlayShape: RoundSliderOverlayShape(
                  overlayRadius: 0.0,
                ),
                trackShape: CustomTrackShape(),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7),
              ),
              child: Slider(
                activeColor: AppTheme.primary900,
                inactiveColor: AppTheme.primary900.withOpacity(0.2),
                value: (double.tryParse(textEditingController.text) != null && double.tryParse(textEditingController.text)! <= 100000)? double.tryParse(textEditingController.text)! : 0,
                min: 0,
                max: 100000,
                divisions: 100,
                onChanged: (value) {
                  setState(() {
                    textEditingController.text = value.toString();
                  });
                },
              ),
            ),
          ),

          Space(
            height: 1.5.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                  child: card(
                      text: LocaleKeys.expected_investments_value.tr(),
                      value: calculateNetReturns(double.tryParse(textEditingController.text) ?? 0.0, selectedReturns).toStringAsFixed(3),
                      currancyTag: "SAR",
                      numberOfYears: selectedYear.toString()
                  )),
              Space(
                width: 1.5.h,
              ),

              Expanded(child: card(
                  text: LocaleKeys.monthly_rent_return.tr(),
                  value: calculateMonthlyReturns(double.tryParse(textEditingController.text) ?? 0.0, selectedReturns,selectedYear).toStringAsFixed(3),
                  currancyTag: "SAR",
                  numberOfYears: selectedYear.toString()
              ))

            ],
          ),

          Space(
            height: 1.5.h,
          ),

          Row(
            children: [
              Expanded(
                  child: DropdownWidget<int>(
                    selectedItem: selectedYear,
                    options: years,
                    label: LocaleKeys.year.tr(),
                    onChanged: (value){

                      setState(() {
                        selectedYear = int.tryParse(value.toString()) ?? 1;
                      });
                    },
                )),
              Space(
                width: 1.5.h,
              ),
              Expanded(
                  child: DropdownWidget<double>(
                    selectedItem: selectedReturns,
                    options: returns,
                    label: LocaleKeys.net_return.tr(),
                    onChanged: (value){
                      setState(() {
                        selectedReturns = double.tryParse(value.toString()) ?? 1.5;

                      });
                    },
                  )),
            ],
          ),

          Space(
            height: 2.h,
          ),

          SizedBox(
            width: 100.w,
            child: Divider(
              color: AppTheme.neutral300,

            ),
          ),

          Space(
            height: 1.h,
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                  fit: BoxFit.cover,
                  width: 10.w,
                  height: 10.w,
                  AppImages.investment),
              Space(
                width: 5.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 60.w,
                    child: Text(
                      LocaleKeys.view_investments_chances.tr(),
                      style: AppTheme.mainTextStyle(
                          fontWeight: FontWeight.w600,

                          color: AppTheme.neutral900, fontSize: 13.sp),
                    ),
                  ),
                  Space(
                    height: 0.1.h,
                  ),
                  SizedBox(
                    width: 60.w,

                    child: Text(
                      LocaleKeys.view_investments_chances_sub_text.tr(),
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral400, fontSize: 9.sp),
                    ),
                  ),
                ],
              )
            ],
          ),
          Space(
            height: 3.h,
          ),


        ],
      ),
    );
  }

  Widget card({
    required String text,
    required String value,
    required String currancyTag,
    required String numberOfYears
  }) {
    return Container(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.w),
          color: AppTheme.primary900.withOpacity(0.1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            text + " " + numberOfYears + " " +LocaleKeys.year.tr(),
            textAlign: TextAlign.center,
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral600,
                fontSize: 9.sp),
          ),

          Space(height: 3,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(
                textAlign: TextAlign.center,
                currancyTag,
                style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.neutral600,
                    fontSize: 7.sp),
              ),

              Space(width: 1.5.w,),

              Text(
                value,
                textAlign: TextAlign.center,
                style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppTheme.neutral600,
                    fontSize: 10.sp),
              ),

            ],
          )

        ],
      ),
    );
  }

  Widget customTextField(TextEditingController controller,void Function(String)? onChanged){
    return Container(
      alignment: Alignment.center,
      width: 40.w,
      height: 4.5.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppTheme.neutral200),
          borderRadius: BorderRadius.circular(2.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 25.w,
            height: 4.5.h,
            child: TextField(
              onChanged: onChanged,
              controller: controller,
              keyboardType: TextInputType.numberWithOptions(),
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral900, fontWeight: FontWeight.w600),
              cursorColor: AppTheme.neutral900,
              decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.w),
                hintText: 'Ex: 1000',
                hintStyle: AppTheme.mainTextStyle(color: AppTheme.neutral300),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
          Container(width: 1, height: 5.h, color: AppTheme.neutral200),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.5.w),
            child: Text(
              'SAR',
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral900, fontSize: 10.sp),
            ),
          ),
        ],
      ),
    );
  }
}


