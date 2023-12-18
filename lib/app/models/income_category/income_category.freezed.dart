// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryIncome _$CategoryIncomeFromJson(Map<String, dynamic> json) {
  return _CategoryIncome.fromJson(json);
}

/// @nodoc
mixin _$CategoryIncome {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryIncomeCopyWith<CategoryIncome> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryIncomeCopyWith<$Res> {
  factory $CategoryIncomeCopyWith(
          CategoryIncome value, $Res Function(CategoryIncome) then) =
      _$CategoryIncomeCopyWithImpl<$Res, CategoryIncome>;
  @useResult
  $Res call({String id, String name, String icon, int color});
}

/// @nodoc
class _$CategoryIncomeCopyWithImpl<$Res, $Val extends CategoryIncome>
    implements $CategoryIncomeCopyWith<$Res> {
  _$CategoryIncomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryIncomeImplCopyWith<$Res>
    implements $CategoryIncomeCopyWith<$Res> {
  factory _$$CategoryIncomeImplCopyWith(_$CategoryIncomeImpl value,
          $Res Function(_$CategoryIncomeImpl) then) =
      __$$CategoryIncomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String icon, int color});
}

/// @nodoc
class __$$CategoryIncomeImplCopyWithImpl<$Res>
    extends _$CategoryIncomeCopyWithImpl<$Res, _$CategoryIncomeImpl>
    implements _$$CategoryIncomeImplCopyWith<$Res> {
  __$$CategoryIncomeImplCopyWithImpl(
      _$CategoryIncomeImpl _value, $Res Function(_$CategoryIncomeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? color = null,
  }) {
    return _then(_$CategoryIncomeImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryIncomeImpl implements _CategoryIncome {
  _$CategoryIncomeImpl(this.id, this.name, this.icon, this.color);

  factory _$CategoryIncomeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryIncomeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String icon;
  @override
  final int color;

  @override
  String toString() {
    return 'CategoryIncome(id: $id, name: $name, icon: $icon, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryIncomeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, icon, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryIncomeImplCopyWith<_$CategoryIncomeImpl> get copyWith =>
      __$$CategoryIncomeImplCopyWithImpl<_$CategoryIncomeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryIncomeImplToJson(
      this,
    );
  }
}

abstract class _CategoryIncome implements CategoryIncome {
  factory _CategoryIncome(final String id, final String name, final String icon,
      final int color) = _$CategoryIncomeImpl;

  factory _CategoryIncome.fromJson(Map<String, dynamic> json) =
      _$CategoryIncomeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get icon;
  @override
  int get color;
  @override
  @JsonKey(ignore: true)
  _$$CategoryIncomeImplCopyWith<_$CategoryIncomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
