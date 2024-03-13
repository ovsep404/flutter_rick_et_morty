import 'package:cours_flutter_rick_et_morty/model/character.dart';
import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;

  const CharacterDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile - ${character.name}'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.network(character.image),
              Text('Name: ${character.name}'),
              Text('Species: ${character.species}'),
              Text('origin: ${character.origin}'),
              Text('Status: ${character.status}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Retour'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

