class ComicModel {
  ComicModel({
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
  final List<Result> results;
  final String? version;

  factory ComicModel.fromJson(Map<String, dynamic> json) {
    return ComicModel(
      error: json["error"],
      limit: json["limit"],
      offset: json["offset"],
      numberOfPageResults: json["number_of_page_results"],
      numberOfTotalResults: json["number_of_total_results"],
      statusCode: json["status_code"],
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
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
        "results": results.map((x) => x?.toJson()).toList(),
        "version": version,
      };
}

class Result {
  Result({
    required this.aliases,
    required this.apiDetailUrl,
    required this.coverDate,
    required this.dateAdded,
    required this.dateLastUpdated,
    required this.deck,
    required this.description,
    required this.hasStaffReview,
    required this.id,
    required this.image,
    required this.associatedImages,
    required this.issueNumber,
    required this.name,
    required this.siteDetailUrl,
    required this.storeDate,
    required this.volume,
  });

  final dynamic aliases;
  final String? apiDetailUrl;
  final DateTime? coverDate;
  final DateTime? dateAdded;
  final DateTime? dateLastUpdated;
  final dynamic deck;
  final String? description;
  final bool? hasStaffReview;
  final int? id;
  final Image? image;
  final List<AssociatedImage> associatedImages;
  final String? issueNumber;
  final String? name;
  final String? siteDetailUrl;
  final DateTime? storeDate;
  final Volume? volume;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      aliases: json["aliases"],
      apiDetailUrl: json["api_detail_url"],
      coverDate: DateTime.tryParse(json["cover_date"] ?? ""),
      dateAdded: DateTime.tryParse(json["date_added"] ?? ""),
      dateLastUpdated: DateTime.tryParse(json["date_last_updated"] ?? ""),
      deck: json["deck"],
      description: json["description"],
      hasStaffReview: json["has_staff_review"],
      id: json["id"],
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      associatedImages: json["associated_images"] == null
          ? []
          : List<AssociatedImage>.from(json["associated_images"]!
              .map((x) => AssociatedImage.fromJson(x))),
      issueNumber: json["issue_number"],
      name: json["name"],
      siteDetailUrl: json["site_detail_url"],
      storeDate: DateTime.tryParse(json["store_date"] ?? ""),
      volume: json["volume"] == null ? null : Volume.fromJson(json["volume"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "cover_date":
            "${coverDate?.year.toString().padLeft(4, '0')}-${coverDate?.month.toString().padLeft(2, '0')}-${coverDate?.day.toString().padLeft(2, '0')}",
        "date_added": dateAdded?.toIso8601String(),
        "date_last_updated": dateLastUpdated?.toIso8601String(),
        "deck": deck,
        "description": description,
        "has_staff_review": hasStaffReview,
        "id": id,
        "image": image?.toJson(),
        "associated_images": associatedImages.map((x) => x?.toJson()).toList(),
        "issue_number": issueNumber,
        "name": name,
        "site_detail_url": siteDetailUrl,
        "store_date":
            "${storeDate?.year.toString().padLeft(4, '0')}-${coverDate?.month.toString().padLeft(2, '0')}-${coverDate?.day.toString().padLeft(2, '0')}",
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

class Volume {
  Volume({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
  });

  final String? apiDetailUrl;
  final int? id;
  final String? name;
  final String? siteDetailUrl;

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
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
