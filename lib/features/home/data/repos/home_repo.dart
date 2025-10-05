import 'package:testing_app/core/networking/api_error_handler.dart';
import 'package:testing_app/core/networking/api_result.dart';
import 'package:testing_app/core/networking/api_service.dart';
import 'package:testing_app/features/home/data/models/doctors_response.dart';
import 'package:testing_app/features/home/data/models/specializations_response.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<SpecializationsResponse>> fetchAllSpecializations() async {
    try {
      final response = await _apiService.fetchAllSpecializations();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<DoctorsResponse>> fetchAllDoctors() async {
    try {
      final response = await _apiService.fetchAllDoctors();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
