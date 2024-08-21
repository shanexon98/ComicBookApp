import 'package:comic_book_app/blocs/comic_creators/comic_creator.state.dart';
import 'package:comic_book_app/blocs/comic_creators/comic_creator_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'comic_detail_event.dart';
import 'comic_detail_state.dart';
import '../../repositories/comic_repository.dart';

class ComicDetailBloc extends Bloc<ComicDetailEvent, ComicDetailState> {
  final ComicRepository comicRepository;

  ComicDetailBloc({required this.comicRepository})
      : super(ComicDetailLoading()) {
    on<FetchComicDetail>((event, emit) async {
      try {
        final comicDetail =
            await comicRepository.fetchComicDetail(event.comicId);
        emit(ComicDetailLoaded(comicDetail: comicDetail.results!));
      } catch (_) {
        emit(ComicDetailError());
      }
    });

    on<FetchPersonDetail>((event, emit) async {
      try {
        final personDetail =
            await comicRepository.fetchPersonDetails(event.apiUrl);
        emit(PersonDetailLoaded(personDetail: personDetail));
      } catch (_) {
        emit(ComicDetailError());
      }
    });
  }
}
