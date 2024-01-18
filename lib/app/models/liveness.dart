class Liveness {
  Data data;

  Liveness({
    required this.data,
  });

  factory Liveness.fromJson(Map<String, dynamic> json) => Liveness(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  double livenessMinScore;
  Result result;

  Data({
    this.livenessMinScore = 0.0,
    required this.result,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        livenessMinScore: json["liveness_min_score"]?.toDouble(),
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "liveness_min_score": livenessMinScore,
        "result": result.toJson(),
      };
}

class Result {
  double livenessScore;
  bool passed;
  double minScore;

  Result({
    this.livenessScore = 0.0,
    this.passed = false,
    this.minScore = 0.0,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        livenessScore: json["liveness_score"]?.toDouble(),
        passed: json["passed"] ?? false,
        minScore: json["min_score"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "liveness_score": livenessScore,
        "passed": passed,
        "min_score": minScore,
      };
}
