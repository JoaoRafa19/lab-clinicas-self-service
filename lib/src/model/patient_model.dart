import 'package:fe_lab_clinicas_self_service/src/model/patient_address_mode.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {
  PatientModel({
    required this.id,
    required this.name,
    required this.email,
    required this.document,
    required this.phoneNumber,
    required this.address,
    required this.guardian,
    required this.guardianIdentificationNumber,
  });

  final String id;
  final String name;
  final String email;
  final String document;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  final PatientAddressMode address;
  @JsonKey(name: 'guardian', defaultValue: '')
  final String guardian;

  @JsonKey(name: 'guardian_identification_number', defaultValue: '')
  final String guardianIdentificationNumber;

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);

  PatientModel copyWith({
    String? id,
    String? name,
    String? email,
    String? document,
    String? phoneNumber,
    PatientAddressMode? address,
    String? guardian,
    String? guardianIdentificationNumber,
  }) {
    return PatientModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      document: document ?? this.document,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      guardian: guardian ?? this.guardian,
      guardianIdentificationNumber:
          guardianIdentificationNumber ?? this.guardianIdentificationNumber,
    );
  }
}
