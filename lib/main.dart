import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapi_bloc/features/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';

import 'features/injection_container.dart';
import 'features/daily_news/presentation/pages/home/daily_news_page.dart';

void main() async {
  await initilizedependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetarticlesEvent()),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const DailyNewsPage()),
    );
  }
}
