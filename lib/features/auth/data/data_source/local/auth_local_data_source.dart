import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../core/config/app_consts.dart';
import '../../../../../core/errors/exception.dart';
import '../../entities/user_entity.dart';

abstract class  AuthLocalDataSource {

  Future<UserEntity?> getUser();

  Future<void> updateUser(UserEntity user);

  Future<void> deleteUser();

  Future<void> setUser(UserEntity? user);

}



class AuthLocalDataSourceImpl implements AuthLocalDataSource {

  Future<Box> get box async {
    return await Hive.openBox(AppConsts.boxName);
  }

  @override
  static Future<void> initHive() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(documentDirectory.path);
    Hive.registerAdapter(UserEntityAdapter());
  }

  @override
  Future<void> deleteUser() async {
    try{
      return await box.then((value) => value.delete(
        AppConsts.userKey,
      ));
    }catch(e){
      throw LocalDataException(e.toString());
    }
  }

  @override
  Future<UserEntity?> getUser() async {
    try{
      return await box.then((value) => value.get(
        AppConsts.userKey,
      ));
    }catch(e){
      throw LocalDataException(e.toString());
    }
  }

  @override
  Future<void> setUser(UserEntity? user) async {
    try{
      return await box.then((value) => value.put(
        AppConsts.userKey,
        user
      ));
    }catch(e){
      throw LocalDataException(e.toString());
    }
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    try{
      return await box.then((value) => value.put(
          AppConsts.userKey,
          user
      ));
    }catch(e){
      throw LocalDataException(e.toString());
    }
  }


}