import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          children: [
            Space(
              height: 2.h,
            ),
            CustomAppBar(
              label: LocaleKeys.direct_chat.tr(),
            ),
            Space(
              height: 3.h,
            ),
          ],
        ),
      ),
    );
  }
}
