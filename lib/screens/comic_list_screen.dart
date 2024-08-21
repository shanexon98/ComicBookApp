import 'package:animate_do/animate_do.dart';
import 'package:comic_book_app/blocs/comic_detail/comic_detail_bloc.dart';
import 'package:comic_book_app/screens/comic_detail_screen.dart';
import 'package:comic_book_app/widgets/text_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../blocs/comic_list/comic_list_bloc.dart';
import '../blocs/comic_list/comic_list_event.dart';
import '../blocs/comic_list/comic_list_state.dart';

class ComicListScreen extends StatefulWidget {
  @override
  _ComicListScreenState createState() => _ComicListScreenState();
}

class _ComicListScreenState extends State<ComicListScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 200) {
      if (!_showScrollToTopButton) {
        setState(() {
          _showScrollToTopButton = true;
        });
      }
    } else {
      if (_showScrollToTopButton) {
        setState(() {
          _showScrollToTopButton = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xffF0F0F0),
        title: const Center(
            child: TextDefault(
                sizeText: 40, colorText: Colors.black, text: "ComicBooks")),
      ),
      body: BlocBuilder<ComicListBloc, ComicListState>(
        builder: (context, state) {
          if (state is ComicListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ComicListLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<ComicListBloc>(context).add(FetchComics());
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount: state.comics.length,
                itemBuilder: (context, index) {
                  final comic = state.comics[index];
                  final formattedDate =
                      DateFormat('yyyy-MM-dd').format(comic.coverDate!);
                  final displayName =
                      (comic.name == null || comic.name == "null")
                          ? "Historia no nombrada"
                          : comic.name;
                  final cleanedDescription = comic.description != null
                      ? removeHtmlTags(comic.description!)
                      : "Descripción no disponible";
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: BlocProvider.of<ComicDetailBloc>(context),
                            child: ComicDetailScreen(
                              comicId: comic.id!,
                              cleanedDescription: cleanedDescription,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(),
                          ElasticIn(
                              child: FadeInImage(
                            placeholder: NetworkImage(comic.image!.mediumUrl!),
                            image: NetworkImage(comic.image!.mediumUrl!),
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: TextDefault(
                            text: '$displayName #${comic.issueNumber}',
                            sizeText: 25,
                            fontWeight: FontWeight.w600,
                            colorText: Colors.black,
                          )),
                          Center(
                              child: TextDefault(
                            text: ' $formattedDate',
                            sizeText: 20,
                            fontWeight: FontWeight.w600,
                            colorText: Colors.black,
                          )),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is ComicListError) {
            return Center(child: Text('Failed to load comics'));
          }
          return Container();
        },
      ),
      floatingActionButton: _showScrollToTopButton
          ? FloatingActionButton(
              backgroundColor: Colors.black,
              child: Icon(Icons.arrow_upward, color: Colors.white),
              onPressed: () {
                _scrollController.animateTo(
                  0.0,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
            )
          : null,
    );
  }

  String removeHtmlTags(String htmlText) {
    final RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
}
