import 'package:Mawthoq/features/favourites/domain/repo/favorite_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../auth/domain/usecases/get_user_use_case.dart';
import '../../data/entities/get_favorite_response.dart';
import '../../data/entities/modify_favorite_response.dart';
import '/core/di/app_module.dart';
import '../../../../core/errors/failure.dart';

class RemoveFromFavoritesUseCase {

  FavoriteRepo repo = getIt<FavoriteRepo>();

  Future<Either<Failure, ModifyFavoriteResponse>> call({required int favoriteItemId}) async {
    return getIt<GetUserUseCase>().call().then(
            (value) => value.fold(
                (error) {
              return left(error);
            },
                (user) async {
                  return await repo.removeFavorite(token: user!.token!, favoriteItemId: favoriteItemId);
            }
        ));


  }

}