// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TopRatedPageController on _TopRatedPageControllerBase, Store {
  final _$filmsAtom = Atom(name: '_TopRatedPageControllerBase.films');

  @override
  ObservableList<Film> get films {
    _$filmsAtom.reportRead();
    return super.films;
  }

  @override
  set films(ObservableList<Film> value) {
    _$filmsAtom.reportWrite(value, super.films, () {
      super.films = value;
    });
  }

  final _$actualPageAtom = Atom(name: '_TopRatedPageControllerBase.actualPage');

  @override
  int get actualPage {
    _$actualPageAtom.reportRead();
    return super.actualPage;
  }

  @override
  set actualPage(int value) {
    _$actualPageAtom.reportWrite(value, super.actualPage, () {
      super.actualPage = value;
    });
  }

  final _$fetchTopRatedAsyncAction =
      AsyncAction('_TopRatedPageControllerBase.fetchTopRated');

  @override
  Future<void> fetchTopRated() {
    return _$fetchTopRatedAsyncAction.run(() => super.fetchTopRated());
  }

  final _$_TopRatedPageControllerBaseActionController =
      ActionController(name: '_TopRatedPageControllerBase');

  @override
  void setActualPage(dynamic actualPage) {
    final _$actionInfo = _$_TopRatedPageControllerBaseActionController
        .startAction(name: '_TopRatedPageControllerBase.setActualPage');
    try {
      return super.setActualPage(actualPage);
    } finally {
      _$_TopRatedPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
films: ${films},
actualPage: ${actualPage}
    ''';
  }
}
