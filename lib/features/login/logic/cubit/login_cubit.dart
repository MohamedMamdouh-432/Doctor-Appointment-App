import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/core/networking/api_result.dart';
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
        success: (data) => emit(LoginState.success(data)),
        failure: (error) => emit(LoginState.error(error.failure.message ?? '')),
      );
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }
}
