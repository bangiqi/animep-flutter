import 'AnimePosterImage.dart';

class AnimeAttributes {
  final String canonicalTitle;
  final String description;
  final AnimePosterImage posterImage;

  AnimeAttributes(
      {required this.canonicalTitle,
      required this.description,
      required this.posterImage});

  factory AnimeAttributes.fromJson(Map<String, dynamic> json) {
    return AnimeAttributes(
        canonicalTitle: json['canonicalTitle'] as String,
        posterImage: AnimePosterImage.fromJson(json['posterImage']),
        description: json['description'] as String);
  }

  String getDescription() {
    return (this.description.isNotEmpty)
        ? this.description
        : 'No description here.';
  }
}
