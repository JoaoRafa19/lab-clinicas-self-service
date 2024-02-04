import 'package:fe_lab_clinicas_core/lab_clinicas_core_config.dart';
import 'package:fe_lab_clinicas_self_service/src/binding/lab_clinicas_application_binding.dart';
import 'package:fe_lab_clinicas_self_service/src/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runApp(const LabClinicasSelfServiceApp());
}

class LabClinicasSelfServiceApp extends StatelessWidget {
  const LabClinicasSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      binding: LabClinicasApplicationBinding(),

      pageBuilders: [
        FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: "/")
      ],
      title: "Lab Clinicas Auto Atendimento",
    );
  }
}
