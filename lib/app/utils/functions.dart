import 'package:r5/app/models/item_time.dart';
import 'package:r5/app/utils/r5_ui.dart';

class Functions {
  static ItemTime timeText({required DateTime initial}) {
    DateTime now = DateTime.now();

    Duration time = now.difference(initial);

    return ItemTime(
      day: time.inDays,
      minute: time.inMinutes,
      hour: time.inHours,
    );
  }

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
