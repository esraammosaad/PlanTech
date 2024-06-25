class CareGuideModel {
  final List<CareGuideData> ?data;
  final int ?to;
  final int ?perPage;
  final int ?currentPage;
  final int ?from;
  final int ?lastPage;
  final int ?total;

  CareGuideModel({
    required this.data,
    required this.to,
    required this.perPage,
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.total,
  });

  factory CareGuideModel.fromJson(Map<String, dynamic> json) => CareGuideModel(
    data:json["data"]!=null? List<CareGuideData>.from(json["data"].map((x) => CareGuideData.fromJson(x))):null,
    to: json["to"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    total: json["total"],
  );


}

class CareGuideData {
  final int ?id;
  final int ?speciesId;
  final String? commonName;
  final List<String?> ?scientificName;
  final List<Section?>? section;

  CareGuideData({
    required this.id,
    required this.speciesId,
    required this.commonName,
    required this.scientificName,
    required this.section,
  });

  factory CareGuideData.fromJson(Map<String, dynamic> json) => CareGuideData(
    id: json["id"],
    speciesId: json["species_id"],
    commonName: json["common_name"],
    scientificName: json["scientific_name"]!=null?List<String>.from(json["scientific_name"].map((x) => x)):null,
    section:json["section"]!=null? List<Section>.from(json["section"].map((x) => Section.fromJson(x))):null,
  );


}

class Section {
  final int? id;
  final String? type;
  final String ?description;

  Section({
    required this.id,
    required this.type,
    required this.description,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    id: json["id"],
    type: json["type"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "description": description,
  };
}
