import 'package:flutter/material.dart';

import '../components/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [

          HomeAppBar()

        ],
      ),
    ));
  }
}
