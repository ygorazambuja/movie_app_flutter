import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/app/modules/home/home_controller.dart';
import 'package:yshare/domain/entities/film.dart';
import 'package:yshare/domain/usecases/film/get_top_rated_film_usecase.dart';

import 'film_horizontal_list.dart';

class TopRatedList extends StatelessWidget {
  final Color color;
  final HomeController controller;

  const TopRatedList({
    Key key,
    @required this.color,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: FutureBuilder<List<Film>>(
      future: GetTopRatedFilmUsecase(
          page: 1, repository: controller.filmRepository)(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Container();
            break;
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            if (snapshot.data is List<Film>) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 10, right: 20, bottom: 10),
                        child: Text('Top Rated',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 20)),
                      ),
                      InkWell(
                        splashColor: Colors.pink.withOpacity(0.5),
                        onTap: () => Modular.to.pushNamed('topRatedFilms'),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10, right: 20, bottom: 10),
                          child: Text('See More',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                  FilmHorizontalList(
                    films: snapshot.data,
                    color: color,
                  )
                ],
              );
            } else {
              return Container();
            }
            break;
          default:
            return Container();
        }
      },
    ));
  }
}
