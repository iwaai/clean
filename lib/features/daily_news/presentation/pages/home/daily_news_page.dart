import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapi_bloc/features/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';
import '../../widgets/NewsWidget.dart';

class DailyNewsPage extends StatelessWidget {
  const DailyNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News'),
      ),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
          if (state is RemoteArticleloading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is RemoteArticleError) {
            return Center(child: Text(state.error!.message));
          }
          if (state is RemoteArticleDone) {
            print(state.articles!.length);
            print(state.articles![1]);
            return ListView.builder(
                itemCount: state.articles!.length,
                itemBuilder: (_, index) => NewsWidget(
                      article: state.articles![index],
                    ));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
