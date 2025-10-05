import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:testing_app/core/networking/api_constants.dart';
import 'package:testing_app/features/home/data/models/doctors_response.dart';
import 'package:testing_app/features/home/data/models/specializations_response.dart';
import 'package:testing_app/features/login/data/models/login_request_body.dart';
import 'package:testing_app/features/login/data/models/login_response.dart';
import 'package:testing_app/features/signup/data/models/signup_request_body.dart';
import 'package:testing_app/features/signup/data/models/signup_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);
  
  @GET(ApiConstants.specializations)
  Future<SpecializationsResponse> fetchAllSpecializations();
  
  @GET(ApiConstants.doctors)
  Future<DoctorsResponse> fetchAllDoctors();
}
