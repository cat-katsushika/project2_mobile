// ボトムナブバーがあるScaffoldを作成するクラス

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project2_mobile/teams/widgets/cteate_team_modal.dart';



class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("project2"),
      ),
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'ホーム'),
          NavigationDestination(icon: Icon(Icons.search), label: '検索'),
          NavigationDestination(icon: Icon(Icons.settings), label: '設定'),
        ],
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
      floatingActionButton: (navigationShell.currentIndex == 1) ? FloatingActionButton(
        onPressed: () {
          // チームを作成するモーダルを表示
          showCreateTeamModal(context);
        },
        child: const Icon(Icons.add),
      ) : null,
    );
  }
}
