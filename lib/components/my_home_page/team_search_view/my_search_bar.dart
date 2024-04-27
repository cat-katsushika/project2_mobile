import 'package:flutter/material.dart';

import 'package:project2_mobile/const/colors.dart';

class MySearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  MySearchBar({required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFE9DEF8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const Icon(Icons.dehaze_sharp),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: '検索',
                border: InputBorder.none,
              ),
              onSubmitted: (_) => onSearch(),
            ),
          ),
          const Icon(Icons.search),
        ],
      ),
    );
  }
}
