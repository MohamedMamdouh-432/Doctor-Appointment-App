part of 'home_cubit.dart';

class HomeState extends Equatable {
  final SpecializationsResponse specializationsResponse;
  final DoctorsResponse doctorsResponse;
  final LoadStatus specializationsLoadStatus;
  final LoadStatus doctorsLoadStatus;

  const HomeState({
    required this.specializationsResponse,
    required this.doctorsResponse,
    required this.specializationsLoadStatus,
    required this.doctorsLoadStatus,
  });
  
  static HomeState initial = HomeState(
    specializationsResponse: SpecializationsResponse(),
    doctorsResponse: DoctorsResponse(),
    specializationsLoadStatus: LoadStatus.initial,
    doctorsLoadStatus: LoadStatus.initial
  );

  HomeState copyWith({
    SpecializationsResponse? specializationsResponse,
    DoctorsResponse? doctorsResponse,
    LoadStatus? specializationsLoadStatus,
    LoadStatus? doctorsLoadStatus,
  }) {
    return HomeState(
      specializationsResponse:
          specializationsResponse ?? this.specializationsResponse,
      doctorsResponse: doctorsResponse ?? this.doctorsResponse,
      specializationsLoadStatus:
          specializationsLoadStatus ?? this.specializationsLoadStatus,
      doctorsLoadStatus: doctorsLoadStatus ?? this.doctorsLoadStatus,
    );
  }

  @override
  String toString() =>
      """Home State :: 
  Specializations: ${specializationsResponse.specializaties?.length ?? "None"}
  Doctors: ${doctorsResponse.doctors?.length ?? "None"}
  Specializations Load Status: $specializationsLoadStatus
  Doctors Load Status: $doctorsLoadStatus""";

  @override
  List<Object> get props => [
    specializationsResponse,
    doctorsResponse,
    specializationsLoadStatus,
    doctorsLoadStatus,
  ];
}
