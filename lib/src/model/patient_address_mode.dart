import 'package:json_annotation/json_annotation.dart';

part 'patient_address_mode.g.dart';

@JsonSerializable()
class PatientAddressModel {
  PatientAddressModel({
    required this.cep,
    required this.state,
    required this.city,
    required this.district,
    required this.number,
    required this.addressComplement,
    required this.streetAddress,
  });

  final String cep;
  final String state;
  final String city;
  final String district;
  final String number;

  @JsonKey(name: 'address_complement')
  final String addressComplement;

  @JsonKey(name: 'street_address')
  final String streetAddress;
  factory PatientAddressModel.fromJson(Map<String, dynamic> json) =>
      _$PatientAddressModeFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAddressModeToJson(this);

  PatientAddressModel copyWith({
    String? cep,
    String? state,
    String? city,
    String? district,
    String? number,
    String? addressComplement,
    String? streetAddress,
  }) {
    return PatientAddressModel(
      cep: cep ?? this.cep,
      state: state ?? this.state,
      city: city ?? this.city,
      district: district ?? this.district,
      number: number ?? this.number,
      addressComplement: addressComplement ?? this.addressComplement,
      streetAddress: streetAddress ?? this.streetAddress,
    );
  }
}
