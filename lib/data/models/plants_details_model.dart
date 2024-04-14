import 'dart:convert';

PlantsDetailsModel plantsDetailsModelFromJson(String str) => PlantsDetailsModel.fromJson(json.decode(str));

String plantsDetailsModelToJson(PlantsDetailsModel data) => json.encode(data.toJson());

class PlantsDetailsModel {
  final int id;
  final String commonName;
  final List<String?> scientificName;
  final List<String?> otherName;
  final dynamic family;
  final List<String> origin;
  final String ?type;
  final String ?dimension;
  final Dimensions ?dimensions;
  final String ?cycle;
  final List<dynamic> attracts;
  final List<String?> propagation;
  final String ?watering;
  final dynamic volumeWaterRequirement;
  final dynamic wateringPeriod;
  final WateringGeneralBenchmark wateringGeneralBenchmark;
  final List<dynamic> plantAnatomy;
  final List<String?> sunlight;
  final List<String?> pruningMonth;
  final int ?seeds;
  final dynamic maintenance;
  final String ?careGuides;
  final List<dynamic> soil;
  final String ?growthRate;
  final bool droughtTolerant;
  final bool saltTolerant;
  final bool thorny;
  final bool invasive;
  final bool tropical;
  final bool indoor;
  final String ?careLevel;
  final List<dynamic> pestSusceptibility;
  final String ?pestSusceptibilityApi;
  final bool flowers;
  final dynamic floweringSeason;
  final String ?flowerColor;
  final bool cones;
  final bool fruits;
  final bool edibleFruit;
  final String ?edibleFruitTasteProfile;
  final String ?fruitNutritionalValue;
  final List<dynamic> fruitColor;
  final dynamic harvestSeason;
  final bool leaf;
  final List<String?> leafColor;
  final bool edibleLeaf;
  final bool cuisine;
  final bool medicinal;
  final int ?poisonousToHumans;
  final int ?poisonousToPets;
  final String ?description;
  final DefaultImage ? defaultImage;
  final String ?otherImages;

  PlantsDetailsModel({
    required this.id,
    required this.commonName,
    required this.scientificName,
    required this.otherName,
    required this.family,
    required this.origin,
    required this.type,
    required this.dimension,
    required this.dimensions,
    required this.cycle,
    required this.attracts,
    required this.propagation,
    required this.watering,
    required this.volumeWaterRequirement,
    required this.wateringPeriod,
    required this.wateringGeneralBenchmark,
    required this.plantAnatomy,
    required this.sunlight,
    required this.pruningMonth,
    required this.seeds,
    required this.maintenance,
    required this.careGuides,
    required this.soil,
    required this.growthRate,
    required this.droughtTolerant,
    required this.saltTolerant,
    required this.thorny,
    required this.invasive,
    required this.tropical,
    required this.indoor,
    required this.careLevel,
    required this.pestSusceptibility,
    required this.pestSusceptibilityApi,
    required this.flowers,
    required this.floweringSeason,
    required this.flowerColor,
    required this.cones,
    required this.fruits,
    required this.edibleFruit,
    required this.edibleFruitTasteProfile,
    required this.fruitNutritionalValue,
    required this.fruitColor,
    required this.harvestSeason,
    required this.leaf,
    required this.leafColor,
    required this.edibleLeaf,
    required this.cuisine,
    required this.medicinal,
    required this.poisonousToHumans,
    required this.poisonousToPets,
    required this.description,
    required this.defaultImage,
    required this.otherImages,
  });

  factory PlantsDetailsModel.fromJson(Map<String, dynamic> json) => PlantsDetailsModel(
    id: json["id"],
    commonName: json["common_name"],
    scientificName: List<String>.from(json["scientific_name"].map((x) => x)),
    otherName: List<String>.from(json["other_name"].map((x) => x)),
    family: json["family"],
    origin: List<String>.from(json["origin"].map((x) => x)),
    type: json["type"],
    dimension: json["dimension"],
    dimensions: Dimensions.fromJson(json["dimensions"]),
    cycle: json["cycle"],
    attracts: List<dynamic>.from(json["attracts"].map((x) => x)),
    propagation: List<String>.from(json["propagation"].map((x) => x)),
    watering: json["watering"],
    volumeWaterRequirement: json["volume_water_requirement"],
    wateringPeriod: json["watering_period"],
    wateringGeneralBenchmark: WateringGeneralBenchmark.fromJson(json["watering_general_benchmark"]),
    plantAnatomy: List<dynamic>.from(json["plant_anatomy"].map((x) => x)),
    sunlight: List<String>.from(json["sunlight"].map((x) => x)),
    pruningMonth: List<String>.from(json["pruning_month"].map((x) => x)),
    seeds: json["seeds"],
    maintenance: json["maintenance"],
    careGuides: json["care-guides"],
    soil: List<dynamic>.from(json["soil"].map((x) => x)),
    growthRate: json["growth_rate"],
    droughtTolerant: json["drought_tolerant"],
    saltTolerant: json["salt_tolerant"],
    thorny: json["thorny"],
    invasive: json["invasive"],
    tropical: json["tropical"],
    indoor: json["indoor"],
    careLevel: json["care_level"],
    pestSusceptibility: List<dynamic>.from(json["pest_susceptibility"].map((x) => x)),
    pestSusceptibilityApi: json["pest_susceptibility_api"],
    flowers: json["flowers"],
    floweringSeason: json["flowering_season"],
    flowerColor: json["flower_color"],
    cones: json["cones"],
    fruits: json["fruits"],
    edibleFruit: json["edible_fruit"],
    edibleFruitTasteProfile: json["edible_fruit_taste_profile"],
    fruitNutritionalValue: json["fruit_nutritional_value"],
    fruitColor: List<dynamic>.from(json["fruit_color"].map((x) => x)),
    harvestSeason: json["harvest_season"],
    leaf: json["leaf"],
    leafColor: List<String>.from(json["leaf_color"].map((x) => x)),
    edibleLeaf: json["edible_leaf"],
    cuisine: json["cuisine"],
    medicinal: json["medicinal"],
    poisonousToHumans: json["poisonous_to_humans"],
    poisonousToPets: json["poisonous_to_pets"],
    description: json["description"],
    defaultImage: DefaultImage.fromJson(json["default_image"]),
    otherImages: json["other_images"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "common_name": commonName,
    "scientific_name": List<dynamic>.from(scientificName.map((x) => x)),
    "other_name": List<dynamic>.from(otherName.map((x) => x)),
    "family": family,
    "origin": List<dynamic>.from(origin.map((x) => x)),
    "type": type,
    "dimension": dimension,
    "dimensions": dimensions?.toJson(),
    "cycle": cycle,
    "attracts": List<dynamic>.from(attracts.map((x) => x)),
    "propagation": List<dynamic>.from(propagation.map((x) => x)),
    "watering": watering,
    "volume_water_requirement": List<dynamic>.from(volumeWaterRequirement.map((x) => x)),
    "watering_period": wateringPeriod,
    "watering_general_benchmark": wateringGeneralBenchmark.toJson(),
    "plant_anatomy": List<dynamic>.from(plantAnatomy.map((x) => x)),
    "sunlight": List<dynamic>.from(sunlight.map((x) => x)),
    "pruning_month": List<dynamic>.from(pruningMonth.map((x) => x)),
    "seeds": seeds,
    "maintenance": maintenance,
    "care-guides": careGuides,
    "soil": List<dynamic>.from(soil.map((x) => x)),
    "growth_rate": growthRate,
    "drought_tolerant": droughtTolerant,
    "salt_tolerant": saltTolerant,
    "thorny": thorny,
    "invasive": invasive,
    "tropical": tropical,
    "indoor": indoor,
    "care_level": careLevel,
    "pest_susceptibility": List<dynamic>.from(pestSusceptibility.map((x) => x)),
    "pest_susceptibility_api": pestSusceptibilityApi,
    "flowers": flowers,
    "flowering_season": floweringSeason,
    "flower_color": flowerColor,
    "cones": cones,
    "fruits": fruits,
    "edible_fruit": edibleFruit,
    "edible_fruit_taste_profile": edibleFruitTasteProfile,
    "fruit_nutritional_value": fruitNutritionalValue,
    "fruit_color": List<dynamic>.from(fruitColor.map((x) => x)),
    "harvest_season": harvestSeason,
    "leaf": leaf,
    "leaf_color": List<dynamic>.from(leafColor.map((x) => x)),
    "edible_leaf": edibleLeaf,
    "cuisine": cuisine,
    "medicinal": medicinal,
    "poisonous_to_humans": poisonousToHumans,
    "poisonous_to_pets": poisonousToPets,
    "description": description,
    "default_image": defaultImage?.toJson(),
    "other_images": otherImages,
  };
}

class DefaultImage {
  final int ?license;
  final String ?licenseName;
  final String ?licenseUrl;
  final String ?originalUrl;
  final String ?regularUrl;
  final String ? mediumUrl;
  final String ?smallUrl;
  final String ?thumbnail;

  DefaultImage({
    required this.license,
    required this.licenseName,
    required this.licenseUrl,
    required this.originalUrl,
    required this.regularUrl,
    required this.mediumUrl,
    required this.smallUrl,
    required this.thumbnail,
  });

  factory DefaultImage.fromJson(Map<String, dynamic> ? json) => DefaultImage(
    license: json?["license"],
    licenseName: json?["license_name"],
    licenseUrl: json?["license_url"],
    originalUrl: json?["original_url"],
    regularUrl: json?["regular_url"],
    mediumUrl: json?["medium_url"],
    smallUrl: json?["small_url"],
    thumbnail: json?["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "license": license,
    "license_name": licenseName,
    "license_url": licenseUrl,
    "original_url": originalUrl,
    "regular_url": regularUrl,
    "medium_url": mediumUrl,
    "small_url": smallUrl,
    "thumbnail": thumbnail,
  };
}

class Dimensions {
  final String ?type;
  final int ?minValue;
  final int ?maxValue;
  final String unit;

  Dimensions({
    required this.type,
    required this.minValue,
    required this.maxValue,
    required this.unit,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    type: json["type"],
    minValue: json["min_value"],
    maxValue: json["max_value"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "min_value": minValue,
    "max_value": maxValue,
    "unit": unit,
  };
}

class Hardiness {
  final String ?min;
  final String ?max;

  Hardiness({
    required this.min,
    required this.max,
  });

  factory Hardiness.fromJson(Map<String, dynamic> json) => Hardiness(
    min: json["min"],
    max: json["max"],
  );

  Map<String, dynamic> toJson() => {
    "min": min,
    "max": max,
  };
}

class HardinessLocation {
  final String ?fullUrl;
  final String ?fullIframe;

  HardinessLocation({
    required this.fullUrl,
    required this.fullIframe,
  });

  factory HardinessLocation.fromJson(Map<String, dynamic> json) => HardinessLocation(
    fullUrl: json["full_url"],
    fullIframe: json["full_iframe"],
  );

  Map<String, dynamic> toJson() => {
    "full_url": fullUrl,
    "full_iframe": fullIframe,
  };
}

class WateringGeneralBenchmark {
  final String ?value;
  final String ?unit;

  WateringGeneralBenchmark({
    required this.value,
    required this.unit,
  });

  factory WateringGeneralBenchmark.fromJson(Map<String, dynamic> json) => WateringGeneralBenchmark(
    value: json["value"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "unit": unit,
  };
}
