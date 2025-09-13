import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/core/networking/api_result.dart';
import 'package:testing_app/features/signup/data/models/signup_request_body.dart';
import 'package:testing_app/features/signup/data/repos/signup_repo.dart';
import 'package:testing_app/features/signup/logic/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;

  SignupCubit(this.signupRepo) : super(SignupState.initial());

  void signup(SignupRequestBody signupData) async {
    emit(SignupState.loading());
    try {
    final response = await signupRepo.signup(signupData);
      response.when(
        success: (data) => emit(SignupState.success(data)),
        failure: (error) => emit(SignupState.error(error.failure.message ?? '')),
      );
    } catch (e) {
      emit(SignupState.error(e.toString()));
    }
  }
}
