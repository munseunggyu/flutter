import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

final _testProvider = Provider<String>((ref) => 'Hello');

@riverpod
String gState(GStateRef ref) {
  return 'Hello';
}
