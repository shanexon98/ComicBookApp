import 'package:comic_book_app/blocs/comic_detail/comic_detail_state.dart';
import 'package:comic_book_app/models/comic_creators_model.dart';

class PersonDetailLoaded extends ComicDetailState {
  final ComicCreatorsModel personDetail;

  PersonDetailLoaded({required this.personDetail});
}
