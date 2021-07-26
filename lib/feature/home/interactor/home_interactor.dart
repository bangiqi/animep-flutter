import 'dart:convert';

import 'package:animep_flutter/config/applinks.dart';
import 'package:animep_flutter/models/Anime.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomeInteractor {
  static Future<List<Anime>> fetchAnimeBySeason(
      http.Client client, String filter) async {
    final response = await client.get(Uri.parse(
        '${AppLinks.baseURL}${AppLinks.path}/anime?filter[season]=$filter'));

    return compute(parseAnime, response.body);
  }

  static Future<List<Anime>> fetchAnimeByTrending(http.Client client) async {
    final response = await client
        .get(Uri.parse('${AppLinks.baseURL}${AppLinks.path}/trending/anime'));

    return compute(parseAnime, response.body);
  }

  static Future<List<Anime>> fetchManga(
      http.Client client, String season) async {
    final response = await client
        .get(Uri.parse('${AppLinks.baseURL}${AppLinks.path}/manga'));

    return compute(parseAnime, response.body);
  }

  static List<Anime> parseAnime(String responseBody) {
    final parsed = jsonDecode(responseBody)['data'] as List;

    return parsed.map<Anime>((json) => Anime.fromJson(json)).toList();
  }
}
