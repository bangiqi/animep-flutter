import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final bool isDetail;
  final BuildContext context;

  CustomAppBar(
      {Key? key,
      required this.title,
      required this.isDetail,
      required this.context})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white70,
      title: (isDetail)
          ? Text(
              title,
              style: GoogleFonts.quicksand(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  fontWeight: FontWeight.w600),
            )
          : Container(
              width: 80,
              height: 24,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/logo_app.png')))),
      leading: (isDetail)
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black87,
              ),
              onPressed: () => Navigator.of(this.context).pop(),
            )
          : null,
      bottom: PreferredSize(
          child: Container(
            color: Colors.grey[200],
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(4.0)),
    );
  }

  @override
  Widget get child => throw UnimplementedError();
}
