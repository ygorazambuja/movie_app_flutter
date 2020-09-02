import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'tv_page_controller.dart';

class TvPagePage extends StatefulWidget {
  final String title;
  final String id;
  const TvPagePage({
    Key key,
    this.title = 'TvPage',
    @required this.id,
  }) : super(key: key);

  @override
  _TvPagePageState createState() => _TvPagePageState();
}

class _TvPagePageState extends ModularState<TvPagePage, TvPageController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[Text(widget.id)],
      ),
    );
  }
}