import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validatorless/validatorless.dart';

class WhoIAmPage extends StatefulWidget {
  const WhoIAmPage({super.key});

  @override
  State<WhoIAmPage> createState() => _WhoIAmPageState();
}

class _WhoIAmPageState extends State<WhoIAmPage> {
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastNameEC = TextEditingController();

  final controller = Injector.get<SelfServiceController>();

  @override
  void dispose() {
    firstName.dispose();
    lastNameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        firstName.text = '';
        lastNameEC.text = '';
        controller.clearForm();
      },
      child: Scaffold(
        appBar: LabClinicasAppBar(
          actions: [
            PopupMenuButton(
              child: const IconPopUpMenuWidget(),
              onSelected: (value) async {
                if (value == 1) {
                  var nav = Navigator.of(context);
                  await SharedPreferences.getInstance()
                      .then((value) => value.clear());
                  nav.pushNamedAndRemoveUntil('/', (route) => false);
                }
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Finalizar terminal'),
                  ),
                ];
              },
            )
          ],
        ),
        body: LayoutBuilder(builder: (_, constraigts) {
          var sizeOf = MediaQuery.sizeOf(context);
          return SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background_login.png'),
                ),
              ),
              constraints: BoxConstraints(
                minHeight: constraigts.maxHeight,
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(40),
                  width: sizeOf.width * .8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Image.asset('assets/images/logo_vertical.png'),
                        const SizedBox(
                          height: 48,
                        ),
                        const Text(
                          "Bem Vindo!",
                          style: LabClinicasTheme.titleStyle,
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        TextFormField(
                          controller: firstName,
                          validator: Validatorless.required('Nome obrigatório'),
                          decoration: const InputDecoration(
                              label: Text("Digite seu nome")),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          validator:
                              Validatorless.required('Sobrenome obrigatório'),
                          controller: lastNameEC,
                          decoration: const InputDecoration(
                              label: Text("Digite seu sobrenome")),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                            width: sizeOf.width * .8,
                            height: 48,
                            child: ElevatedButton(
                                onPressed: () {
                                  final valid =
                                      formKey.currentState?.validate() ?? false;
                                  if (valid) {
                                    controller.setWhoIAmDataSeptAndNext(
                                      name: firstName.text,
                                      lastName: lastNameEC.text,
                                    );
                                  }
                                },
                                child: const Text('CONTINUAR')))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
