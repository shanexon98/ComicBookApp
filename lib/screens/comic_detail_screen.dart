import 'package:animate_do/animate_do.dart';
import 'package:comic_book_app/models/comic_detail_model.dart';
import 'package:comic_book_app/widgets/text_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/comic_detail/comic_detail_bloc.dart';
import '../blocs/comic_detail/comic_detail_event.dart';
import '../blocs/comic_detail/comic_detail_state.dart';

class ComicDetailScreen extends StatelessWidget {
  final int comicId;
  final String cleanedDescription;

  ComicDetailScreen({required this.comicId, required this.cleanedDescription});

  @override
  Widget build(BuildContext context) {
    final comicDetailBloc =
        BlocProvider.of<ComicDetailBloc>(context, listen: false);
    comicDetailBloc.add(FetchComicDetail(comicId: comicId));

    return Scaffold(
      body: BlocBuilder<ComicDetailBloc, ComicDetailState>(
        builder: (context, state) {
          if (state is ComicDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ComicDetailLoaded) {
            final comicDetail = state.comicDetail;

            return RefreshIndicator(
              onRefresh: () async {
                comicDetailBloc.add(FetchComicDetail(comicId: comicId));
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAnimatedHeader(comicDetail, context),
                    _buildAnimatedImageSection(comicDetail, context),
                    _buildDescriptionSection(cleanedDescription),
                    _buildAnimatedSection(
                        "Creators", comicDetail.personCredits),
                    _buildAnimatedSection(
                        "Characters", comicDetail.characterCredits,
                        isList: true),
                    _buildAnimatedSection("Teams", comicDetail.teamCredits),
                    _buildAnimatedSection(
                        "Locations", comicDetail.locationCredits),
                    _buildAnimatedSection(
                        "Concepts", comicDetail.conceptCredits),
                  ],
                ),
              ),
            );
          } else if (state is ComicDetailError) {
            return Center(child: Text('Failed to load comic details'));
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildAnimatedHeader(Results comicDetail, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: double.infinity,
      color: const Color(0xff232828),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElasticIn(
          child: Row(
            children: [
              TextDefault(
                text: comicDetail.name.toString(),
                sizeText: 40,
                colorText: Colors.white,
                fontWeight: FontWeight.w800,
              ),
              const SizedBox(width: 10),
              TextDefault(
                text: '#${comicDetail.issueNumber}',
                sizeText: 40,
                colorText: const Color(0xff646464),
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedImageSection(Results comicDetail, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      color: const Color(0xff646464),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffF0F0F0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElasticIn(
              child: FadeInImage(
                placeholder:
                    NetworkImage(comicDetail.image!.originalUrl.toString()),
                image: NetworkImage(comicDetail.image!.originalUrl.toString()),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionSection(String cleanedDescription) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextDefault(
        text: cleanedDescription,
        sizeText: 16,
        colorText: const Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.fade,
      ),
    );
  }

  Widget _buildAnimatedSection(String title, List credits,
      {bool isList = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextDefault(
            text: title,
            sizeText: 20,
            colorText: const Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.fade,
          ),
        ),
        const Divider(),
        isList
            ? FadeOutRight(child: ListUtils(comicDetail: credits))
            : _buildGridView(credits),
      ],
    );
  }

  Widget _buildGridView(List credits) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 1.0,
        childAspectRatio: 6 / 2,
      ),
      itemCount: credits.length,
      itemBuilder: (context, index) {
        final person = credits[index];
        return Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: FadeOutRight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(person.apiDetailUrl.toString()),
                  radius: 20,
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      person.name ?? "Nombre no disponible",
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2C8C56)),
                    ),
                    Text(
                      person.role ?? "Rol no disponible",
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ListUtils extends StatelessWidget {
  final List comicDetail;

  const ListUtils({super.key, required this.comicDetail});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 1.0,
        childAspectRatio: 6 / 2,
      ),
      itemCount: comicDetail.length,
      itemBuilder: (context, index) {
        final person = comicDetail[index];
        return Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://comicvine.gamespot.com/a/uploads/square_avatar/2/28071/925630-14adkinsphoto.jpg"),
                radius: 20,
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    person.name ?? "Nombre no disponible",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff2C8C56)),
                  ),
                  Text(
                    person.role ?? "Rol no disponible",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
