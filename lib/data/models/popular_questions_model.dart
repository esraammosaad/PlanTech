class PopularQuestionsModel {
  final List<Questions> data;
  final int ?to;
  final int ?perPage;
  final int ?currentPage;
  final int ?from;
  final int ?lastPage;
  final int ?total;

  PopularQuestionsModel({
    required this.data,
    required this.to,
    required this.perPage,
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.total,
  });

  factory PopularQuestionsModel.fromJson(Map<String, dynamic> json) => PopularQuestionsModel(
    data: List<Questions>.from(json["data"].map((x) => Questions.fromJson(x))),
    to: json["to"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "to": to,
    "per_page": perPage,
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "total": total,
  };
}

class Questions {
  final int ?id;
  final String ?question;
  final String ?answer;
  final List<String?> tags;
  final DefaultImage ?defaultImage;

  Questions({
    required this.id,
    required this.question,
    required this.answer,
    required this.tags,
    required this.defaultImage,
  });

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
    id: json["id"],
    question: json["question"],
    answer: json["answer"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    defaultImage: DefaultImage.fromJson(json["default_image"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "answer": answer,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "default_image": defaultImage?.toJson(),
  };
}

class DefaultImage {
  final int ?license;
  final String ?licenseName;
  final String ?licenseUrl;
  final String ?originalUrl;
  final String ?regularUrl;
  final String ?mediumUrl;

  DefaultImage({
    required this.license,
    required this.licenseName,
    required this.licenseUrl,
    required this.originalUrl,
    required this.regularUrl,
    required this.mediumUrl,
  });

  factory DefaultImage.fromJson(Map<String, dynamic> ? json) => DefaultImage(
    license: json?["license"],
    licenseName: json?["license_name"],
    licenseUrl: json?["license_url"],
    originalUrl: json?["original_url"],
    regularUrl: json?["regular_url"],
    mediumUrl: json?["medium_url"],
  );

  Map<String, dynamic> toJson() => {
    "license": license,
    "license_name": licenseName,
    "license_url": licenseUrl,
    "original_url": originalUrl,
    "regular_url": regularUrl,
    "medium_url": mediumUrl,
  };
}
