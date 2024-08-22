import 'package:flutter/material.dart';
import 'package:project2_mobile/teams/models/team.dart';
import 'package:project2_mobile/teams/services/join_team.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project2_mobile/teams/view_models/my_team_list_provider.dart';

class TeamCard extends ConsumerWidget {
  final Team team;

  const TeamCard({
    Key? key,
    required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card.outlined(
        color: Colors.transparent,
        child: SizedBox(
            height: 216,
            width: 360,
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
                    height: 144,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              height: 40,
                              child:
                              Text(
                                team.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                                    ),  
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: 
                            SizedBox(
                                  height: 40,
                                  width: 77,
                                  child: FilledButton(
                                  onPressed: () {
                                    debugPrint("DEBUG: from:TeamCard 参加ボタンが押されました");
                                    joinTeamApi(team.id);
                                    
                                    // 所属チームを再取得
                                    ref.invalidate(myTeamListProvider);
                                  },
                                  child: Text(
                                    '参加',
                                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                          color: Theme.of(context).colorScheme.onPrimary,
                                    )
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
    );
  }
}
