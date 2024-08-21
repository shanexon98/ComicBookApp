class ComicCreatorsModel {
  ComicCreatorsModel({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.results,
    required this.version,
  });

  final String? error;
  final int? limit;
  final int? offset;
  final int? numberOfPageResults;
  final int? numberOfTotalResults;
  final int? statusCode;
  final Results? results;
  final String? version;

  factory ComicCreatorsModel.fromJson(Map<String, dynamic> json) {
    return ComicCreatorsModel(
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
    required this.birth,
    required this.countOfIsssueAppearances,
    required this.country,
    required this.createdCharacters,
    required this.dateAdded,
    required this.dateLastUpdated,
    required this.death,
    required this.deck,
    required this.description,
    required this.email,
    required this.gender,
    required this.hometown,
    required this.id,
    required this.image,
    required this.issues,
    required this.name,
    required this.siteDetailUrl,
    required this.storyArcCredits,
    required this.volumeCredits,
    required this.website,
  });

  final dynamic aliases;
  final String? apiDetailUrl;
  final DateTime? birth;
  final dynamic countOfIsssueAppearances;
  final String? country;
  final List<CreatedCharacter> createdCharacters;
  final DateTime? dateAdded;
  final DateTime? dateLastUpdated;
  final Death? death;
  final String? deck;
  final String? description;
  final dynamic email;
  final int? gender;
  final String? hometown;
  final int? id;
  final Image? image;
  final List<CreatedCharacter> issues;
  final String? name;
  final String? siteDetailUrl;
  final List<CreatedCharacter> storyArcCredits;
  final List<CreatedCharacter> volumeCredits;
  final String? website;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      aliases: json["aliases"],
      apiDetailUrl: json["api_detail_url"],
      birth: DateTime.tryParse(json["birth"] ?? ""),
      countOfIsssueAppearances: json["count_of_isssue_appearances"],
      country: json["country"],
      createdCharacters: json["created_characters"] == null
          ? []
          : List<CreatedCharacter>.from(json["created_characters"]!
              .map((x) => CreatedCharacter.fromJson(x))),
      dateAdded: DateTime.tryParse(json["date_added"] ?? ""),
      dateLastUpdated: DateTime.tryParse(json["date_last_updated"] ?? ""),
      death: json["death"] == null ? null : Death.fromJson(json["death"]),
      deck: json["deck"],
      description: json["description"],
      email: json["email"],
      gender: json["gender"],
      hometown: json["hometown"],
      id: json["id"],
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      issues: json["issues"] == null
          ? []
          : List<CreatedCharacter>.from(
              json["issues"]!.map((x) => CreatedCharacter.fromJson(x))),
      name: json["name"],
      siteDetailUrl: json["site_detail_url"],
      storyArcCredits: json["story_arc_credits"] == null
          ? []
          : List<CreatedCharacter>.from(json["story_arc_credits"]!
              .map((x) => CreatedCharacter.fromJson(x))),
      volumeCredits: json["volume_credits"] == null
          ? []
          : List<CreatedCharacter>.from(
              json["volume_credits"]!.map((x) => CreatedCharacter.fromJson(x))),
      website: json["website"],
    );
  }

  Map<String, dynamic> toJson() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "birth": birth?.toIso8601String(),
        "count_of_isssue_appearances": countOfIsssueAppearances,
        "country": country,
        "created_characters":
            createdCharacters.map((x) => x?.toJson()).toList(),
        "date_added": dateAdded?.toIso8601String(),
        "date_last_updated": dateLastUpdated?.toIso8601String(),
        "death": death?.toJson(),
        "deck": deck,
        "description": description,
        "email": email,
        "gender": gender,
        "hometown": hometown,
        "id": id,
        "image": image?.toJson(),
        "issues": issues.map((x) => x?.toJson()).toList(),
        "name": name,
        "site_detail_url": siteDetailUrl,
        "story_arc_credits": storyArcCredits.map((x) => x?.toJson()).toList(),
        "volume_credits": volumeCredits.map((x) => x?.toJson()).toList(),
        "website": website,
      };
}

class CreatedCharacter {
  CreatedCharacter({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
  });

  final String? apiDetailUrl;
  final int? id;
  final String? name;
  final String? siteDetailUrl;

  factory CreatedCharacter.fromJson(Map<String, dynamic> json) {
    return CreatedCharacter(
      apiDetailUrl: json["api_detail_url"],
      id: json["id"],
      name: json["name"],
      siteDetailUrl: json["site_detail_url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl,
      };
}

class Death {
  Death({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  final DateTime? date;
  final int? timezoneType;
  final String? timezone;

  factory Death.fromJson(Map<String, dynamic> json) {
    return Death(
      date: DateTime.tryParse(json["date"] ?? ""),
      timezoneType: json["timezone_type"],
      timezone: json["timezone"],
    );
  }

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
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
