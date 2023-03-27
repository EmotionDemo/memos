import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView(
      {Key? key,
      required this.onSearchInputComplete,
      required this.controller,
      this.hintText})
      : super(key: key);
  final VoidCallback? onSearchInputComplete;
  final TextEditingController? controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    var customBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(style: BorderStyle.none));

    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      textAlign: TextAlign.left,
      onEditingComplete: onSearchInputComplete,
      decoration: InputDecoration(
        fillColor: const Color.fromRGBO(200, 220, 210, 1.0),
        filled: true,
        contentPadding:
            const EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black45),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black87,
        ),
        suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_forward_sharp, color: Colors.black87),
            onPressed: onSearchInputComplete),
        border: customBorder,
        enabledBorder: customBorder,
        focusedBorder: customBorder,
        focusedErrorBorder: customBorder,
        errorBorder: customBorder,
      ),
    );
  }
}
