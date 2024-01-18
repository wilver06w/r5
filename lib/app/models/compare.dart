class Compare {
  Data data;

  Compare({
    required this.data,
  });

  factory Compare.fromJson(Map<String, dynamic> json) => Compare(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Result result;

  Data({
    required this.result,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class Result {
  double score;

  Result({
    this.score = 0.0,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        score: json["score"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "score": score,
      };
}
