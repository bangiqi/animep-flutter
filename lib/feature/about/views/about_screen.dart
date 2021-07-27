import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen(this.title);
  final String title;

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  static const padding =
      const EdgeInsets.only(top: 16, left: 16, bottom: 0, right: 16);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        _userBiographyWidget(),
        _separatorLine(),
        _sectionHeaderTitle('Developer'),
        _listResourceLink('Rizki Ramdani', 'https://github.com/bangiqi'),
        _listResourceLink('Instagram', 'https://www.instagram.com/bangiqi93'),
        _separatorLine(),
        _sectionHeaderTitle('Resources'),
        _listResourceLink('Public API', 'https://kitsu.docs.apiary.io/#'),
        _separatorLine(),
        _sectionHeaderTitle('Package'),
        _listResourceLink('http', 'https://pub.dev/packages/http'),
        _listResourceLink(
            'google_fonts', 'https://pub.dev/packages/google_fonts'),
        _listResourceLink(
            'url_launcher', 'https://pub.dev/packages/url_launcher'),
        _listResourceLink(
            'flutter_linkify', 'https://pub.dev/packages/flutter_linkify'),
        SizedBox(
          height: 16,
        )
      ]),
    );
  }

  Widget _userBiographyWidget() {
    return Container(
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('assets/logo_circle.png')))),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                            "Animep merupakan aplikasi yang menawarkan informasi mengenai daftar manga dan anime.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey[900]))),
                      ),
                    ],
                  )),
            ],
          ),
        )
      ]),
    );
  }

  Widget _sectionHeaderTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 16, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[900])),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _separatorLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: const Divider(
        height: 16,
        thickness: 0.5,
        indent: 16,
        endIndent: 16,
        color: Colors.black12,
      ),
    );
  }

  Widget _listResourceLink(String title, String link) {
    return SizedBox(
      height: 22,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Linkify(
                      onOpen: (link) async {
                        if (await canLaunch(link.url)) {
                          await launch(link.url);
                        } else {
                          throw 'Could not launch $link';
                        }
                      },
                      text: "${title} : ${link}",
                      style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
