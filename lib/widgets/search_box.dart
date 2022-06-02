import 'package:budventure_app/constants/color.dart';
import 'package:budventure_app/constants/text.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.searchController,
      onChanged: (value) {
        setState(() {});
      },
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(Icons.search),
        ),
        fillColor: AppColors.searchgrey,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        hintText: AppText.search,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
