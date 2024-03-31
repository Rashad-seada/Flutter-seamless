import 'package:Mawthoq/features/account/views/bloc/account/account_cubit.dart';
import 'package:Mawthoq/features/account/views/bloc/settings/settings_cubit.dart';
import 'package:Mawthoq/features/auth/views/blocs/intro/intro_cubit.dart';
import 'package:Mawthoq/features/cart/views/bloc/cart/cart_cubit.dart';
import 'package:Mawthoq/features/home/views/bloc/home/home_cubit.dart';
import 'package:Mawthoq/features/home/views/bloc/home_details/home_details_cubit.dart';
import 'package:Mawthoq/features/investor_profile/views/bloc/investor_profile/investor_profile_cubit.dart';
import 'package:Mawthoq/features/language/views/blocs/language/language_cubit.dart';
import 'package:Mawthoq/features/main/bloc/main/main_cubit.dart';
import 'package:Mawthoq/features/verification/views/blocs/verification_cubit.dart';
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
        BlocProvider(create: (_) => InvestorProfileCubit()),
        BlocProvider(create: (_) => LanguageCubit(context)),
        BlocProvider(create: (_) => VerificationCubit()),
        BlocProvider(create: (_) => IntroCubit()),
        BlocProvider(create: (_) => CartCubit()),
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
