// To parse this JSON data, do
//
//     final newmodel = newmodelFromJson(jsonString);

import 'dart:convert';

List<Newmodel> newmodelFromJson(String str) => List<Newmodel>.from(json.decode(str).map((x) => Newmodel.fromJson(x)));

String newmodelToJson(List<Newmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Newmodel {
    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    Newmodel({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    factory Newmodel.fromJson(Map<String, dynamic> json) => Newmodel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
