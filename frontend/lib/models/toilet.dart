import "dart:convert";

List<Toilet> toiletFromJson(String str) =>
    List<Toilet>.from(json.decode(str).map((x) => Toilet.fromJson(x)));

String toiletToJson(List<Toilet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Toilet {
  final String id;
  final String title;
  final double latitude;
  final double longitude;
  final bool babyroom;
  final bool disabled;
  final String gender;
  final double rating;
  final int floor;

  const Toilet({
    required this.id,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.babyroom,
    required this.disabled,
    required this.gender,
    required this.rating,
    required this.floor,
  });

  factory Toilet.fromJson(Map<String, dynamic> json) {
    return Toilet(
      id: json["_id"],
      title: json['title'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      babyroom: json['babyroom'],
      disabled: json['disabled'],
      gender: json['gender'],
      rating: json['rating'],
      floor: json['floor'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "latitude": latitude,
        "longitude": longitude,
        "babyroom": babyroom,
        "disabled": disabled,
        "gender": gender,
        "rating": rating,
        "floor": floor,
      };
}
