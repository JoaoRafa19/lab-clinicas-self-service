import 'dart:typed_data';

import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/documents/documents_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class DocumentsScanConfirmController with MessageStateMixin {
  final DocumentsRepository documentsRepository;

  DocumentsScanConfirmController({required this.documentsRepository});

  final pathRemoteStorage = signal<String?>(null);
  Future<void> uploadImage(Uint8List imageByte, String filename) async {
    final result = await documentsRepository
        .uploadImage(imageByte, filename)
        .asyncLoader();
    switch (result) {
      case Left():
        showError('Erro ao fazer upload da image');
      case Right(value: final pathFile):
        pathRemoteStorage.value = pathFile;
    }
  }
}
