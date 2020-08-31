import 'package:bshare/model/film.dart';
import 'package:bshare/provider/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'film_horizontal_list.dart';

class TrendingFilmList extends StatelessWidget {
  final Color color;
  const TrendingFilmList({Key key, @required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: FutureBuilder<List<Film>>(
      future: Api().getTrendingFilms(),
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
                        child: Text('Trending',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 20)),
                      ),
                      InkWell(
                        splashColor: Colors.pink.withOpacity(0.5),
                        onTap: () {},
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