// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) {
  return _CategoriesModel.fromJson(json);
}

/// @nodoc
mixin _$CategoriesModel {
  List<String> get categoryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoriesModelCopyWith<CategoriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesModelCopyWith<$Res> {
  factory $CategoriesModelCopyWith(
          CategoriesModel value, $Res Function(CategoriesModel) then) =
      _$CategoriesModelCopyWithImpl<$Res, CategoriesModel>;
  @useResult
  $Res call({List<String> categoryName});
}

/// @nodoc
class _$CategoriesModelCopyWithImpl<$Res, $Val extends CategoriesModel>
    implements $CategoriesModelCopyWith<$Res> {
  _$CategoriesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoriesModelImplCopyWith<$Res>
    implements $CategoriesModelCopyWith<$Res> {
  factory _$$CategoriesModelImplCopyWith(_$CategoriesModelImpl value,
          $Res Function(_$CategoriesModelImpl) then) =
      __$$CategoriesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> categoryName});
}

/// @nodoc
class __$$CategoriesModelImplCopyWithImpl<$Res>
    extends _$CategoriesModelCopyWithImpl<$Res, _$CategoriesModelImpl>
    implements _$$CategoriesModelImplCopyWith<$Res> {
  __$$CategoriesModelImplCopyWithImpl(
      _$CategoriesModelImpl _value, $Res Function(_$CategoriesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
  }) {
    return _then(_$CategoriesModelImpl(
      categoryName: null == categoryName
          ? _value._categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoriesModelImpl implements _CategoriesModel {
  _$CategoriesModelImpl({required final List<String> categoryName})
      : _categoryName = categoryName;

  factory _$CategoriesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoriesModelImplFromJson(json);

  final List<String> _categoryName;
  @override
  List<String> get categoryName {
    if (_categoryName is EqualUnmodifiableListView) return _categoryName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryName);
  }

  @override
  String toString() {
    return 'CategoriesModel(categoryName: $categoryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesModelImpl &&
            const DeepCollectionEquality()
                .equals(other._categoryName, _categoryName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categoryName));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesModelImplCopyWith<_$CategoriesModelImpl> get copyWith =>
      __$$CategoriesModelImplCopyWithImpl<_$CategoriesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoriesModelImplToJson(
      this,
    );
  }
}

abstract class _CategoriesModel implements CategoriesModel {
  factory _CategoriesModel({required final List<String> categoryName}) =
      _$CategoriesModelImpl;

  factory _CategoriesModel.fromJson(Map<String, dynamic> json) =
      _$CategoriesModelImpl.fromJson;

  @override
  List<String> get categoryName;
  @override
  @JsonKey(ignore: true)
  _$$CategoriesModelImplCopyWith<_$CategoriesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
