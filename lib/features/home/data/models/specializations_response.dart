import 'package:json_annotation/json_annotation.dart';
import 'package:testing_app/features/home/data/models/doctors_response.dart';

part 'specializations_response.g.dart';

@JsonSerializable()
class SpecializationsResponse {
  String? message;
  @JsonKey(name: 'data')
  List<Specialization>? specializaties;
  bool? status;
  int? code;

  SpecializationsResponse({
    this.message,
    this.specializaties,
    this.status,
    this.code,
  });

  factory SpecializationsResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsResponseFromJson(json);
}

@JsonSerializable()
class Specialization {
  int? id;
  String? name;
  @JsonKey(name: 'doctors')
  List<Doctor>? doctors;

  Specialization({this.id, this.name, this.doctors});

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);
}
