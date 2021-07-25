import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionListWidget extends StatelessWidget {
  static const padding =
      const EdgeInsets.only(top: 16, left: 16, bottom: 12, right: 8);
  const SectionListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Trending Anime',
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'see all',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.yellow[900],
                    fontWeight: FontWeight.normal),
              ))
        ],
      ),
    );
  }
}
