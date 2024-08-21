import 'package:equatable/equatable.dart';

abstract class ComicDetailEvent extends Equatable {
  const ComicDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchComicDetail extends ComicDetailEvent {
  final int comicId;

  const FetchComicDetail({required this.comicId});

  @override
  List<Object> get props => [comicId];
}
