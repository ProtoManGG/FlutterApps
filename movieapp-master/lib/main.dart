import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

import './di/get_it.dart' as getIt;
import 'domain/entitites/app_error.dart';
import 'domain/entitites/movie_entity.dart';
import 'domain/entitites/no_params.dart';
import 'domain/usecases/get_trending.dart';

Future<void> main() async {
  //by using unawaited in pedantic we make sure our code doesnt has to wait for the future to complete
  unawaited(getIt.init());

  //Now we directly pass this instance to trending function and we donot have to care for making instance of each dependency

  // ApiClient apiClient = ApiClient(Client());
  // MovieRemoteDataSourceImpl dataSource = MovieRemoteDataSourceImpl(apiClient);
  // dataSource.getTrending();
  // dataSource.getPopular();
  // dataSource.getPlayingNow();
  // dataSource.getComingSoon();

  //Now instead of using datasorce from data layer,
  //we use movie repository which is in domain layer
  //....that is further separation.

  //Although now we separated data layer from the UI
  //we have added repository i.e domain layer "in" UI
  //UI will have to decide which remote source(repo) to call
  //which should not be the case...introducing "USECASES"
  // MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  // movieRepository.getTrending();

  //Now we send the repo to usecases,
  //it handles the duty of
  //which remote data source to call
  //in order to fetch this movie list
  GetTrending getTrending = getIt.getItInstance<GetTrending>();
  // One issue is still there
  //although the data is manged seperately
  //but returned data could be list of movies or...
  //null in case of error
  //UI would have to check which is it either oif the case

  //Introducing DARTZ to help us with better error msgs as well
  //Either l or r
  // runApp(MyApp());
  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending(NoParams());

  eitherResponse.fold((l) {
    print('error');
    print(l);
  }, (r) {
    print('list of movies');
    print(r);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Center(child: Text("Coming Soon")),
    );
  }
}
