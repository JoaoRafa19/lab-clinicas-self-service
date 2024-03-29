import 'package:json_annotation/json_annotation.dart';

part 'patient_address_mode.g.dart';

@JsonSerializable()
class PatientAddressMode {
  final String cep, state, city, district, number;

  @JsonKey(name: 'address_complement')
  final String addressComplement;

  @JsonKey(name: 'street_address')
  final String streetAddress;
  factory PatientAddressMode.fromJson(Map<String, dynamic> json) =>
      _$PatientAddressModeFromJson(json);

  PatientAddressMode(
      {required this.cep,
      required this.state,
      required this.city,
      required this.district,
      required this.number,
      required this.addressComplement,
      required this.streetAddress});

  Map<String, dynamic> toJson() => _$PatientAddressModeToJson(this);
}
