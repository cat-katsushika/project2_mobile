import 'package:flutter/material.dart';
import 'package:project2_mobile/components/my_home_page/team_search_view/my_search_bar.dart';
import 'package:project2_mobile/components/my_home_page/team_search_view/team_card.dart';
import 'package:project2_mobile/models/team.dart';

class TeamSearchView extends StatefulWidget {
  const TeamSearchView({super.key});

  @override
  State<TeamSearchView> createState() => _TeamSearchViewState();
}

class _TeamSearchViewState extends State<TeamSearchView> {
  final TextEditingController controller = TextEditingController();
  bool _isLoading = false;
  List<Team> _teams = <Team>[];

  void onSearch(String query) async {
    debugPrint('search: $query');
    setState(() {
      _isLoading = true;
    });

    // 検索処理
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _teams = List.generate(10, (index) => Team(id: index.toString(), name: 'チーム$index', description: 'チーム$indexの説明\n$query'));
      _isLoading = false;
    });
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