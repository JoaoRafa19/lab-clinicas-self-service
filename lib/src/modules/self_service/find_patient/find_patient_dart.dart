import 'package:flutter/material.dart';

class FindPatientDart extends StatefulWidget {

  const FindPatientDart({ super.key });

  @override
  State<FindPatientDart> createState() => _FindPatientDartState();
}

class _FindPatientDartState extends State<FindPatientDart> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Find Patient'),),
           body: Container(),
       );
  }
}