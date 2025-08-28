import 'package:get_it/get_it.dart';
import 'package:testing_app/core/networking/api_service.dart';
import 'package:testing_app/core/networking/dio_factory.dart';
import 'package:testing_app/features/login/data/repos/login_repo.dart';
import 'package:testing_app/features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  // dio
  final dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
