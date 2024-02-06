import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/self_service_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps {
  none,
  whoIAm,
  findPatients,
  patient,
  documents,
  done,
  restart,
}

class SelfServiceController with MessageStateMixin {
  var _model = const SelfServiceModel();

  final _step = ValueSignal(FormSteps.none);
  FormSteps get step => _step();

  void startProcess() {
    _step.forceUpdate(
      FormSteps.whoIAm,
    );
  }

  void setWhoIAmDataSeptAndNext(
      {required String name, required String lastName}) {
    _model = _model.copyWith(
      name: () => name,
      lastName: () => lastName,
    );
    _step.forceUpdate(
      FormSteps.findPatients,
    );
  }

  void clearForm() {
    _model = _model.clear();
  }
}
