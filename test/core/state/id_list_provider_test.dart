import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_match/core/state/id_list_provider.dart';

void main() {
  group('IdList Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      // 各テストの後にコンテナを破棄
      container.dispose();
    });

    test('build test', () {
      final notifier = container.read(idListProvider.notifier);

      notifier.build();

      // リストが1000要素を持っているか
      expect(notifier.debugState(), hasLength(1000));

      // リストに1が含まれるか
      expect(notifier.debugState(), contains(1));

      // リストに1,000が含まれるか
      expect(notifier.debugState(), contains(1000));

      // リストに0が含まれていないか
      expect(notifier.debugState(), isNot(contains(0)));

      // リストに1,001が含まれていないか
      expect(notifier.debugState(), isNot(contains(1001)));
    });

    test('remove method test', () {
      final notifier = container.read(idListProvider.notifier);

      notifier.build();

      final first = notifier.debugState().first;

      // リストが1000要素を持っているか
      expect(notifier.debugState(), hasLength(1000));

      notifier.remove();

      // リストが999要素になっているか
      expect(notifier.debugState(), hasLength(999));

      // 最初の要素が削除されたか
      expect(notifier.debugState(), isNot(contains(first)));
    });
  });
}
