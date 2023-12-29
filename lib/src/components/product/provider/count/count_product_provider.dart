import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count_product_provider.g.dart';

@riverpod
class CounterValue extends _$CounterValue {
  @override
  int build() => 0;

  increment() => state++;

  decrement() => state--;
}

