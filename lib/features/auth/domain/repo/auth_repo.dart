import 'package:dartz/dartz.dart';
import '../../data/entities/auth_response.dart';
import '../../data/entities/logout_response.dart';
import '../../data/entities/user_entity.dart';
import '/core/errors/failure.dart';
import '/features/auth/domain/model/user_model.dart';

abstract class AuthRepo {

  Future<Either<Failure,AuthResponse>> login({required String email, required String password});

  Future<Either<Failure,AuthResponse>> register({required String username,required String email,required String password});

  Future<Either<Failure,LogoutResponse>> logout({required String token});

  Future<Either<Failure,LogoutResponse>> logoutAll({required String token});


  Future<Either<Failure,UserEntity?>> getUser();

  Future<Either<Failure,void>> updateUser(UserEntity user);

  Future<Either<Failure,void>> deleteUser();

  Future<Either<Failure,void>> setUser(UserEntity user);

}