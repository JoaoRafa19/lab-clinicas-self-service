import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:flutter/material.dart';

final class SelfServiceModel {
  final String? name;
  final String? lastName;
  final PatientModel? patient;

  const SelfServiceModel({this.name, this.lastName, this.patient});

  SelfServiceModel clear() {
    return copyWith(
      lastName: () => null,
      patient: () => null,
      name: () => null,
    );
  }

  SelfServiceModel copyWith({
    ValueGetter<String?>? name,
    ValueGetter<String?>? lastName,
    ValueGetter<PatientModel?>? patient,
  }) {
    return SelfServiceModel(
      name: name != null ? name() : this.name,
      lastName: lastName != null ? lastName() : this.lastName,
      patient: patient != null ? patient() : this.patient,
    );
  }
}
