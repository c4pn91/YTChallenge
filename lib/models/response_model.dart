// To parse this JSON data, do
//
//     final youtubeResponse = youtubeResponseFromJson(jsonString);

import 'dart:convert';

YoutubeResponse youtubeResponseFromJson(String str) => YoutubeResponse.fromJson(json.decode(str));

String youtubeResponseToJson(YoutubeResponse data) => json.encode(data.toJson());

class YoutubeResponse {
  YoutubeResponse({
    this.kind,
    this.etag,
    this.items,
    this.nextPageToken,
    this.prevPageToken,
    this.pageInfo,
  });

  String kind;
  String etag;
  List<Item> items;
  String nextPageToken;
  String prevPageToken;
  PageInfo pageInfo;

  factory YoutubeResponse.fromJson(Map<String, dynamic> json) => YoutubeResponse(
    kind: json["kind"],
    etag: json["etag"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    nextPageToken: json["nextPageToken"],
    prevPageToken: json["prevPageToken"],
    pageInfo: PageInfo.fromJson(json["pageInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "nextPageToken": nextPageToken,
    "prevPageToken": prevPageToken,
    "pageInfo": pageInfo.toJson(),
  };
}

class Item {
  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
    this.contentDetails,
    this.statistics,
  });

  Kind kind;
  String etag;
  String id;
  Snippet snippet;
  ContentDetails contentDetails;
  Statistics statistics;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: kindValues.map[json["kind"]],
    etag: json["etag"],
    id: json["id"],
    snippet: Snippet.fromJson(json["snippet"]),
    contentDetails: ContentDetails.fromJson(json["contentDetails"]),
    statistics: Statistics.fromJson(json["statistics"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kindValues.reverse[kind],
    "etag": etag,
    "id": id,
    "snippet": snippet.toJson(),
    "contentDetails": contentDetails.toJson(),
    "statistics": statistics.toJson(),
  };
}

class ContentDetails {
  ContentDetails({
    this.duration,
    this.dimension,
    this.definition,
    this.caption,
    this.licensedContent,
    this.contentRating,
    this.projection,
    this.regionRestriction,
  });

  String duration;
  Dimension dimension;
  Definition definition;
  String caption;
  bool licensedContent;
  ContentRating contentRating;
  Projection projection;
  RegionRestriction regionRestriction;

  factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
    duration: json["duration"],
    dimension: dimensionValues.map[json["dimension"]],
    definition: definitionValues.map[json["definition"]],
    caption: json["caption"],
    licensedContent: json["licensedContent"],
    contentRating: ContentRating.fromJson(json["contentRating"]),
    projection: projectionValues.map[json["projection"]],
    regionRestriction: json["regionRestriction"] == null ? null : RegionRestriction.fromJson(json["regionRestriction"]),
  );

  Map<String, dynamic> toJson() => {
    "duration": duration,
    "dimension": dimensionValues.reverse[dimension],
    "definition": definitionValues.reverse[definition],
    "caption": caption,
    "licensedContent": licensedContent,
    "contentRating": contentRating.toJson(),
    "projection": projectionValues.reverse[projection],
    "regionRestriction": regionRestriction == null ? null : regionRestriction.toJson(),
  };
}

class ContentRating {
  ContentRating();

  factory ContentRating.fromJson(Map<String, dynamic> json) => ContentRating(
  );

  Map<String, dynamic> toJson() => {
  };
}

enum Definition { HD }

final definitionValues = EnumValues({
  "hd": Definition.HD
});

enum Dimension { THE_2_D }

final dimensionValues = EnumValues({
  "2d": Dimension.THE_2_D
});

enum Projection { RECTANGULAR }

final projectionValues = EnumValues({
  "rectangular": Projection.RECTANGULAR
});

class RegionRestriction {
  RegionRestriction({
    this.blocked,
    this.allowed,
  });

  List<String> blocked;
  List<String> allowed;

  factory RegionRestriction.fromJson(Map<String, dynamic> json) => RegionRestriction(
    blocked: json["blocked"] == null ? null : List<String>.from(json["blocked"].map((x) => x)),
    allowed: json["allowed"] == null ? null : List<String>.from(json["allowed"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "blocked": blocked == null ? null : List<dynamic>.from(blocked.map((x) => x)),
    "allowed": allowed == null ? null : List<dynamic>.from(allowed.map((x) => x)),
  };
}

enum Kind { YOUTUBE_VIDEO }

final kindValues = EnumValues({
  "youtube#video": Kind.YOUTUBE_VIDEO
});

class Snippet {
  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.tags,
    this.categoryId,
    this.liveBroadcastContent,
    this.localized,
    this.defaultAudioLanguage,
    this.defaultLanguage,
    this.avatarChannel,
  });

  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  List<String> tags;
  String categoryId;
  LiveBroadcastContent liveBroadcastContent;
  Localized localized;
  String defaultAudioLanguage;
  String defaultLanguage;
  String avatarChannel;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    publishedAt: DateTime.parse(json["publishedAt"]),
    channelId: json["channelId"],
    title: json["title"],
    description: json["description"],
    thumbnails: Thumbnails.fromJson(json["thumbnails"]),
    channelTitle: json["channelTitle"],
    tags: json["tags"] == null ? null : List<String>.from(json["tags"].map((x) => x)),
    categoryId: json["categoryId"],
    liveBroadcastContent: liveBroadcastContentValues.map[json["liveBroadcastContent"]],
    localized: Localized.fromJson(json["localized"]),
    defaultAudioLanguage: json["defaultAudioLanguage"] == null ? null : json["defaultAudioLanguage"],
    defaultLanguage: json["defaultLanguage"] == null ? null : json["defaultLanguage"],
    avatarChannel: ''
  );

  Map<String, dynamic> toJson() => {
    "publishedAt": publishedAt.toIso8601String(),
    "channelId": channelId,
    "title": title,
    "description": description,
    "thumbnails": thumbnails.toJson(),
    "channelTitle": channelTitle,
    "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
    "categoryId": categoryId,
    "liveBroadcastContent": liveBroadcastContentValues.reverse[liveBroadcastContent],
    "localized": localized.toJson(),
    "defaultAudioLanguage": defaultAudioLanguage == null ? null : defaultAudioLanguage,
    "defaultLanguage": defaultLanguage == null ? null : defaultLanguage,
    "avatarChannel": avatarChannel
  };
}

enum LiveBroadcastContent { NONE }

final liveBroadcastContentValues = EnumValues({
  "none": LiveBroadcastContent.NONE
});

class Localized {
  Localized({
    this.title,
    this.description,
  });

  String title;
  String description;

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
  };
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  Default thumbnailsDefault;
  Default medium;
  Default high;
  Default standard;
  Default maxres;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    thumbnailsDefault: Default.fromJson(json["default"]),
    medium: Default.fromJson(json["medium"]),
    high: Default.fromJson(json["high"]),
    standard: Default.fromJson(json["standard"]),
    maxres: json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
  );

  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault.toJson(),
    "medium": medium.toJson(),
    "high": high.toJson(),
    "standard": standard.toJson(),
    "maxres": maxres == null ? null : maxres.toJson(),
  };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String url;
  int width;
  int height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}

class Statistics {
  Statistics({
    this.viewCount,
    this.likeCount,
    this.dislikeCount,
    this.favoriteCount,
    this.commentCount,
  });

  String viewCount;
  String likeCount;
  String dislikeCount;
  String favoriteCount;
  String commentCount;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    viewCount: json["viewCount"],
    likeCount: json["likeCount"],
    dislikeCount: json["dislikeCount"],
    favoriteCount: json["favoriteCount"],
    commentCount: json["commentCount"],
  );

  Map<String, dynamic> toJson() => {
    "viewCount": viewCount,
    "likeCount": likeCount,
    "dislikeCount": dislikeCount,
    "favoriteCount": favoriteCount,
    "commentCount": commentCount,
  };
}

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  int totalResults;
  int resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    totalResults: json["totalResults"],
    resultsPerPage: json["resultsPerPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalResults": totalResults,
    "resultsPerPage": resultsPerPage,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
