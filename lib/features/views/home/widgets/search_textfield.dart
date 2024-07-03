import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.onChanged,
    this.teController,
    this.background = Colors.white,
    this.iconColor,
    this.fontColor,
  });
  final Function onChanged;
  final TextEditingController? teController;
  final Color background;
  final Color? fontColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onChanged: (value) => onChanged(),
        controller: teController,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
          hintText: 'search',
          prefixIcon: Icon(
            Icons.search,
            color: iconColor ?? Colors.blue,
          ),
          suffixIcon: Icon(
            Icons.edit_road,
            color: iconColor ?? Colors.blue,
          ),
          filled: true,
          fillColor: background,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: fontColor ?? Colors.blue,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
