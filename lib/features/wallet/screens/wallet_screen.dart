import 'package:Mawthoq/features/account/views/components/account_page_app_bar.dart';
import 'package:flutter/material.dart';

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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
