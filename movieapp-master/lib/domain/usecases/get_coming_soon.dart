//usecases are features that app works on
//they seperate repos from UI
//they integrate with blocs
//they just pass input params to bloc
//bloc decides which repo to call
//data + logic separated from the UI

//There is supposed to be one usecase per feature

import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entitites/app_error.dart';
import 'package:movieapp/domain/entitites/movie_entity.dart';
import 'package:movieapp/domain/entitites/no_params.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

class GetComingSoon extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetComingSoon(this.repository);

  //So here we input a repository and it fetches out movie list unlike earlier movie repo itself was fetching movie list
  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getComingSoon();
  }
}
