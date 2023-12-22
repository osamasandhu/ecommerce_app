// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$counterValueHash() => r'9f3e2e789e7f03f8d191f89b04d3e8326511d92c';

/// See also [CounterValue].
@ProviderFor(CounterValue)
final counterValueProvider =
    AutoDisposeNotifierProvider<CounterValue, int>.internal(
  CounterValue.new,
  name: r'counterValueProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$counterValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CounterValue = AutoDisposeNotifier<int>;
String _$cartCounterHash() => r'32936f88374e93e073abbf3977c134af2cba3ccf';

/// See also [CartCounter].
@ProviderFor(CartCounter)
final cartCounterProvider = NotifierProvider<CartCounter, int>.internal(
  CartCounter.new,
  name: r'cartCounterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartCounterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CartCounter = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
