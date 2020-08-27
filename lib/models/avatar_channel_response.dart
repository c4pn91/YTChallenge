// To parse this JSON data, do
//
//     final avatarChannelResponse = avatarChannelResponseFromJson(jsonString);

import 'dart:convert';

AvatarChannelResponse avatarChannelResponseFromJson(String str) => AvatarChannelResponse.fromJson(json.decode(str));

String avatarChannelResponseToJson(AvatarChannelResponse data) => json.encode(data.toJson());

class AvatarChannelResponse {
  AvatarChannelResponse({
    this.items,
  });

  List<Tem> items;

  factory AvatarChannelResponse.fromJson(Map<String, dynamic> json) => AvatarChannelResponse(
    items: List<Tem>.from(json["items"].map((x) => Tem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Tem {
  Tem({
    this.snippet,
  });

  Snippet snippet;

  factory Tem.fromJson(Map<String, dynamic> json) => Tem(
    snippet: Snippet.fromJson(json["snippet"]),
  );

  Map<String, dynamic> toJson() => {
    "snippet": snippet.toJson(),
  };
}

class Snippet {
  Snippet({
    this.thumbnails,
  });

  Thumbnails thumbnails;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    thumbnails: Thumbnails.fromJson(json["thumbnails"]),
  );

  Map<String, dynamic> toJson() => {
    "thumbnails": thumbnails.toJson(),
  };
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
  });

  Default thumbnailsDefault;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    thumbnailsDefault: Default.fromJson(json["default"]),
  );

  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault.toJson(),
  };
}

class Default {
  Default({
    this.url,
  });

  String url;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}
