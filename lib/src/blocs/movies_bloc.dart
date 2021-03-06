import 'dart:async';
import '../resources/movie_repository.dart';
import '../models/movie.dart';
import 'i_movies_bloc.dart';

class MoviesBloc extends IMoviesBloc {
  StreamController<Movie> _streamMoviesController =
      StreamController<Movie>.broadcast();
  MovieRepository _movieRepository = MovieRepository();

  MoviesBloc([MovieRepository? repository])
      : _movieRepository = repository ?? MovieRepository();

  @override
  void dispose() {
    _streamMoviesController.close();
  }

  @override
  Future<void> initialize() async {}

  @override
  void fetchAllMovies() async {
    final _allMovies = await _movieRepository.fetchAllMovies();
    _streamMoviesController.sink.add(
      _allMovies,
    );
  }

  @override
  Stream<Movie> get streamMovies => _streamMoviesController.stream;

  @override
  void fetchMoviesByFilter(
    String query,
  ) async {
    if (query.isEmpty) {
      fetchAllMovies();
    } else {
      _streamMoviesController.sink.add(
        await _movieRepository.fetchMoviesByFilter(
          query,
        ),
      );
    }
  }
}
