import 'package:cours_flutter_rick_et_morty/screens/bottom_navigation_bar.dart';
import 'package:cours_flutter_rick_et_morty/service/episode_service.dart';
import 'package:cours_flutter_rick_et_morty/model/episode.dart';
import 'package:flutter/material.dart';

class Episodes extends StatelessWidget {
  const Episodes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Episodes'),
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false),
      body: FutureBuilder<List<Episode>>(
        future: EpisodeService().fetchEpisodes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      '${snapshot.data![index].episode} - ${snapshot.data![index].name}'),
                  subtitle: Text(snapshot.data![index].airDate),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 1),
    );
  }
}
