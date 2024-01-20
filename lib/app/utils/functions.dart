import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:r5/app/models/item_time.dart';
import 'package:r5/app/models/task.dart';
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

  static List<Task> organizeListForTime(
      {required AsyncSnapshot<QuerySnapshot<Task>> snapshot,
      required bool flag}) {
    final taskList = snapshot.data!.docs.map((doc) => doc.data()).toList()
      ..removeWhere((element) => element.completed != flag);

    taskList.sort((a, b) => b.date.compareTo(a.date));


    return taskList;
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
