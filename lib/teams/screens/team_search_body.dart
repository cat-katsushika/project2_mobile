// ShellRouteで表示する画面であり，実装はScaffoldのbodyに当たるWidgetを返す．




import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project2_mobile/teams/services/search_team.dart';
import 'package:project2_mobile/teams/widgets/my_search_bar.dart';
import 'package:project2_mobile/teams/widgets/team_card.dart';
import 'package:project2_mobile/teams/models/team.dart';
import 'package:project2_mobile/teams/view_models/search_team_provider.dart';

class TeamSearchBody extends ConsumerStatefulWidget {
  const TeamSearchBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeamSearchBodyState();
}

class _TeamSearchBodyState extends ConsumerState<TeamSearchBody> {
  final TextEditingController controller = TextEditingController();
  bool _isLoading = false;
  List<Team> _teams = <Team>[];

  // void onSearch(String query) async {
  //   debugPrint('search: $query');
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   // 検索処理
  //   await Future.delayed(const Duration(seconds: 1));
  //   setState(() {
  //     // _teams = List.generate(10, (index) => Team(id: index.toString(), name: 'チーム$index', description: 'チーム$indexの説明\n$query'));
  //     _teams = await ref.read(searchTeamProvider(query).future);
  //     _isLoading = false;
  //   });
  // }

    void onSearch(String query) async {
    debugPrint('search: $query');
    setState(() {
      _isLoading = true;
    });

    try {
      final teams = await searchTeam(query);
      setState(() {
        _teams = teams;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('search error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),

        MySearchBar(
          controller: controller,
          onSearch: onSearch,
        ),
        const SizedBox(height: 10),
        
        // 検索中
        if (_isLoading) 
          const CircularProgressIndicator(),
        
        // 検索結果なし
        if (!_isLoading && _teams.isEmpty) 
          const Text('検索結果がありません'),
        
        // 検索結果あり
        if (!_isLoading && _teams.isNotEmpty)
          Expanded(
            child:
          ListView.builder(
            itemCount: _teams.length,
            itemBuilder: (context, index) {
              final team = _teams[index];
              return Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TeamCard(team: team),
              );
            },
          ),
          ),
      ],
    );
  }
}