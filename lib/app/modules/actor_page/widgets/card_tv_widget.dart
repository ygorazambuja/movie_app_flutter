import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/domain/entities/tv_participation.dart';
import 'package:yshare/shared/constants.dart';

class CardTvWidget extends StatelessWidget {
  const CardTvWidget({
    Key key,
    @required this.tvParticipation,
  }) : super(key: key);

  final TvParticipation tvParticipation;

  @override
  Widget build(BuildContext context) {
    if (tvParticipation.posterPath == null) {
      return Container();
    }
    return Container(
      margin: const EdgeInsets.all(4),
      width: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () => Modular.to.pushNamed('/tvPage/${tvParticipation.id}'),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              borderOnForeground: false,
              elevation: 10,
              clipBehavior: Clip.antiAlias,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: '$IMAGE_BASE_URL${tvParticipation.posterPath}',
                  fit: BoxFit.cover,
                  height: 160,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              '${tvParticipation.name}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.fade,
              maxLines: 2,
              softWrap: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                EvaIcons.star,
                color: Colors.yellow.shade800,
                size: 14,
              ),
              Text(
                '${tvParticipation.voteAverage.toStringAsFixed(2)}/10',
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily, fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
