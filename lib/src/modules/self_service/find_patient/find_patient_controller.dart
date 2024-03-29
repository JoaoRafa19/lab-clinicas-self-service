import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patients/patients_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FindPatientController with MessageStateMixin {
  FindPatientController({required PatientsRepository patientsRepository})
      : _patientsRepository = patientsRepository;

  final PatientsRepository _patientsRepository;

  final _patientNotFound = ValueSignal<bool?>(null);
  bool? get patientNotFound => _patientNotFound();

  final _patient = ValueSignal<PatientModel?>(null);
  PatientModel? get patient => _patient();

  Future<void> findPatientByDocument(String document) async {
    final patientResult =
        await _patientsRepository.findPatientByDocument(document);

    bool patientNotFount;
    PatientModel? patient;

    switch (patientResult) {
      case Right(value: PatientModel model?):
        patientNotFount = false;
        patient = model;
      case Right(value: _):
        patientNotFount = true;
        patient = null;
      case Left():
        showError("Erro ao buscar paciente");
        return;
    }

    batch(() {
      _patient.value = patient;
      _patientNotFound.forceUpdate(patientNotFount);
    });
  }

  void continueWithoutDocument() {
    batch(() {
      _patient.value = null;
      _patientNotFound.forceUpdate(true);
    });
  }
}
