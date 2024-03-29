import 'package:fe_lab_clinicas_self_service/src/model/patient_address_mode.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {
  final String id, name, email, document;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  final PatientAddressMode address;
  @JsonKey(name: 'guardian', defaultValue: '')
  final String guardian;

  @JsonKey(name: 'guardian_identification_number', defaultValue: '')
  final String guardianIdentificationNumber;

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);

  PatientModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.document,
      required this.address,
      required this.guardian,
      required this.guardianIdentificationNumber});

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
}
