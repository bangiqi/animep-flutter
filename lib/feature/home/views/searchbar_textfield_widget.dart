import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarTextfieldWidget extends StatelessWidget {
  const SearchBarTextfieldWidget({
    Key? key,
    required TextEditingController filter,
  })  : _filter = filter,
        super(key: key);

  final TextEditingController _filter;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: _filter,
      keyboardType: TextInputType.text,
      placeholder: 'Search',
      placeholderStyle: TextStyle(
        color: Color(0xffC4C6CC),
        fontSize: 16.0,
      ),
      prefix: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 5.0, 0.0, 5.0),
        child: Icon(
          Icons.search,
          size: 18,
          color: Colors.black,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
    );
  }
}
