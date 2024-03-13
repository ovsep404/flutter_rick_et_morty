import 'package:cours_flutter_rick_et_morty/model/character.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class CharactersService {
  Future<List<Character>> fetchCharacters() async {
    final url = Uri.parse('https://rickandmortyapi.com/api/character');
    final response = await http.get(url);
    // Si l'on a un HTTP 200, on parse la réponse de notre webservice
    if (response.statusCode == 200) {
      return parseCharacters(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  List<Character> parseCharacters(String responseBody) {
    // Parse the responseBody into a Map, not a List
    final Map<String, dynamic> data = jsonDecode(responseBody);

    // Access the 'results' key in the Map to get the List of characters
    final List<dynamic> characters = data['results'];

    // Map each character to a Character object and return the list
    return characters
        .map<Character>((json) => Character.fromJson(json))
        .toList();
  }
}

