import 'package:Mawthoq/features/main/bloc/main/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/custom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: context.read<MainCubit>().currentPage().page,
      ),

      bottomNavigationBar: CustomNavBar(items: context.read<MainCubit>().pages,),
    ));
  }
}
