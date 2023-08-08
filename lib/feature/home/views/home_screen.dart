import 'package:animep_flutter/feature/home/interactor/home_interactor.dart';
import 'package:animep_flutter/feature/home/views/component/home_animelist_widget.dart';
import 'package:animep_flutter/models/Anime.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'component/section_list_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.title);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        /*
        // custom searchbar widget
        Padding(
          padding: padding,
          child: SearchBarTextfieldWidget(filter: _filter),
        ),
        */
        SizedBox(
          height: 16,
        ),
        _horizontalAnimeList('Trending Anime', null), // request trending anime
        _horizontalAnimeList('Anime Season Spring', 'spring'),
        _horizontalAnimeList('Anime Season Summer', 'summer'),
        _horizontalAnimeList('Anime Season Fall', 'fall'),
        _horizontalAnimeList('Anime Season Winter', 'winter'),

        SizedBox(
          height: 16,
        )
      ]),
    );
  }

  Widget _horizontalAnimeList(String title, String? filter) {
    return Column(
      children: [
        // section list widget
        SectionListWidget(
          title: title,
        ),
        // horizontal list anime widget
        SizedBox(
          height: 275.0,
          child: _animeListFutureBuilder(filter),
        ),
        SizedBox(
          height: 4.0,
        ),
      ],
    );
  }

  FutureBuilder<List<Anime>> _animeListFutureBuilder(String? filter) {
    http.Client httpClient = http.Client();
    return FutureBuilder<List<Anime>>(
      future: (filter != null)
          ? HomeInteractor.fetchAnimeBySeason(httpClient, filter)
          : HomeInteractor.fetchAnimeByTrending(httpClient),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? HomeAnimeListWidget(listAnime: snapshot.data!)
            : Center(child: CupertinoActivityIndicator());
      },
    );
  }
}
