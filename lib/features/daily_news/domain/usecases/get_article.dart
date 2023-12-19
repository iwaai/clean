import 'package:restapi_bloc/core/resources/data_state.dart';
import 'package:restapi_bloc/core/usecase/usecase.dart';
import 'package:restapi_bloc/features/daily_news/domain/entities/article.dart';
import 'package:restapi_bloc/features/daily_news/domain/repositories/article_repository.dart';

class getArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  getArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getArticles();
  }
}
