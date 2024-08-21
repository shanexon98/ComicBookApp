import 'package:hive/hive.dart';

class ComicDetailModel {
  ComicDetailModel({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.results,
    required this.version,
  });
  @HiveField(0)
  final String? error;
  @HiveField(1)
  final int? limit;
  @HiveField(2)
  final int? offset;
  @HiveField(3)
  final int? numberOfPageResults;
  @HiveField(4)
  final int? numberOfTotalResults;
  @HiveField(5)
  final int? statusCode;
  @HiveField(6)
  final Results? results;
  @HiveField(7)
  final String? version;

  factory ComicDetailModel.fromJson(Map<String, dynamic> json) {
    return ComicDetailModel(
      error: json["error"],
      limit: json["limit"],
      offset: json["offset"],
      numberOfPageResults: json["number_of_page_results"],
      numberOfTotalResults: json["number_of_total_results"],
      statusCode: json["status_code"],
      results:
          json["results"] == null ? null : Results.fromJson(json["results"]),
      version: json["version"],
    );
  }

  Map<String, dynamic> toJson() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": results?.toJson(),
        "version": version,
      };
}

class Results {
  Results({
    required this.aliases,
    required this.apiDetailUrl,
    required this.associatedImages,
    required this.characterCredits,
    required this.characterDiedIn,
    required this.conceptCredits,
    required this.coverDate,
    required this.dateAdded,
    required this.dateLastUpdated,
    required this.deck,
    required this.description,
    required this.firstAppearanceCharacters,
    required this.firstAppearanceConcepts,
    required this.firstAppearanceLocations,
    required this.firstAppearanceObjects,
    required this.firstAppearanceStoryarcs,
    required this.firstAppearanceTeams,
    required this.hasStaffReview,
    required this.id,
    required this.image,
    required this.issueNumber,
    required this.locationCredits,
    required this.name,
    required this.objectCredits,
    required this.personCredits,
    required this.siteDetailUrl,
    required this.storeDate,
    required this.storyArcCredits,
    required this.teamCredits,
    required this.teamDisbandedIn,
    required this.volume,
  });

  final dynamic aliases;
  final String? apiDetailUrl;
  final List<AssociatedImage> associatedImages;
  final List<Volume> characterCredits;
  final List<dynamic> characterDiedIn;
  final List<Volume> conceptCredits;
  final DateTime? coverDate;
  final DateTime? dateAdded;
  final DateTime? dateLastUpdated;
  final dynamic deck;
  final String? description;
  final dynamic firstAppearanceCharacters;
  final dynamic firstAppearanceConcepts;
  final dynamic firstAppearanceLocations;
  final dynamic firstAppearanceObjects;
  final dynamic firstAppearanceStoryarcs;
  final dynamic firstAppearanceTeams;
  final bool? hasStaffReview;
  final int? id;
  final Image? image;
  final String? issueNumber;
  final List<Volume> locationCredits;
  final String? name;
  final List<dynamic> objectCredits;
  final List<Volume> personCredits;
  final String? siteDetailUrl;
  final dynamic storeDate;
  final List<dynamic> storyArcCredits;
  final List<dynamic> teamCredits;
  final List<dynamic> teamDisbandedIn;
  final Volume? volume;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      aliases: json["aliases"],
      apiDetailUrl: json["api_detail_url"],
      associatedImages: json["associated_images"] == null
          ? []
          : List<AssociatedImage>.from(json["associated_images"]!
              .map((x) => AssociatedImage.fromJson(x))),
      characterCredits: json["character_credits"] == null
          ? []
          : List<Volume>.from(
              json["character_credits"]!.map((x) => Volume.fromJson(x))),
      characterDiedIn: json["character_died_in"] == null
          ? []
          : List<dynamic>.from(json["character_died_in"]!.map((x) => x)),
      conceptCredits: json["concept_credits"] == null
          ? []
          : List<Volume>.from(
              json["concept_credits"]!.map((x) => Volume.fromJson(x))),
      coverDate: DateTime.tryParse(json["cover_date"] ?? ""),
      dateAdded: DateTime.tryParse(json["date_added"] ?? ""),
      dateLastUpdated: DateTime.tryParse(json["date_last_updated"] ?? ""),
      deck: json["deck"],
      description: json["description"],
      firstAppearanceCharacters: json["first_appearance_characters"],
      firstAppearanceConcepts: json["first_appearance_concepts"],
      firstAppearanceLocations: json["first_appearance_locations"],
      firstAppearanceObjects: json["first_appearance_objects"],
      firstAppearanceStoryarcs: json["first_appearance_storyarcs"],
      firstAppearanceTeams: json["first_appearance_teams"],
      hasStaffReview: json["has_staff_review"],
      id: json["id"],
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      issueNumber: json["issue_number"],
      locationCredits: json["location_credits"] == null
          ? []
          : List<Volume>.from(
              json["location_credits"]!.map((x) => Volume.fromJson(x))),
      name: json["name"],
      objectCredits: json["object_credits"] == null
          ? []
          : List<dynamic>.from(json["object_credits"]!.map((x) => x)),
      personCredits: json["person_credits"] == null
          ? []
          : List<Volume>.from(
              json["person_credits"]!.map((x) => Volume.fromJson(x))),
      siteDetailUrl: json["site_detail_url"],
      storeDate: json["store_date"],
      storyArcCredits: json["story_arc_credits"] == null
          ? []
          : List<dynamic>.from(json["story_arc_credits"]!.map((x) => x)),
      teamCredits: json["team_credits"] == null
          ? []
          : List<dynamic>.from(json["team_credits"]!.map((x) => x)),
      teamDisbandedIn: json["team_disbanded_in"] == null
          ? []
          : List<dynamic>.from(json["team_disbanded_in"]!.map((x) => x)),
      volume: json["volume"] == null ? null : Volume.fromJson(json["volume"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "associated_images": associatedImages.map((x) => x?.toJson()).toList(),
        "character_credits": characterCredits.map((x) => x?.toJson()).toList(),
        "character_died_in": characterDiedIn.map((x) => x).toList(),
        "concept_credits": conceptCredits.map((x) => x?.toJson()).toList(),
        "cover_date":
            "${coverDate!.year.toString().padLeft(4, '0')}-${coverDate?.month.toString().padLeft(2, '0')}-${coverDate?.day.toString().padLeft(2, '0')}",
        "date_added": dateAdded?.toIso8601String(),
        "date_last_updated": dateLastUpdated?.toIso8601String(),
        "deck": deck,
        "description": description,
        "first_appearance_characters": firstAppearanceCharacters,
        "first_appearance_concepts": firstAppearanceConcepts,
        "first_appearance_locations": firstAppearanceLocations,
        "first_appearance_objects": firstAppearanceObjects,
        "first_appearance_storyarcs": firstAppearanceStoryarcs,
        "first_appearance_teams": firstAppearanceTeams,
        "has_staff_review": hasStaffReview,
        "id": id,
        "image": image?.toJson(),
        "issue_number": issueNumber,
        "location_credits": locationCredits.map((x) => x?.toJson()).toList(),
        "name": name,
        "object_credits": objectCredits.map((x) => x).toList(),
        "person_credits": personCredits.map((x) => x?.toJson()).toList(),
        "site_detail_url": siteDetailUrl,
        "store_date": storeDate,
        "story_arc_credits": storyArcCredits.map((x) => x).toList(),
        "team_credits": teamCredits.map((x) => x).toList(),
        "team_disbanded_in": teamDisbandedIn.map((x) => x).toList(),
        "volume": volume?.toJson(),
      };
}

class AssociatedImage {
  AssociatedImage({
    required this.originalUrl,
    required this.id,
    required this.caption,
    required this.imageTags,
  });

  final String? originalUrl;
  final int? id;
  final dynamic caption;
  final String? imageTags;

  factory AssociatedImage.fromJson(Map<String, dynamic> json) {
    return AssociatedImage(
      originalUrl: json["original_url"],
      id: json["id"],
      caption: json["caption"],
      imageTags: json["image_tags"],
    );
  }

  Map<String, dynamic> toJson() => {
        "original_url": originalUrl,
        "id": id,
        "caption": caption,
        "image_tags": imageTags,
      };
}

class Volume {
  Volume({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
    required this.role,
  });

  final String? apiDetailUrl;
  final int? id;
  final String? name;
  final String? siteDetailUrl;
  final String? role;

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      apiDetailUrl: json["api_detail_url"],
      id: json["id"],
      name: json["name"],
      siteDetailUrl: json["site_detail_url"],
      role: json["role"],
    );
  }

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl,
        "role": role,
      };
}

class Image {
  Image({
    required this.iconUrl,
    required this.mediumUrl,
    required this.screenUrl,
    required this.screenLargeUrl,
    required this.smallUrl,
    required this.superUrl,
    required this.thumbUrl,
    required this.tinyUrl,
    required this.originalUrl,
    required this.imageTags,
  });

  final String? iconUrl;
  final String? mediumUrl;
  final String? screenUrl;
  final String? screenLargeUrl;
  final String? smallUrl;
  final String? superUrl;
  final String? thumbUrl;
  final String? tinyUrl;
  final String? originalUrl;
  final String? imageTags;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      iconUrl: json["icon_url"],
      mediumUrl: json["medium_url"],
      screenUrl: json["screen_url"],
      screenLargeUrl: json["screen_large_url"],
      smallUrl: json["small_url"],
      superUrl: json["super_url"],
      thumbUrl: json["thumb_url"],
      tinyUrl: json["tiny_url"],
      originalUrl: json["original_url"],
      imageTags: json["image_tags"],
    );
  }

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
        "image_tags": imageTags,
      };
}
