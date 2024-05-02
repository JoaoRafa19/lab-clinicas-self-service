import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          clipBehavior: Clip.hardEdge,
          child: Container(
            width: sizeOf.width * .85,
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/stroke_check.png'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'SUA SENHA É',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 218,
                    maxWidth: 250,
                    minHeight: 48,
                  ),
                  decoration: BoxDecoration(
                    color: LabClinicasTheme.orangeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: const Text(
                    'BG5898',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: LabClinicasTheme.blueColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(text: 'AGUARDE!\n'),
                      TextSpan(text: 'Sua senha será chamada no painel.'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'IMPRIMIR SENHA',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            'ENVIAR SENHA VIA SMS',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LabClinicasTheme.orangeColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'FINALIZAR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
