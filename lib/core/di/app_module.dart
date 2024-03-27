import 'package:Mawthoq/core/infrastructure/api/api.dart';
import 'package:Mawthoq/core/usecases/validate_amount_use_case.dart';
import 'package:Mawthoq/core/usecases/validate_email_use_case.dart';
import 'package:Mawthoq/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:Mawthoq/features/auth/domain/usecases/delete_user_use_case.dart';
import 'package:Mawthoq/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:Mawthoq/features/auth/domain/usecases/logout_all_use_case.dart';
import 'package:Mawthoq/features/auth/domain/usecases/logout_use_case.dart';
import 'package:Mawthoq/features/auth/domain/usecases/set_user_use_case.dart';
import 'package:Mawthoq/features/auth/domain/usecases/update_user_use_case.dart';
import 'package:Mawthoq/features/cart/data/entities/get_cart_response.dart';
import 'package:Mawthoq/features/cart/data/repo/cart_repo_impl.dart';
import 'package:Mawthoq/features/cart/domain/repo/cart_repo.dart';
import 'package:Mawthoq/features/cart/domain/usecase/add_to_cart_use_case.dart';
import 'package:Mawthoq/features/cart/domain/usecase/get_cart_use_case.dart';
import 'package:Mawthoq/features/cart/domain/usecase/remove_from_cart_use_case.dart';
import 'package:Mawthoq/features/home/data/data_source/remote/property_remote_data_source.dart';
import 'package:Mawthoq/features/home/data/repo/property_repo_impl.dart';
import 'package:Mawthoq/features/home/domain/repo/property_repo.dart';
import 'package:Mawthoq/features/home/domain/usecases/get_all_properties_use_case.dart';
import 'package:Mawthoq/features/home/domain/usecases/get_one_property_use_case.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/data_source/remote/auth_remote_data_source.dart';
import '../../features/cart/data/data_source/remote/cart_remote_data_source.dart';
import '/core/infrastructure/services/image_picker_service.dart';
import '/core/usecases/validate_password_use_case.dart';
import '/core/usecases/validate_phone_use_case.dart';
import '/core/usecases/validate_username_use_case.dart';
import '/features/auth/data/repo/auth_repo_impl.dart';
import '/features/auth/domain/repo/auth_repo.dart';
import '/features/auth/domain/usecases/register_use_case.dart';
import '/features/auth/domain/usecases/login_use_case.dart';
import '../infrastructure/services/network_service.dart';

final GetIt getIt = GetIt.instance;

abstract class AppModule {

  static void setup() {

    //services
    getIt.registerSingleton<NetworkService>(NetworkServiceImpl());
    getIt.registerSingleton<ImagePickerService>(ImagePickerServiceImpl());
    getIt.registerSingleton<Api>(ApiImpl());

    //data source
    getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());
    getIt.registerSingleton<AuthLocalDataSource>(AuthLocalDataSourceImpl());
    getIt.registerSingleton<PropertyRemoteDataSource>(PropertyRemoteDataSourceImpl());
    getIt.registerSingleton<CartRemoteDataSource>(CartRemoteDataSourceImpl());

    //repos
    getIt.registerSingleton<AuthRepo>(AuthRepoImpl());
    getIt.registerSingleton<PropertyRepo>(PropertyRepoImpl());
    getIt.registerSingleton<CartRepo>(CartRepoImpl());

    //use case
    getIt.registerSingleton<LoginUseCase>(LoginUseCase());
    getIt.registerSingleton<RegisterUseCase>(RegisterUseCase());
    getIt.registerSingleton<LogoutUseCase>(LogoutUseCase());
    getIt.registerSingleton<LogoutAllUseCase>(LogoutAllUseCase());

    getIt.registerSingleton<DeleteUserUseCase>(DeleteUserUseCase());
    getIt.registerSingleton<GetUserUseCase>(GetUserUseCase());
    getIt.registerSingleton<UpdateUserUseCase>(UpdateUserUseCase());
    getIt.registerSingleton<SetUserUseCase>(SetUserUseCase());

    getIt.registerSingleton<GetAllPropertiesUseCase>(GetAllPropertiesUseCase());
    getIt.registerSingleton<GetOnePropertyUseCase>(GetOnePropertyUseCase());

    getIt.registerSingleton<AddToCartUseCase>(AddToCartUseCase());
    getIt.registerSingleton<RemoveFromCartUseCase>(RemoveFromCartUseCase());
    getIt.registerSingleton<GetCartUseCase>(GetCartUseCase());


    //validate form field
    getIt.registerSingleton<ValidatePhoneUseCase>(ValidatePhoneUseCase());
    getIt.registerSingleton<ValidatePasswordUseCase>(ValidatePasswordUseCase());
    getIt.registerSingleton<ValidateUsernameUseCase>(ValidateUsernameUseCase());
    getIt.registerSingleton<ValidateEmailUseCase>(ValidateEmailUseCase());
    getIt.registerSingleton<ValidateAmountUseCase>(ValidateAmountUseCase());



  }


}

