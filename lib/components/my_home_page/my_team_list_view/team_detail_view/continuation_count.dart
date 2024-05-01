import 'package:flutter/material.dart';

class ContinuationCount extends StatelessWidget {
  const ContinuationCount({Key? key, required this.continuationCount})
      : super(key: key);

  final String continuationCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Chip(
          avatar: Icon(Icons.repeat),
          label: Text('継続回数'),
        ),
        const SizedBox(height: 10),
        Container(
          width: 91,
          height: 72,
          decoration: BoxDecoration(
            color: Colors.grey[100], // 灰色の背景
            borderRadius: BorderRadius.circular(10), // 角丸
          ),
          child: Center(
            child:
                Text(continuationCount, style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
