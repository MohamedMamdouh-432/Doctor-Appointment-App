import 'package:json_annotation/json_annotation.dart';
part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String name;
  final String phone;
  final int gender;
  final String email;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String confirmationPassword;

  SignupRequestBody({
    required this.name,
    required this.phone,
    required this.gender,
    required this.email,
    required this.password,
    required this.confirmationPassword,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);

  SignupRequestBody copyWith({
    String? email,
    String? password,
    String? name,
    String? phone,
    int? gender,
    String? confirmationPassword,
  }) {
    return SignupRequestBody(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      confirmationPassword: confirmationPassword ?? this.confirmationPassword,
    );
  }
}
