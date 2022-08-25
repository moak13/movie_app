class Movie {
  String? title;
  String? rated;
  String? released;
  String? plot;
  String? language;
  String? country;
  String? poster;
  String? imdbRating;
  String? type;

  Movie({
    this.title,
    this.rated,
    this.released,
    this.plot,
    this.language,
    this.country,
    this.poster,
    this.imdbRating,
    this.type,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    rated = json['Rated'];
    released = json['Released'];
    plot = json['Plot'];
    language = json['Language'];
    country = json['Country'];
    poster = json['Poster'];
    imdbRating = json['imdbRating'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Rated'] = rated;
    data['Released'] = released;
    data['Plot'] = plot;
    data['Language'] = language;
    data['Country'] = country;
    data['Poster'] = poster;
    data['imdbRating'] = imdbRating;
    data['Type'] = type;
    return data;
  }
}
