import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorage =
    Provider<FlutterSecureStorage>((ref) => const FlutterSecureStorage());
