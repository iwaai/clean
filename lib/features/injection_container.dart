import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:restapi_bloc/features/daily_news/data/data_sources/remote/news_api_service.dart';

import 'package:restapi_bloc/features/daily_news/domain/usecases/get_article.dart';
import 'package:restapi_bloc/features/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';

import 'daily_news/data/repository/article_repository.dart';
import 'daily_news/domain/repositories/article_repository.dart';

//2 ways
//facotry and singleton
// if factory when ever we request an instance we get a new one
// if singleton when ever we requeste an instance we a same instance

final sl = GetIt.instance;

Future<void> initilizedependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(articleRepository(sl()));

  sl.registerSingleton<getArticleUseCase>(getArticleUseCase(sl()));

  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
