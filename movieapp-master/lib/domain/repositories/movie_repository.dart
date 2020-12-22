//Here we make decision whether data
//is to be fetched from remote or local
//data source.

import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entitites/app_error.dart';
import 'package:movieapp/domain/entitites/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, List<MovieEntity>>> getComingSoon();
}
