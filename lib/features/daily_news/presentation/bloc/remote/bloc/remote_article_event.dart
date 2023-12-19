part of 'remote_article_bloc.dart';

abstract class RemoteArticleEvent {
  const RemoteArticleEvent();
}

class GetarticlesEvent extends RemoteArticleEvent {
  const GetarticlesEvent();
}
