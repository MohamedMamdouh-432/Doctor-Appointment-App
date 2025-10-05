import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/core/helpers/cache_helper.dart';
import 'package:testing_app/core/helpers/constants.dart';
import 'package:testing_app/core/networking/api_result.dart';
import 'package:testing_app/core/networking/dio_factory.dart';
import 'package:testing_app/features/login/data/models/login_request_body.dart';
import 'package:testing_app/features/login/data/repos/login_repo.dart';
import 'package:testing_app/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginState.initial());

  void login(LoginRequestBody loginData) async {
    emit(LoginState.loading());
    try {
      final response = await loginRepo.login(loginData);
      response.when(
        success: (loginResponse) async {
          await CacheHelper.setSecuredString(
            Constants.userToken,
            loginResponse.userData?.token ?? '',
          );
          DioFactory.setUpdatedToken(loginResponse.userData?.token ?? '');
          emit(LoginState.success(loginResponse));
        },
        failure: (error) => emit(LoginState.error(error.failure.message ?? '')),
      );
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }
}
