import 'dart:io';

import 'package:dio/dio.dart';
import 'package:restapi_bloc/core/constants/constants.dart';
import 'package:restapi_bloc/features/daily_news/data/models/article.dart';
import 'package:restapi_bloc/core/resources/data_state.dart';
import '../../domain/repositories/article_repository.dart';
import '../data_sources/remote/news_api_service.dart';

class articleRepository implements ArticleRepository {
  final NewsApiService _newsApiService;
  articleRepository(this._newsApiService);
  @override
  Future<DataState<List<articleModel>>> getArticles() async {
    final httpresponse = await _newsApiService.getNewsArticles(
      apiKey: newAPIKey,
      country: newsAPICountry,
      category: newsAPICategory,
    );
    if (httpresponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpresponse.data);
    } else {
      return DataError(
        DioError(
          error: httpresponse.response..statusMessage,
          response: httpresponse.response,
          type: DioErrorType.response,
          requestOptions: httpresponse.response.requestOptions,
        ),
      );
    }
  }
}
