import 'package:equatable/equatable.dart';

class Task extends Equatable {
  const Task({
    required this.date,
    this.title = '',
    this.description = '',
    this.completed = false,
  });

  final DateTime date;
  final String title;
  final String description;
  final bool completed;

  Task copyWith({
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
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      description: json['description'] ?? '',
      title: json['title'] ?? '',
      completed: json['completed'] ?? false,
      date: DateTime.parse(json["date"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'title': title,
      'completed': completed,
      "date": date.toIso8601String(),
    };
  }

  @override
  List<Object?> get props {
    return [
      title,
      description,
      date,
      completed,
    ];
  }
}
