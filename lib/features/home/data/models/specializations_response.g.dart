// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specializations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationsResponse _$SpecializationsResponseFromJson(
  Map<String, dynamic> json,
) => SpecializationsResponse(
  message: json['message'] as String?,
  specializaties: (json['data'] as List<dynamic>?)
      ?.map((e) => Specialization.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: json['status'] as bool?,
  code: (json['code'] as num?)?.toInt(),
);

Map<String, dynamic> _$SpecializationsResponseToJson(
  SpecializationsResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'data': instance.specializaties,
  'status': instance.status,
  'code': instance.code,
};

Specialization _$SpecializationFromJson(Map<String, dynamic> json) =>
    Specialization(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      doctors: (json['doctors'] as List<dynamic>?)
          ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecializationToJson(Specialization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'doctors': instance.doctors,
    };
