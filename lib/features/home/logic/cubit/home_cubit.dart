import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/core/networking/api_result.dart';
import 'package:testing_app/features/home/data/models/doctors_response.dart';
import 'package:testing_app/features/home/data/models/load_status.dart';
import 'package:testing_app/features/home/data/models/specializations_response.dart';
import 'package:testing_app/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeState.initial);

  void fetchAllSpecialities() async {
    try {
      emit(state.copyWith(specializationsLoadStatus: LoadStatus.loading));
      final response = await homeRepo.fetchAllSpecializations();
      response.when(
        success: (sr) => emit(
          state.copyWith(
            specializationsLoadStatus: LoadStatus.success,
            specializationsResponse: sr,
          ),
        ),
        failure: (error) => emit(
          state.copyWith(
            specializationsLoadStatus: LoadStatus.error,
            specializationsResponse: SpecializationsResponse(
              message: error.failure.message,
            ),
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          specializationsLoadStatus: LoadStatus.error,
          specializationsResponse: SpecializationsResponse(
            message: e.toString(),
          ),
        ),
      );
    }
  }
  
  void fetchAllDoctors() async {
    try {
      emit(state.copyWith(doctorsLoadStatus: LoadStatus.loading));
      final response = await homeRepo.fetchAllDoctors();
      response.when(
        success: (dr) => emit(
          state.copyWith(
            doctorsLoadStatus: LoadStatus.success,
            doctorsResponse: dr,
          ),
        ),
        failure: (error) => emit(
          state.copyWith(
            doctorsLoadStatus: LoadStatus.error,
            doctorsResponse: DoctorsResponse(
              message: error.failure.message,
            ),
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          doctorsLoadStatus: LoadStatus.error,
          doctorsResponse: DoctorsResponse(
            message: e.toString(),
          ),
        ),
      );
    }
  }
}
