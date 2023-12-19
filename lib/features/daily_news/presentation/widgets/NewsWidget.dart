import 'package:flutter/material.dart';
import 'package:restapi_bloc/features/daily_news/data/models/article.dart';
import 'package:restapi_bloc/features/daily_news/domain/entities/article.dart';

class NewsWidget extends StatelessWidget {
  final ArticleEntity? article;
  const NewsWidget({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(article!.title!),
        subtitle: Text(article!.description!),
        leading: Image.network(article!.urlToImage!));
  }
}
