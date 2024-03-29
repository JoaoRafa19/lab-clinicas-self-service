import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patients/patients_repository.dart';
import 'package:flutter/material.dart';

mixin PatientFormController on State<PatientPage> {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneEC = TextEditingController();
  final documentEC = TextEditingController();
  final cepEC = TextEditingController();
  final streetEC = TextEditingController();
  final numberEC = TextEditingController();
  final complementEC = TextEditingController();
  final stateEC = TextEditingController();
  final cityEC = TextEditingController();
  final districtEC = TextEditingController();
  final guardianEC = TextEditingController();
  final guardianIdentificationNumberEC = TextEditingController();

  void disposeForm() {
    nameEC.dispose();
    emailEC.dispose();
    phoneEC.dispose();
    documentEC.dispose();
    cepEC.dispose();
    streetEC.dispose();
    numberEC.dispose();
    complementEC.dispose();
    stateEC.dispose();
    cityEC.dispose();
    districtEC.dispose();
    guardianEC.dispose();
    guardianIdentificationNumberEC.dispose();
  }

  void initializeForm(final PatientModel? model) {
    if (model != null) {
      nameEC.text = model.name;
      emailEC.text = model.email;
      phoneEC.text = model.phoneNumber;
      documentEC.text = model.document;
      cepEC.text = model.address.cep;
      streetEC.text = model.address.streetAddress;
      numberEC.text = model.address.number;
      complementEC.text = model.address.addressComplement;
      stateEC.text = model.address.state;
      cityEC.text = model.address.city;
      districtEC.text = model.address.district;
      guardianEC.text = model.guardian;
      guardianIdentificationNumberEC.text = model.guardianIdentificationNumber;
    }
  }

  PatientModel updatePatient(PatientModel patient) {
    return patient.copyWith(
      document: documentEC.text,
      phoneNumber: phoneEC.text,
      email: emailEC.text,
      guardian: guardianEC.text,
      guardianIdentificationNumber: guardianIdentificationNumberEC.text,
      name: nameEC.text,
      address: patient.address.copyWith(
        addressComplement: complementEC.text,
        cep: cepEC.text,
        city: cityEC.text,
        district: districtEC.text,
        number: numberEC.text,
        state: stateEC.text,
        streetAddress: streetEC.text,
      ),
    );
  }

  RegisterPatientModel createPatientRegister() {
    return (
      name: nameEC.text,
      email: emailEC.text,
      document: documentEC.text,
      address: (
        addressComplement: complementEC.text,
        cep: cepEC.text,
        city: cityEC.text,
        distric: districtEC.text,
        number: numberEC.text,
        state: stateEC.text,
        streetAddress: streetEC.text
      ),
      guardian: guardianEC.text,
      guardianIdentificationNumber: guardianIdentificationNumberEC.text,
      phoneNumber: phoneEC.text
    );
  }
}
