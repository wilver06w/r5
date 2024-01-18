import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:r5/app/utils/functions.dart';

class Task extends Equatable {
  const Task({
    required this.id,
    required this.date,
    this.title = '',
    this.description = '',
    this.completed = false,
  });

  final DateTime date;
  final String title;
  final bool completed;
  final String description;
  final String id;

  Task copyWith({
    String? id,
    DateTime? date,
    String? title,
    String? description,
    bool? completed,
  }) {
    return Task(
      date: date ?? this.date,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      id: id ?? this.id,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      description: json['description'] ?? '',
      title: json['title'] ?? '',
      completed: json['completed'] ?? false,
      date: json['date'].toDate(),
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'title': title,
      'completed': completed,
      "date": date,
      "id": id,
    };
  }

  @override
  List<Object?> get props {
    return [
      title,
      description,
      date,
      completed,
      id,
    ];
  }
}
