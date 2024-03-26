import 'package:Mawthoq/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../data/entities/get_one_property_response.dart';
import '../../data/entities/get_properties_response.dart';

abstract class PropertyRepo {

  Future<Either<Failure,GetPropertiesResponse>> getHomeProperties({required String token,required String status,required int page,});

  Future<Either<Failure,GetOnePropertyResponse>> getOneProperty({required String token,required int propertyId,});

}