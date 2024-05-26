import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_team_list_view_index_notifier.g.dart';

@riverpod
class MyTeamListViewIndexNotifier extends _$MyTeamListViewIndexNotifier {
  
  @override
  int build() {
    return 0;
    // return 0;
  }

  void changeIndex(int index) {
    state = index;
  }
}