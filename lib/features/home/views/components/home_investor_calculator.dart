import 'package:Mawthoq/core/config/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../investor_profile/views/utils/custom_track.dart';

class HomeInvestorCalculator extends StatefulWidget {
  HomeInvestorCalculator({super.key});

  @override
  State<HomeInvestorCalculator> createState() => _HomeInvestorCalculatorState();
}

class _HomeInvestorCalculatorState extends State<HomeInvestorCalculator> {
  double initInvestment = 10000;

  double propertyValueGrowth = 30/100;

  double expectedAnnualRentalYield = 4.67/100;

  double calculatePropertyValueGrowth(double initInvestment, double propertyValueGrowth ){
    return initInvestment * propertyValueGrowth;
  }

  double calculateExpectedAnnualRentalYield(double initInvestment, double expectedAnnualRentalYield ){
    return initInvestment * expectedAnnualRentalYield;
  }

  double calculateAllGrowth(double initInvestment, double propertyValueGrowth, double expectedAnnualRentalYield){
    return calculatePropertyValueGrowth(initInvestment,propertyValueGrowth) + calculateExpectedAnnualRentalYield(initInvestment,expectedAnnualRentalYield) + initInvestment;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Investment calculator",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondary900,
                  fontSize: 15.sp),
            ),
          ],
        ),
        Space(
          height: 2.2.h,
        ),
        Text(
          "Projected investment return of",
          style: AppTheme.mainTextStyle(
              fontWeight: FontWeight.w400,
              color: AppTheme.neutral500,
              fontSize: 16.sp),
        ),
        Space(
          height: .2.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SAR ${ NumberFormat.decimalPattern().format(calculateAllGrowth(initInvestment, propertyValueGrowth, expectedAnnualRentalYield))} in 5 years",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondary900,
                  fontSize: 16.sp),
            ),
            Space(
              width: 2.w,
            ),
            SvgPicture.asset(
              AppImages.infoCircle,
              height: 2.5.h,
              width: 2.5.h,
            ),
          ],
        ),
        Space(
          height: 2.h,
        ),
        _InvestmentsCalculatorCard(
          allMoneyGrowth: initInvestment,
          propertyValueGrowth: calculateExpectedAnnualRentalYield(initInvestment, propertyValueGrowth),
          expectedAnnualRentalYield: calculateExpectedAnnualRentalYield(initInvestment, expectedAnnualRentalYield),
        ),

        Space(
          height: 1.h,
        ),
        _InvestmentsCalculatorChart(
          columnHeight: 60.h,
          allMoneyGrowth: calculateAllGrowth(initInvestment, propertyValueGrowth, expectedAnnualRentalYield),
          propertyValueGrowth: calculateExpectedAnnualRentalYield(initInvestment, propertyValueGrowth),
          expectedAnnualRentalYield: calculateExpectedAnnualRentalYield(initInvestment, expectedAnnualRentalYield),
        ),
        Space(
          height: 5.h,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Initial investments",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppTheme.neutral500,
                  fontSize: 11.sp),
            ),

            Text(
            "SAR " + NumberFormat.decimalPattern().format(initInvestment)
              ,
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.neutral700,
                  fontSize: 12.sp),
            ),
          ],
        ),

        Space(
          height: 1.5.h,
        ),

        SliderTheme(
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
            value: initInvestment,
            min: 0,
            max: 200000,
            divisions: 100,
            onChanged: (value) {
              setState(() {
                initInvestment = value;
              });
            },
          ),
        ),

        Space(
          height: 3.h,
        ),


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Property value growth (5 years)",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppTheme.neutral500,
                  fontSize: 11.sp),
            ),

            Text(
              (propertyValueGrowth * 100).toStringAsFixed(0)  + "%",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.neutral700,
                  fontSize: 12.sp),
            ),
          ],
        ),

        Space(
          height: 1.5.h,
        ),

        SliderTheme(
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
            value: propertyValueGrowth,
            min: 0.0,
            max: 1,
            divisions: 100,
            onChanged: (value) {
              setState(() {
                propertyValueGrowth = value;
              });
            },
          ),
        ),

        Space(
          height: 3.h,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Expected annual yield",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppTheme.neutral500,
                  fontSize: 11.sp),
            ),

            Text(
              (expectedAnnualRentalYield * 100).toStringAsFixed(0)  + "%",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.neutral700,
                  fontSize: 12.sp),
            ),
          ],
        ),

        Space(
          height: 1.5.h,
        ),

        SliderTheme(
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
            value: expectedAnnualRentalYield,
            min: 0.0,
            max: 0.1,
            divisions: 100,
            onChanged: (value) {
              setState(() {
                expectedAnnualRentalYield = value;
              });
            },
          ),
        ),

      ],
    );
  }
}



class _InvestmentsCalculatorChart extends StatelessWidget {
  double allMoneyGrowth;
  double propertyValueGrowth;
  double expectedAnnualRentalYield;
  double columnHeight;

  _InvestmentsCalculatorChart({super.key,required this.allMoneyGrowth,required this.propertyValueGrowth,required this.expectedAnnualRentalYield, this.columnHeight = 100});


  Widget rowItem(int value){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
          NumberFormat.decimalPattern().format(value),
            style: AppTheme.mainTextStyle(
                fontWeight: FontWeight.w400,
                color: AppTheme.neutral500,
                fontSize: 9.sp),
          ),

          Space(width: 4.w,),

          Expanded(
            child: Divider(
              color: AppTheme.neutral200,
              thickness: .2.w,
            ),
          ),
        ],
      ),
    );
  }

  Widget columnItem(int year,int allMoneyGrowth,double expectedAnnualRentalYield,double propertyValueGrowth,){


    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          children: [
            Container(
              width: 11.w,
              height: columnHeight *  propertyValueGrowth / allMoneyGrowth ,
              decoration: BoxDecoration(
                color: AppTheme.success,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(2.w),topLeft: Radius.circular(2.w))

              ),
            ),
            Container(
              width: 11.w,
              height: columnHeight * expectedAnnualRentalYield  / allMoneyGrowth,
              color: AppTheme.primary900,
            ),
            Container(
              width: 11.w,
              height: columnHeight *  .2,
              decoration: BoxDecoration(
                color: AppTheme.secondary900,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(2.w),bottomLeft: Radius.circular(2.w))
              ),
            ),

            Space(height: 1.h,),

            Text(
              year.toString(),
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppTheme.neutral500,
                  fontSize: 9.sp),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [

        Column(
          children: List.generate(7, (index) => rowItem((allMoneyGrowth.toInt() ~/ 6)* (index +2))).reversed.toList(),
        ),

        Positioned(
          left: 10.w,
          bottom: -1.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(5,
                    (index) =>
                        columnItem(
                            2025 + index,
                            allMoneyGrowth.toInt(),
                            (expectedAnnualRentalYield / 5) * (index+1),
                            (propertyValueGrowth / 5) * (index+1)
                        )),
          ),
        )

      ],
    );
  }
}


class _InvestmentsCalculatorCard extends StatelessWidget {
  double allMoneyGrowth;
  double propertyValueGrowth;
  double expectedAnnualRentalYield;
  _InvestmentsCalculatorCard({super.key,required this.allMoneyGrowth,required this.propertyValueGrowth,required this.expectedAnnualRentalYield});

  Widget _InvestmentsCalculatorCardItem({required Color dotColor,required String title,required String description}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Space(height: .4.h,),
            Container(
              width: 3.w,
              height: 3.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dotColor
              ),
            ),
          ],
        ),

        Space(width: 1.5.w,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppTheme.neutral500,
                  fontSize: 9.sp),
            ),

            Text(
              description,
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondary900,
                  fontSize: 10.sp),
            ),
          ],
        )




      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.symmetric(horizontal: 2.5.w,vertical: 1.h),
      margin: EdgeInsets.only(bottom: 3.h),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          border: Border.all(color: AppTheme.neutral300),

          color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _InvestmentsCalculatorCardItem(dotColor: AppTheme.secondary900, title: "Investment", description: "AED ${ NumberFormat.decimalPattern().format(allMoneyGrowth)}"),
          _InvestmentsCalculatorCardItem(dotColor: AppTheme.primary900, title: "Total rent", description: "AED ${ NumberFormat.decimalPattern().format(expectedAnnualRentalYield)}"),
          _InvestmentsCalculatorCardItem(dotColor: AppTheme.success, title: "Value growth", description: "AED ${ NumberFormat.decimalPattern().format(propertyValueGrowth)}")

        ],
      ),
    );
  }
}
