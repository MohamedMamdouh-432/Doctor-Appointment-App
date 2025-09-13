// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    SignupRequestBody(
      name: json['name'] as String,
      phone: json['phone'] as String,
      gender: (json['gender'] as num).toInt(),
      email: json['email'] as String,
      password: json['password'] as String,
      confirmationPassword: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$SignupRequestBodyToJson(SignupRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'gender': instance.gender,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.confirmationPassword,
    };
