import 'package:equatable/equatable.dart';
import '../../models/comic_model.dart';

abstract class ComicListState extends Equatable {
  const ComicListState();

  @override
  List<Object> get props => [];
}

class ComicListLoading extends ComicListState {}

class ComicListLoaded extends ComicListState {
  final List<Result> comics;

  const ComicListLoaded({required this.comics});

  @override
  List<Object> get props => [comics];
}

class ComicListError extends ComicListState {}
