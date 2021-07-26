import 'dart:convert';

import 'package:animep_flutter/config/applinks.dart';
import 'package:animep_flutter/models/Anime.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class MangaInteractor {
  static Future<List<Anime>> fetchManga(http.Client client) async {
    final response = await client
        .get(Uri.parse('${AppLinks.baseURL}${AppLinks.path}/manga'));

    return compute(parseManga, response.body);
  }

  static Future<List<Anime>> fetchMangaTrending(http.Client client) async {
    final response = await client
        .get(Uri.parse('${AppLinks.baseURL}${AppLinks.path}/trending/manga'));

    return compute(parseManga, response.body);
  }

  static List<Anime> parseManga(String responseBody) {
    final parsed = jsonDecode(responseBody)['data'] as List;

    return parsed.map<Anime>((json) => Anime.fromJson(json)).toList();
  }
}
