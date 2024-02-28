import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/main_button.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/account_logout_botton.dart';
import 'package:Mawthoq/features/account/views/components/account_page_app_bar.dart';
import 'package:Mawthoq/features/wallet/components/wallet_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: false,
        padding: EdgeInsets.all(7.w),
        children: [
          AccountPageAppBar(
            label: 'Wallet',
          ),
          Space(
            height: 3.h,
          ),
          Center(
            child: Text(
              'Balance',
              style: AppTheme.mainTextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SAR',
                style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
              Space(
                width: 1.w,
              ),
              Text(
                '1500',
                style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          Space(
            height: 1.5.h,
          ),
          Row(
            children: [
              Expanded(
                child: MainButton(
                  borderRadius: BorderRadius.circular(1.5.w),
                  height: 9.w,
                  label: Text(
                    'Withdraw',
                    style: AppTheme.mainTextStyle(
                      color: AppTheme.secondary900,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  color: AppTheme.primary900,
                ),
              ),
              Space(
                width: 3.w,
              ),
              Expanded(
                child: MainButton(
                  borderRadius: BorderRadius.circular(1.5.w),
                  height: 9.w,
                  label: Text(
                    'Deposit',
                    style: AppTheme.mainTextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  color: AppTheme.secondary900,
                ),
              ),
            ],
          ),
          Space(
            height: 3.h,
          ),
          Text(
            'Transactions',
            style: AppTheme.mainTextStyle(
              color: AppTheme.secondary900,
              fontWeight: FontWeight.w700,
            ),
          ),
          Space(
            height: 1.5.h,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(2.w),
            child: Text('Data'),
          ),
          AccountLogOutBotton(
            label: 'Invest Now',
            onTap: () {},
            showArrow: false,
          ),
        ],
      ),
    );
  }
}


  // Expanded(
  //           child: TabBar(
  //             controller: TabController(length: 5,vsync: this),
  //             tabs: [
  //               Tab(
  //                 child: WalletButton(
  //                   label: 'All Transactions',
  //                 ),
  //               ),
  //               Tab(
  //                 child: WalletButton(
  //                   label: 'All Transactions',
  //                 ),
  //               ),
  //               Tab(
  //                 child: WalletButton(
  //                   label: 'All Transactions',
  //                 ),
  //               ),
  //               Tab(
  //                 child: WalletButton(
  //                   label: 'All Transactions',
  //                 ),
  //               ),
  //               Tab(
  //                 child: WalletButton(
  //                   label: 'All Transactions',
  //                 ),
  //               ),
  //               Tab(
  //                 child: WalletButton(
  //                   label: 'All Transactions',
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),