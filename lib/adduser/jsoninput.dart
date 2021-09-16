import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
    Album({
        required this.id,
        required this.name,
        required this.subname,
    });

    String id;
    String name;
    String subname;

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"],
        name: json["name"],
        subname: json["subname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "subname": subname,
    };
}
