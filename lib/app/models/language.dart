import 'package:equatable/equatable.dart';

class Language extends Equatable {
  const Language({
    this.code = '',
    this.name = '',
    this.imageUrl = '',
  });
  
  final String code;
  final String name;
  final String imageUrl;

  Language copyWith({
    String? code,
    String? name,
    String? imageUrl,
  }) {
    return Language(
      code: code ?? this.code,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'image_url': imageUrl,
    };
  }

  @override
  List<Object?> get props {
    return [
      code,
      name,
      imageUrl,
    ];
  }
}
