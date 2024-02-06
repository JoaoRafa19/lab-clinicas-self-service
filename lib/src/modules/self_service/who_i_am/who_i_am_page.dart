import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class WhoIAmPage extends StatelessWidget {
  const WhoIAmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Who Am I'),
      ),
      body: Column(
        children: [
          Container(),
          ElevatedButton(
              onPressed: () {
                Injector.get<SelfServiceController>().goPatient();
              },
              child: Text('Go to patient'))
        ],
      ),
    );
  }
}
