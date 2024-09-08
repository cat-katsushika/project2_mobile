// ShellRouteで表示する画面であり，実装はScaffoldのbodyに当たるWidgetを返す．




import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project2_mobile/teams/view_models/search_team_list_provider.dart';
import 'package:project2_mobile/teams/widgets/my_search_bar.dart';
import 'package:project2_mobile/teams/widgets/team_card.dart';
import 'package:project2_mobile/teams/models/team.dart';

class TeamSearchBody extends ConsumerStatefulWidget {
  const TeamSearchBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeamSearchBodyState();
}

class _TeamSearchBodyState extends ConsumerState<TeamSearchBody> {
  final TextEditingController controller = TextEditingController();

    void onSearch(String query) async {
    debugPrint('search: $query');
    try {
      await ref.read(searchTeamListProvider.notifier).searchTeam(query);
    } catch (e) {
      debugPrint('search error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Team>> teams = ref.watch(searchTeamListProvider);


    return Column(
      children: <Widget>[
        const SizedBox(height: 10),

        MySearchBar(
          controller: controller,
          onSearch: onSearch,
        ),
        const SizedBox(height: 10),

        // teamsの状態を確認し、それぞれのケースに対応する
        teams.when(
          // ロード中のインジケータ
          loading: () => const CircularProgressIndicator(),
          
          // エラー時の表示
          error: (error, stackTrace) => Text('エラーが発生しました: $error'),
          
          // データ取得成功時
          data: (teamList) {
            if (teamList.isEmpty) {
              // 検索結果がない場合
              return const Text('検索結果がありません');
            } else {
              // 検索結果がある場合
              return Expanded(
                child: ListView.builder(
                  itemCount: teamList.length,
                  itemBuilder: (context, index) {
                    final team = teamList[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: TeamCard(team: team),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}