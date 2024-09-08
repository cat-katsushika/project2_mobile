import 'package:flutter/material.dart';
import 'package:project2_mobile/shared/constants/colors.dart';

class ContinuationCount extends StatelessWidget {
  const ContinuationCount({Key? key, required this.continuationCount})
      : super(key: key);

  final String continuationCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Chip(
          avatar: const Icon(Icons.repeat),
          label: Text(
            '継続回数',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 91,
          height: 72,
          decoration: BoxDecoration(
            color: CustomColors.surfaceContainer, // 灰色の背景
            borderRadius: BorderRadius.circular(10), // 角丸
          ),
          child: Center(
            child:
                Text(
                  continuationCount, 
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: CustomColors.onSurfaceContainer,
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
