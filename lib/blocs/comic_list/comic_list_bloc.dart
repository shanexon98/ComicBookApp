import 'package:flutter_bloc/flutter_bloc.dart';
import 'comic_list_event.dart';
import 'comic_list_state.dart';
import '../../repositories/comic_repository.dart';

class ComicListBloc extends Bloc<ComicListEvent, ComicListState> {
  final ComicRepository comicRepository;

  ComicListBloc({required this.comicRepository}) : super(ComicListLoading()) {
    on<FetchComics>((event, emit) async {
      try {
        final comics = await comicRepository.fetchComics();
        emit(ComicListLoaded(comics: comics.results));
      } catch (_) {
        emit(ComicListError());
      }
    });
  }
}
