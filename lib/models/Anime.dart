import 'AnimeAttributes.dart';

class Anime {
  final String id;
  final AnimeAttributes attributes;

  Anime({required this.id, required this.attributes});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
        id: json['id'] as String,
        attributes: AnimeAttributes.fromJson(json['attributes']));
  }
}
