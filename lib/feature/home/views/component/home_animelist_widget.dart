import 'package:animep_flutter/feature/detail/views/detail_screen.dart';
import 'package:animep_flutter/models/Anime.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAnimeListWidget extends StatelessWidget {
  final List<Anime> listAnime;

  HomeAnimeListWidget({Key? key, required this.listAnime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 0, right: 8, left: 8),
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: listAnime.length,
        itemBuilder: (BuildContext context, int index) => InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: _buildItemsForListView(context, index),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(listAnime[index]);
                }));
              },
            ));
  }

  Padding _buildItemsForListView(BuildContext context, int index) {
    return Padding(
        padding: EdgeInsets.only(right: 8, left: 8),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      listAnime[index].attributes.posterImage.small,
                      fit: BoxFit.contain,
                      width: 140,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Container(
                  width: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 8,
                      ),
                      Text(listAnime[index].attributes.canonicalTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[800]))),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          AssetImage('assets/icon_star.png')))),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, left: 4),
                            child: Text(
                                (listAnime[index]
                                        .attributes
                                        .getAverageRating() ??
                                    ''),
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54))),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
