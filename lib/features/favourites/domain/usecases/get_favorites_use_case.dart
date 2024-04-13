import 'package:Mawthoq/features/favourites/domain/repo/favorite_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../auth/domain/usecases/get_user_use_case.dart';
import '../../data/entities/get_favorite_response.dart';
import '/core/di/app_module.dart';
import '../../../../core/errors/failure.dart';

class GetFavoritesUseCase {

  FavoriteRepo repo = getIt<FavoriteRepo>();

  Future<Either<Failure, GetFavoriteResponse>> call() async {
    return getIt<GetUserUseCase>().call().then(
            (value) => value.fold(
                (error) {
              return left(error);
            },
                (user) async {
                  return await repo.getFavorite(token: user!.token!);
            }
        ));


  }

}