// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductsHash() => r'5e6fae48def90201dd04546bf5bc7b9452fbca31';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getProducts].
@ProviderFor(getProducts)
const getProductsProvider = GetProductsFamily();

/// See also [getProducts].
class GetProductsFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [getProducts].
  const GetProductsFamily();

  /// See also [getProducts].
  GetProductsProvider call(
    String category,
  ) {
    return GetProductsProvider(
      category,
    );
  }

  @override
  GetProductsProvider getProviderOverride(
    covariant GetProductsProvider provider,
  ) {
    return call(
      provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getProductsProvider';
}

/// See also [getProducts].
class GetProductsProvider
    extends AutoDisposeFutureProvider<List<ProductModel>> {
  /// See also [getProducts].
  GetProductsProvider(
    String category,
  ) : this._internal(
          (ref) => getProducts(
            ref as GetProductsRef,
            category,
          ),
          from: getProductsProvider,
          name: r'getProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProductsHash,
          dependencies: GetProductsFamily._dependencies,
          allTransitiveDependencies:
              GetProductsFamily._allTransitiveDependencies,
          category: category,
        );

  GetProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  Override overrideWith(
    FutureOr<List<ProductModel>> Function(GetProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProductsProvider._internal(
        (ref) => create(ref as GetProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductModel>> createElement() {
    return _GetProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductsProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProductsRef on AutoDisposeFutureProviderRef<List<ProductModel>> {
  /// The parameter `category` of this provider.
  String get category;
}

class _GetProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductModel>>
    with GetProductsRef {
  _GetProductsProviderElement(super.provider);

  @override
  String get category => (origin as GetProductsProvider).category;
}

String _$getCategoriesHash() => r'3268003330dae15b885ef116fc48dbe826e26668';

/// See also [getCategories].
@ProviderFor(getCategories)
final getCategoriesProvider = FutureProvider<List<String>>.internal(
  getCategories,
  name: r'getCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCategoriesRef = FutureProviderRef<List<String>>;
String _$getCartItemsHash() => r'1960429af218f561d0cc9b096e54a33112bd68b8';

/// See also [getCartItems].
@ProviderFor(getCartItems)
const getCartItemsProvider = GetCartItemsFamily();

/// See also [getCartItems].
class GetCartItemsFamily extends Family<AsyncValue<List<CartModel>>> {
  /// See also [getCartItems].
  const GetCartItemsFamily();

  /// See also [getCartItems].
  GetCartItemsProvider call(
    int userId,
  ) {
    return GetCartItemsProvider(
      userId,
    );
  }

  @override
  GetCartItemsProvider getProviderOverride(
    covariant GetCartItemsProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getCartItemsProvider';
}

/// See also [getCartItems].
class GetCartItemsProvider extends AutoDisposeFutureProvider<List<CartModel>> {
  /// See also [getCartItems].
  GetCartItemsProvider(
    int userId,
  ) : this._internal(
          (ref) => getCartItems(
            ref as GetCartItemsRef,
            userId,
          ),
          from: getCartItemsProvider,
          name: r'getCartItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCartItemsHash,
          dependencies: GetCartItemsFamily._dependencies,
          allTransitiveDependencies:
              GetCartItemsFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetCartItemsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  Override overrideWith(
    FutureOr<List<CartModel>> Function(GetCartItemsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCartItemsProvider._internal(
        (ref) => create(ref as GetCartItemsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CartModel>> createElement() {
    return _GetCartItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCartItemsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCartItemsRef on AutoDisposeFutureProviderRef<List<CartModel>> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _GetCartItemsProviderElement
    extends AutoDisposeFutureProviderElement<List<CartModel>>
    with GetCartItemsRef {
  _GetCartItemsProviderElement(super.provider);

  @override
  int get userId => (origin as GetCartItemsProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
