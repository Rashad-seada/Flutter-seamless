import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/main_button.dart';
import 'package:Mawthoq/features/account/views/components/account_page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AccountPageAppBar(),
                Text(
                  'Wallet',
                  style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('SAR'),
                    Text('1500'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainButton(
                      label: Text(
                        'ايداع',
                        style: AppTheme.mainTextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: AppTheme.secondary900,
                    ),
                    MainButton(
                      label: Text(
                        'سحب',
                        style: AppTheme.mainTextStyle(
                          color: AppTheme.secondary900,
                        ),
                      ),
                      color: AppTheme.primary900,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
