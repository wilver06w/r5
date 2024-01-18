import 'package:r5/app/utils/r5_ui.dart';

class Functions {
  static String? textMothDay({required int moth, required int day}) {
    return '$day ${R5UiValues.of} ${moths[moth - 1]}';
  }

  static List<String> moths = [
    "enero",
    "febrero",
    "marzo",
    "abril",
    "mayo",
    "junio",
    "julio",
    "agosto",
    "septiembre",
    "octubre",
    "noviembre",
    "diciembre",
  ];
}
