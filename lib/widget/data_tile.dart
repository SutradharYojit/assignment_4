import 'package:flutter/material.dart';
import '../model/list_model.dart';
import 'rich_text.dart';


class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.data,
    required this.index,
  });

  final List<TodoItem> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 270,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextRich(title: "Title\t:", description: data[index].title),
          TextRich(
            title: "Description\t:",
            description: data[index].description,
          ),
        ],
      ),
    );
  }
}

