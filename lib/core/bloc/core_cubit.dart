import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../features/auth/data/data_source/local/auth_local_data_source.dart';
import '../config/app_theme.dart';
import '../di/app_module.dart';
import '../infrastructure/database/database.dart';

part 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  CoreCubit() : super(CoreInitial());

  static late AppDatabase database;

  static Future<void> setupApp() async {

    // change the color of the system status bar and nav bar
    AppTheme.initSystemNavAndStatusBar();

    // prepare the widgets to be displayed
    WidgetsFlutterBinding.ensureInitialized();

    // makes the application always vertical
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    AuthLocalDataSourceImpl.initHive();

    // initialize Firebase
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    // prepare the dependencies that the application needs to run
    AppModule.setup();

    // initialize locale
    await EasyLocalization.ensureInitialized();

    // initialize database
    //database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  }


}
