import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:project2_mobile/teams/models/team.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MyTeamCard extends ConsumerWidget {
  final Team team;

  const MyTeamCard(
      {super.key, required this.team});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card.outlined(
      color: Colors.transparent,
      child: SizedBox(
        height: 144,
        width: 360,
        child: InkWell(
          onTap: () {
            debugPrint("DEBUG: from:MyTeamCard チームカードが押されました");
            context.push('/teams/${team.id}');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 72,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 12, right: 4, bottom: 12),
                    child: Text(
                      team.name,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 72,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          child: Text(
                            team.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}