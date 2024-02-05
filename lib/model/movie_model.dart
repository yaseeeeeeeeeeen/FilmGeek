class Movie {
  final String id;
  final List<String> director;
  final List<String> writers;
  final List<String> stars;
  final int releasedDate;
  final List<String> productionCompany;
  final String title;
  final String language;
  final dynamic runTime;
  final String genre;
  final List<Map<String, dynamic>> voted;
  final String poster;
  final int pageViews;
  final String description;
  final List<String> upVoted;
  final List<String> downVoted;
  final int totalVoted;
  final int voting;

  Movie({
    required this.id,
    required this.director,
    required this.writers,
    required this.stars,
    required this.releasedDate,
    required this.productionCompany,
    required this.title,
    required this.language,
    required this.runTime,
    required this.genre,
    required this.voted,
    required this.poster,
    required this.pageViews,
    required this.description,
    required this.upVoted,
    required this.downVoted,
    required this.totalVoted,
    required this.voting,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['_id'],
      director: List<String>.from(json['director']),
      writers: List<String>.from(json['writers']),
      stars: List<String>.from(json['stars']),
      releasedDate: json['releasedDate'],
      productionCompany: List<String>.from(json['productionCompany']),
      title: json['title'],
      language: json['language'],
      runTime: json['runTime'],
      genre: json['genre'],
      voted: List<Map<String, dynamic>>.from(json['voted']),
      poster: json['poster'],
      pageViews: json['pageViews'],
      description: json['description'],
      upVoted: List<String>.from(json['upVoted'] ?? []),
      downVoted: List<String>.from(json['downVoted'] ?? []),
      totalVoted: json['totalVoted'],
      voting: json['voting'],
    );
  }
}
