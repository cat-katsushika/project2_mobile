import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_team_list_view_name_notifier.g.dart';

@riverpod
class MyTeamListViewNameNotifier extends _$MyTeamListViewNameNotifier {
  
  @override
  String build() {
    return "";
  }

  void changeView(String viewName) {
    state = viewName;
  }
}