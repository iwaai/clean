import 'package:restapi_bloc/core/constants/constants.dart';
import 'package:restapi_bloc/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseUrl)
abstract class NewsApiService {
//create factory construtoer that accepts dio
  factory NewsApiService(Dio dio) = _NewsApiService;
  // is method me hum retrofit ko bol rahe h k aik method bana
  // that internally uses dio to make a get network call with the base url
  @GET('/top-headlines')
  Future<HttpResponse<List<articleModel>>> getNewsArticles(
      {@Query("apiKey") String? apiKey,
      @Query("country") String? country,
      @Query("category") String? category});
}
