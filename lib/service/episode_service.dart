import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/episode.dart';

class EpisodeService {
  Future<List<Episode>> fetchEpisodes() async {
    final url = Uri.parse('https://rickandmortyapi.com/api/episode');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return parseEpisodes(response.body);
    } else {
      throw Exception('Failed to load episodes');
    }
  }

  List<Episode> parseEpisodes(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return parsed['results']
        .map<Episode>((json) => Episode.fromJson(json))
        .toList();
  }
}