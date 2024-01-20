import 'package:equatable/equatable.dart';

class Task extends Equatable {
  const Task({
    required this.id,
    required this.date,
    this.title = '',
    this.ttitle = '',
    this.description = '',
    this.tdescription = '',
    this.completed = false,
  });

  final DateTime date;
  final String title;
  final String ttitle;
  final bool completed;
  final String description;
  final String tdescription;
  final String id;

  Task copyWith({
    String? id,
    DateTime? date,
    String? title,
    String? ttitle,
    String? description,
    String? tdescription,
    bool? completed,
  }) {
    return Task(
      date: date ?? this.date,
      title: title ?? this.title,
      ttitle: ttitle ?? this.ttitle,
      description: description ?? this.description,
      tdescription: tdescription ?? this.tdescription,
      completed: completed ?? this.completed,
      id: id ?? this.id,
    );
  }

  factory Task.fromJson(
      {required Map<String, dynamic> json, required String id}) {
    return Task(
      description: json['description'] ?? '',
      tdescription: json['tdescription'] ?? '',
      title: json['title'] ?? '',
      ttitle: json['ttitle'] ?? '',
      completed: json['completed'] ?? false,
      date: json['date'].toDate(),
      id: id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'tdescription': tdescription,
      'title': title,
      'ttitle': ttitle,
      'completed': completed,
      "date": date,
      "id": id,
    };
  }

  @override
  List<Object?> get props {
    return [
      title,
      ttitle,
      description,
      tdescription,
      date,
      completed,
      id,
    ];
  }
}
