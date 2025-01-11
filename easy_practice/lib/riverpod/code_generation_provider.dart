import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 기존 방법
final _testProvider = Provider<String>((ref) => 'Hello');

@riverpod
String gState(GStateRef ref) {
  return 'Hello';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(
    const Duration(seconds: 2),
  );

  return 2;
}

@Riverpod(keepAlive: true)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(
    const Duration(seconds: 2),
  );

  return 2;
}

@Riverpod(keepAlive: true)
int gStateMultiply(GStateMultiplyRef ref,
    {required int number1, required int number2}) {
  return number1 * number2;
}

@Riverpod(keepAlive: true)
class GStateNotifier extends _$GStateNotifier {
  // 기본 상태값 꼭 넣어줄 것
  @override
  int build() {
    return 0;
  }

  increment() {
    state++;
  }

  decrement() {
    state--;
  }
}
