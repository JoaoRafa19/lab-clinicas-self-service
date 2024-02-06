import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/documents_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/scan/documents_scan_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/scan_confirm/documents_scan_confirm.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/done/done_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_dart.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/who_i_am/who_i_am_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SelfServiceModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/self-service';

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<SelfServiceController>(
            (i) => SelfServiceController())
      ];

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => const SelfServicePage(),
        '/who-i-am': (context) => WhoIAmPage(),
        '/find-patient': (context) => FindPatientDart(),
        '/patient': (context) => PatientPage(),
        '/documents': (context) => DocumentsPage(),
        '/documents/scan': (context) => DocumentsScanPage(),
        '/documents/scan/confirm': (context) => DocumentsScanConfirmPage(),
        '/done': (context) => DonePage(),
      };
}
