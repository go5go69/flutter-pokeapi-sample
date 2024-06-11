import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'id_list_provider.g.dart';

@Riverpod(keepAlive: true)
class IdList extends _$IdList {
  @override
  List<int> build() {
    return List.generate(1000, (index) => index + 1)..shuffle();
  }

  void remove() {
    final newList = List<int>.from(state);
    newList.removeAt(0);
    state = newList;
  }

  /// test用にStateを返す
  List<int> debugState() {
    return state;
  }
}
