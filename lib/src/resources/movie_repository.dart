import 'dart:async';
import 'i_movie_repository.dart';
import 'movie_api_provider.dart';
import '../models/movie.dart';

class MovieRepository extends IMovieRepository {
  final moviesApiProvider = MovieApiProvider();

  @override
  Future<Movie> fetchAllMovies() => moviesApiProvider.fetchAllMovies();

  @override
  Future<Movie> fetchMoviesByFilter(String query) =>
      moviesApiProvider.fetchMoviesByFilter(
        query,
      );
}
