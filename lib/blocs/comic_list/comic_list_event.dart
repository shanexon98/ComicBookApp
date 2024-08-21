import 'package:equatable/equatable.dart';

abstract class ComicListEvent extends Equatable {
  const ComicListEvent();

  @override
  List<Object> get props => [];
}

class FetchComics extends ComicListEvent {}
