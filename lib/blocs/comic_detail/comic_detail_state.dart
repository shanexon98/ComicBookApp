import 'package:equatable/equatable.dart';
import '../../models/comic_detail_model.dart';

abstract class ComicDetailState extends Equatable {
  const ComicDetailState();

  @override
  List<Object> get props => [];
}

class ComicDetailLoading extends ComicDetailState {}

class ComicDetailLoaded extends ComicDetailState {
  final Results comicDetail;

  const ComicDetailLoaded({required this.comicDetail});

  @override
  List<Object> get props => [comicDetail];
}

class ComicDetailError extends ComicDetailState {}
