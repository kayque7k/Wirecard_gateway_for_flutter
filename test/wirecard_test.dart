import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wirecard/wirecard.dart';

void main() {
  const MethodChannel channel = MethodChannel('wirecard');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

}
