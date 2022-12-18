import "dart:convert";

List<ToiletReview> reviewFromJson(String str) => List<ToiletReview>.from(
    json.decode(str).map((x) => ToiletReview.fromJson(x)));

String reviewToJson(List<ToiletReview> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToiletReview {
  final String id;
  final String toiletId;
  final String text;
  final String rating;

  const ToiletReview({
    required this.id,
    required this.toiletId,
    required this.text,
    required this.rating,
  });

  factory ToiletReview.fromJson(Map<String, dynamic> json) {
    return ToiletReview(
      id: json['_id'],
      toiletId: json['toiletId'],
      text: json['text'],
      rating: json['rating'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "toiletId": toiletId,
        "text": text,
        "rating": rating,
      };
}
