import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';

typedef RegisterPatientAddessModel = ({
  String cep,
  String streetAddress,
  String number,
  String addressComplement,
  String state,
  String city,
  String distric
});

typedef RegisterPatientModel = ({
  String name,
  String email,
  String document,
  String guardian,
  RegisterPatientAddessModel address,
  String phoneNumber,
  String guardianIdentificationNumber,
});

abstract interface class PatientsRepository {
  Future<Either<RepositoryException, PatientModel?>> findPatientByDocument(
      String document);

  Future<Either<RepositoryException, Unit>> update(PatientModel patient);

  Future<Either<RepositoryException, PatientModel>> register(
      RegisterPatientModel patient);
}
