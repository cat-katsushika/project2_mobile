import 'package:flutter/material.dart';
import 'package:project2_mobile/models/team.dart';

class UserList extends StatelessWidget {
  final String username;
  final List<User> users;

  const UserList({Key? key, required this.username, required this.users})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Chip(
          avatar: const Icon(Icons.play_arrow_outlined),
          label: Text(
            '$usernameの番',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Wrap(
            spacing: 16.0, // アイコン間のスペース
            children: users.map((user) {
              final isCurrentTurn = user.username == username;
              return CircleAvatar(
                backgroundColor: isCurrentTurn
                    ? Theme.of(context).colorScheme.surfaceTint
                    : null,
                radius: 20.0, // アイコンのサイズ
                child: CircleAvatar(
                  radius: 18.0, // 内側の円のサイズ
                  child: Text(
                    user.username[0].toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
