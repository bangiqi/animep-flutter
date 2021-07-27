import 'package:animep_flutter/feature/home/views/component/home_animelist_widget.dart';
import 'package:animep_flutter/feature/home/views/component/section_list_widget.dart';
import 'package:animep_flutter/feature/manga/interactor/manga_interactor.dart';
import 'package:animep_flutter/models/Anime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

class MangaScreen extends StatefulWidget {
  MangaScreen(this.title);
  final String title;

  @override
  _MangaScreenState createState() => _MangaScreenState();
}

class _MangaScreenState extends State<MangaScreen> {
  static const padding =
      const EdgeInsets.only(top: 16, left: 16, bottom: 0, right: 16);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        SizedBox(
          height: 16,
        ),
        _horizontalMangaList(isTrending: true),
        _horizontalMangaList(title: 'Manga'),
        SizedBox(
          height: 16,
        )
      ]),
    );
  }

  Widget _horizontalMangaList({String title = "", bool isTrending = false}) {
    return Column(
      children: [
        // section list widget
        SectionListWidget(
          title: (isTrending) ? 'Trending Manga' : title,
        ),
        // horizontal list anime widget
        SizedBox(
          height: 270.0,
          child: (isTrending) ? _listTrendingManga() : _listManga(),
        ),
        SizedBox(
          height: 4.0,
        ),
      ],
    );
  }

  FutureBuilder<List<Anime>> _listManga() {
    http.Client httpClient = http.Client();
    return FutureBuilder<List<Anime>>(
      future: MangaInteractor.fetchManga(httpClient),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? HomeAnimeListWidget(listAnime: snapshot.data!)
            : Center(child: CupertinoActivityIndicator());
      },
    );
  }

  FutureBuilder<List<Anime>> _listTrendingManga() {
    http.Client httpClient = http.Client();
    return FutureBuilder<List<Anime>>(
      future: MangaInteractor.fetchMangaTrending(httpClient),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? HomeAnimeListWidget(listAnime: snapshot.data!)
            : Center(child: CupertinoActivityIndicator());
      },
    );
  }
}
