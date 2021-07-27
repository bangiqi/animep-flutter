import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionListWidget extends StatelessWidget {
  final String title;

  static const padding =
      const EdgeInsets.only(top: 8, left: 16, bottom: 16, right: 8);
  const SectionListWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
          Visibility(
              visible: false,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'see all',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.yellow[900],
                        fontWeight: FontWeight.normal),
                  )))
        ],
      ),
    );
  }
}
