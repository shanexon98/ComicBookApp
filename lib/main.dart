import 'package:comic_book_app/blocs/comic_list/comic_list_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'blocs/comic_list/comic_list_bloc.dart';
import 'blocs/comic_detail/comic_detail_bloc.dart';
import 'repositories/comic_repository.dart';
import 'screens/comic_list_screen.dart';

void main() async {
  final ComicRepository comicRepository = ComicRepository();
  await Hive.initFlutter();
  await Hive.openBox('comic_cache');
  runApp(MyApp(comicRepository: comicRepository));
}

class MyApp extends StatelessWidget {
  final ComicRepository comicRepository;

  MyApp({required this.comicRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ComicListBloc(comicRepository: comicRepository)
            ..add(FetchComics()),
        ),
        BlocProvider(
          create: (context) =>
              ComicDetailBloc(comicRepository: comicRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Comic Book App',
        debugShowCheckedModeBanner: false,
        home: ComicListScreen(),
      ),
    );
  }
}
