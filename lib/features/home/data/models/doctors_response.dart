import 'package:json_annotation/json_annotation.dart';
import 'package:testing_app/features/home/data/models/specializations_response.dart';

part 'doctors_response.g.dart';

@JsonSerializable()
class DoctorsResponse {
  String? message;
  @JsonKey(name: 'data')
  List<Doctor>? doctors;
  bool? status;
  int? code;

  DoctorsResponse({this.message, this.doctors, this.status, this.code});

  factory DoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorsResponseFromJson(json);
}

@JsonSerializable()
class Doctor {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? degree;
  Specialization? specialization;
  @JsonKey(name: 'appoint_price')
  double? appointPrice;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'end_time')
  String? endTime;

  Doctor({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.degree,
    this.specialization,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}
