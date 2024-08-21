import 'package:comic_book_app/blocs/comic_detail/comic_detail_event.dart';

class FetchPersonDetail extends ComicDetailEvent {
  final String apiUrl;

  FetchPersonDetail({required this.apiUrl});
}
