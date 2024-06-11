import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_page_name_notifier.g.dart';

@riverpod
class AuthPageNameNotifier extends _$AuthPageNameNotifier {

  @override
  String build() {
    return "signup";
  }

  void changePage(String pageName) {
    state = pageName;
  }
}