import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:yshare/app/app_controller.dart';
import 'package:yshare/domain/repository/actor_details/actor_details_abstract_repository.dart';
import 'package:yshare/domain/repository/episode/episode_abstract_repository.dart';
import 'package:yshare/domain/repository/film/film_abstract_repository.dart';
import 'package:yshare/domain/repository/tv/tv_abstract_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AppController appController;

  final FilmAbstractRepository filmRepository;
  final ActorDetailsAbstractRepository actorDetailsRepository;
  final TvAbstractRepository tvRepository;
  final EpisodeAbstractRepository episodeRepository;

  _HomeControllerBase({
    @required this.actorDetailsRepository,
    @required this.appController,
    @required this.filmRepository,
    @required this.tvRepository,
    @required this.episodeRepository,
  });
}
