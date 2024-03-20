import 'package:Mawthoq/features/account/views/bloc/account/account_cubit.dart';
import 'package:Mawthoq/features/account/views/bloc/settings/settings_cubit.dart';
import 'package:Mawthoq/features/home/views/bloc/home/home_cubit.dart';
import 'package:Mawthoq/features/home/views/bloc/home_details/home_details_cubit.dart';
import 'package:Mawthoq/features/main/bloc/main/main_cubit.dart';
import 'package:Mawthoq/features/wallet/views/blocs/wallet/wallet_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'features/auth/views/blocs/otp/otp_cubit.dart';
import 'features/auth/views/blocs/reset_password/reset_password_cubit.dart';
import 'core/bloc/core_cubit.dart';
import 'core/config/app_theme.dart';
import 'features/auth/views/blocs/login/login_cubit.dart';
import 'features/auth/views/blocs/register/register_cubit.dart';
import 'features/auth/views/screens/intro_screen.dart';
import 'features/onboarding/view/bloc/on_boarding_cubit.dart';
import 'features/onboarding/view/screens/00_on_boarding_screen.dart';
import 'generated/codegen_loader.g.dart';

void main() async {
  await CoreCubit.setupApp();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('ar'),
      assetLoader: const CodegenLoader(),
      path: "assets/translations/",
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CoreCubit()),
        BlocProvider(create: (_) => OnBoardingCubit()),
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => RegisterCubit()),
        BlocProvider(create: (_) => ResetPasswordCubit()),
        BlocProvider(create: (_) => OtpCubit()),
        BlocProvider(create: (_) => MainCubit()),
        BlocProvider(create: (_) => AccountCubit()),
        BlocProvider(create: (_) => SettingsCubit()),
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => WalletCubit()),
        BlocProvider(create: (_) => HomeDetailsCubit()),
      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: IntroScreen(),
            theme: AppTheme.theme(context),
          );
        },
      ),
    );
  }
}
