import 'AnimePosterImage.dart';

class AnimeAttributes {
  final String canonicalTitle;
  final String description;
  final String? averageRating;
  final AnimePosterImage posterImage;

  AnimeAttributes({
    required this.canonicalTitle,
    required this.description,
    required this.averageRating,
    required this.posterImage,
  });

  factory AnimeAttributes.fromJson(Map<String, dynamic> json) {
    return AnimeAttributes(
        canonicalTitle: json['canonicalTitle'] as String,
        posterImage: AnimePosterImage.fromJson(json['posterImage']),
        description: json['description'] as String,
        averageRating: '${json['averageRating'] ?? "n/a"}');
  }

  String getDescription() {
    return (this.description.isNotEmpty)
        ? this.description
        : 'No description here.';
  }

  String? getAverageRating() {
    return this.averageRating;
  }
}
