import 'dart:typed_data';

import 'package:r5/app/models/document.dart';

class DataDialog {
  const DataDialog({
    required this.documentDetails,
    required this.imageMemory,
  });

  final DocumentDetails documentDetails;
  final Uint8List imageMemory;
}
