class DocumentDetails {
  Data data;

  DocumentDetails({
    required this.data,
  });

  factory DocumentDetails.fromJson(Map<String, dynamic> json) =>
      DocumentDetails(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  DocumentType documentType;
  dynamic pro;
  Prompt prompt;
  Studio studio;

  Data({
    required this.documentType,
    required this.pro,
    required this.prompt,
    required this.studio,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        documentType: DocumentType.fromJson(json["documentType"]),
        pro: json["pro"],
        prompt: Prompt.fromJson(json["prompt"]),
        studio: Studio.fromJson(json["studio"]),
      );

  Map<String, dynamic> toJson() => {
        "documentType": documentType.toJson(),
        "pro": pro,
        "prompt": prompt.toJson(),
        "studio": studio.toJson(),
      };
}

class DocumentType {
  String documentType;
  String category;
  String country;
  String ocrRaw;
  String prompt;

  DocumentType({
    this.documentType = '',
    this.category = '',
    this.country = '',
    this.ocrRaw = '',
    this.prompt = '',
  });

  factory DocumentType.fromJson(Map<String, dynamic> json) => DocumentType(
        documentType: json["documentType"] ?? '',
        category: json["category"] ?? '',
        country: json["country"] ?? '',
        ocrRaw: json["ocrRaw"] ?? '',
        prompt: json["prompt"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "documentType": documentType,
        "category": category,
        "country": country,
        "ocrRaw": ocrRaw,
        "prompt": prompt,
      };
}

class Prompt {
  String documentType;
  String status;
  bool imageValidated;
  String validationMethod;
  String type;
  String id;
  bool deleted;
  String documentNumber;
  String url;
  PromptOcrExtraction ocrExtraction;
  DateTime updatedAt;
  DateTime createdAt;

  Prompt({
    this.documentType = '',
    this.status = '',
    this.imageValidated = false,
    this.validationMethod = '',
    this.type = '',
    this.id = '',
    this.deleted = false,
    this.documentNumber = '',
    this.url = '',
    required this.ocrExtraction,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Prompt.fromJson(Map<String, dynamic> json) => Prompt(
        documentType: json["documentType"] ?? '',
        status: json["status"] ?? '',
        imageValidated: json["imageValidated"] ?? false,
        validationMethod: json["validationMethod"] ?? '',
        type: json["type"] ?? '',
        id: json["_id"] ?? '',
        deleted: json["deleted"] ?? false,
        documentNumber: json["documentNumber"] ?? '',
        url: json["url"] ?? '',
        ocrExtraction: PromptOcrExtraction.fromJson(json["OCRExtraction"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "documentType": documentType,
        "status": status,
        "imageValidated": imageValidated,
        "validationMethod": validationMethod,
        "type": type,
        "_id": id,
        "deleted": deleted,
        "documentNumber": documentNumber,
        "url": url,
        "OCRExtraction": ocrExtraction.toJson(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}

class PromptOcrExtraction {
  String firstName;
  String lastName;
  String fullName;
  String documentNumber;

  PromptOcrExtraction({
    this.firstName = '',
    this.lastName = '',
    this.fullName = '',
    this.documentNumber = '',
  });

  factory PromptOcrExtraction.fromJson(Map<String, dynamic> json) =>
      PromptOcrExtraction(
        firstName: json["firstName"] ?? '',
        lastName: json["lastName"] ?? '',
        fullName: json["fullName"] ?? '',
        documentNumber: json["documentNumber"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "documentNumber": documentNumber,
      };
}

class Studio {
  String documentType;
  String status;
  bool imageValidated;
  String validationMethod;
  String type;
  String id;
  bool deleted;
  String documentNumber;
  String url;
  StudioOcrExtraction ocrExtraction;
  DateTime updatedAt;
  DateTime createdAt;

  Studio({
    this.documentType = '',
    this.status = '',
    this.imageValidated = false,
    this.validationMethod = '',
    this.type = '',
    this.id = '',
    this.deleted = false,
    this.documentNumber = '',
    this.url = '',
    required this.ocrExtraction,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Studio.fromJson(Map<String, dynamic> json) => Studio(
        documentType: json["documentType"] ?? '',
        status: json["status"] ?? false,
        imageValidated: json["imageValidated"] ?? false,
        validationMethod: json["validationMethod"] = '',
        type: json["type"] ?? '',
        id: json["_id"] ?? '',
        deleted: json["deleted"] ?? false,
        documentNumber: json["documentNumber"] ?? '',
        url: json["url"] ?? '',
        ocrExtraction: StudioOcrExtraction.fromJson(json["OCRExtraction"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "documentType": documentType,
        "status": status,
        "imageValidated": imageValidated,
        "validationMethod": validationMethod,
        "type": type,
        "_id": id,
        "deleted": deleted,
        "documentNumber": documentNumber,
        "url": url,
        "OCRExtraction": ocrExtraction.toJson(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}

class StudioOcrExtraction {
  Details details;
  String firstName;
  String documentNumber;
  String fullName;

  StudioOcrExtraction({
    required this.details,
    this.firstName = '',
    this.documentNumber = '',
    this.fullName = '',
  });

  factory StudioOcrExtraction.fromJson(Map<String, dynamic> json) =>
      StudioOcrExtraction(
        details: Details.fromJson(json["details"]),
        firstName: json["firstName"] ?? '',
        documentNumber: json["documentNumber"] ?? '',
        fullName: json["fullName"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "details": details.toJson(),
        "firstName": firstName,
        "documentNumber": documentNumber,
        "fullName": fullName,
      };
}

class Details {
  String docType;
  Fields fields;
  double confidence;

  Details({
    this.docType = '',
    required this.fields,
    required this.confidence,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        docType: json["docType"] ?? '',
        fields: Fields.fromJson(json["fields"]),
        confidence: json["confidence"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "docType": docType,
        "fields": fields.toJson(),
        "confidence": confidence,
      };
}

class Polygon {
  int x;
  int y;

  Polygon({
    required this.x,
    required this.y,
  });

  factory Polygon.fromJson(Map<String, dynamic> json) => Polygon(
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

class Fields {
  DocumentNumber firstName;
  DocumentNumber documentNumber;
  LastName lastName;

  Fields({
    required this.firstName,
    required this.documentNumber,
    required this.lastName,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        firstName: DocumentNumber.fromJson(json["firstName"]),
        documentNumber: DocumentNumber.fromJson(json["documentNumber"]),
        lastName: LastName.fromJson(json["lastName"]),
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName.toJson(),
        "documentNumber": documentNumber.toJson(),
        "lastName": lastName.toJson(),
      };
}

class DocumentNumber {
  String kind;
  String value;
  String content;
  double confidence;

  DocumentNumber({
    this.kind = '',
    this.value = '',
    this.content = '',
    required this.confidence,
  });

  factory DocumentNumber.fromJson(Map<String, dynamic> json) => DocumentNumber(
        kind: json["kind"] ?? '',
        value: json["value"] ?? '',
         content: json["content"] ?? '',
        confidence: json["confidence"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "value": value,
        "content": content,
        "confidence": confidence,
      };
}

class Span {
  int offset;
  int length;

  Span({
    required this.offset,
    required this.length,
  });

  factory Span.fromJson(Map<String, dynamic> json) => Span(
        offset: json["offset"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "length": length,
      };
}

class LastName {
  String kind;
  double confidence;

  LastName({
    this.kind = '',
    this.confidence = 0.0,
  });

  factory LastName.fromJson(Map<String, dynamic> json) => LastName(
        kind: json["kind"] ?? '',
        confidence: json["confidence"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "confidence": confidence,
      };
}
