import 'package:animep_flutter/feature/home/interactor/home_interactor.dart';
import 'package:animep_flutter/feature/home/views/home_animelist_widget.dart';
import 'package:animep_flutter/feature/home/views/searchbar_textfield_widget.dart';
import 'package:animep_flutter/feature/home/views/section_list_widget.dart';
import 'package:animep_flutter/models/Anime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen(this.title);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _filter = new TextEditingController();
  static const padding =
      const EdgeInsets.only(top: 16, left: 16, bottom: 0, right: 16);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        // custom searchbar widget
        Padding(
          padding: padding,
          child: SearchBarTextfieldWidget(filter: _filter),
        ),

        _horizontalAnimeList('spring'),
        _horizontalAnimeList('summer'),
        _horizontalAnimeList('fall'),
        _horizontalAnimeList('winter'),

        SizedBox(
          height: 16,
        )
      ]),
    );
  }

  Widget _horizontalAnimeList(String session) {
    return Column(
      children: [
        // section list widget
        SectionListWidget(),
        // horizontal list anime widget
        SizedBox(
          height: 260.0,
          child: _trendingAnimeListFuture(session),
        ),
        SizedBox(
          height: 4.0,
        ),
      ],
    );
  }

  FutureBuilder<List<Anime>> _trendingAnimeListFuture(String session) {
    return FutureBuilder<List<Anime>>(
      future: HomeInteractor.fetchTrendingAnime(http.Client(), session),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? HomeAnimeListWidget(listAnime: snapshot.data!)
            : Center(child: CupertinoActivityIndicator());
      },
    );
  }
}
