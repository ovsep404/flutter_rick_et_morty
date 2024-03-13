class Episode {
  final String episode;
  final String name;
  final String airDate;

  Episode({required this.episode, required this.name, required this.airDate});

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      episode: json['episode'],
      name: json['name'],
      airDate: json['air_date'],
    );
  }
}
