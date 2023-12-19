import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:restapi_bloc/core/resources/data_state.dart';
import 'package:restapi_bloc/features/daily_news/domain/entities/article.dart';

import '../../../../domain/usecases/get_article.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final getArticleUseCase _getarticleusecase;

  RemoteArticleBloc(this._getarticleusecase)
      : super(const RemoteArticleloading()) {
    on<GetarticlesEvent>(_onGetArticles);
  }

  Future<void> _onGetArticles(
      RemoteArticleEvent event, Emitter<RemoteArticleState> emit) async {
    //call method can be called withouth ttyping it out
    final datastate = await _getarticleusecase();
    if (datastate is DataSuccess && datastate.data!.isNotEmpty) {
      print("worked");
      emit(RemoteArticleDone(datastate.data!));

      if (datastate is DataError) {
        print(datastate.error!.message);
        emit(RemoteArticleError(datastate.error!));
      }
    }
  }
}
