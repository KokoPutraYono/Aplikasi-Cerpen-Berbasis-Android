import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.judul,
    required this.image,
    required this.tokohUtama,
    required this.gendre,
    required this.isi,
    required this.date,
  });

  String id;
  String judul;
  String image;
  String tokohUtama;
  String gendre;
  String isi;
  String date;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        judul: json["judul"],
        image: json["image"],
        tokohUtama: json["tokohUtama"],
        gendre: json["gendre"],
        isi: json["isi"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "image": image,
        "tokohUtama": tokohUtama,
        "gendre": gendre,
        "isi": isi,
        "date": date,
      };
}
