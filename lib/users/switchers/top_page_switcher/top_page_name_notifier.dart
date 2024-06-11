import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_page_name_notifier.g.dart';

@riverpod
class TopPageNameNotifier extends _$TopPageNameNotifier {

  @override
  String build() {
    return "initialLoading";
  }

  void changePage(String pageName) {
    state = pageName;
  }
}