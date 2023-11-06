class MovieModel {
  MovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }
  num? page;
  List<Results> results = [];
  num? totalPages;
  num? totalResults;
}

class Results {
  Results.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  String? backdropPath;
  num? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage; // Changed from double? to num?
  num? voteCount; // Changed from double? to num?
}
