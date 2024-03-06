import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/bloc/settings/settings_cubit.dart';
import 'package:Mawthoq/features/account/views/components/settings_screen_contianer.dart';
import 'package:Mawthoq/features/account/views/components/settings_toggle_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(2.w),
        children: [
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SettingsScreenContainer(
                  model: context.read<SettingsCubit>().settingsInfo[index],
                );
              },
              separatorBuilder: (context, index) {
                return Space(
                  height: 1.5.h,
                );
              },
              itemCount: context.read<SettingsCubit>().settingsInfo.length),
          Space(
            height: 1.5.h,
          ),
          SettingsToggleContainer(),
          Space(
            height: 1.5.h,
          ),
          SettingsToggleContainer(),
        ],
      ),
    );
  }
}
