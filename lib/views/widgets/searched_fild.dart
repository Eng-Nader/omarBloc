import 'package:flutter/material.dart';
import '../../core/app_color.dart';

class SearchedFild extends StatelessWidget {
  const SearchedFild({
    super.key,
    required this.textEditingController,
    required this.onChanged,
  });
  final TextEditingController textEditingController;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      cursorColor: AppColor.grey,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Find Animae Character....',
        hintStyle: TextStyle(
          color: AppColor.grey,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: TextStyle(
        color: AppColor.grey,
        fontSize: 18,
      ),
      onChanged: onChanged,
    );
  }
}
