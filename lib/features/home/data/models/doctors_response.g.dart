// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorsResponse _$DoctorsResponseFromJson(Map<String, dynamic> json) =>
    DoctorsResponse(
      message: json['message'] as String?,
      doctors: (json['data'] as List<dynamic>?)
          ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DoctorsResponseToJson(DoctorsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.doctors,
      'status': instance.status,
      'code': instance.code,
    };

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
  gender: json['gender'] as String?,
  address: json['address'] as String?,
  degree: json['degree'] as String?,
  specialization: json['specialization'] == null
      ? null
      : Specialization.fromJson(json['specialization'] as Map<String, dynamic>),
  appointPrice: (json['appoint_price'] as num?)?.toDouble(),
  startTime: json['start_time'] as String?,
  endTime: json['end_time'] as String?,
);

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'photo': instance.photo,
  'gender': instance.gender,
  'address': instance.address,
  'degree': instance.degree,
  'specialization': instance.specialization,
  'appoint_price': instance.appointPrice,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
};
