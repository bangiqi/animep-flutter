import 'AnimePosterImage.dart';

class AnimeAttributes {
  final String canonicalTitle;
  final AnimePosterImage posterImage;

  AnimeAttributes({required this.canonicalTitle, required this.posterImage});

  factory AnimeAttributes.fromJson(Map<String, dynamic> json) {
    return AnimeAttributes(
        canonicalTitle: json['canonicalTitle'] as String,
        posterImage: AnimePosterImage.fromJson(json['posterImage']));
  }
}
