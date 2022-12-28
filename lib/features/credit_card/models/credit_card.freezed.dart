// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'credit_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreditCard _$CreditCardFromJson(Map<String, dynamic> json) {
  return _CreditCard.fromJson(json);
}

/// @nodoc
mixin _$CreditCard {
  int get id => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get masked_number => throw _privateConstructorUsedError;
  DateTime get expiry_date => throw _privateConstructorUsedError;
  String get cvv => throw _privateConstructorUsedError;
  String get holder => throw _privateConstructorUsedError;
  bool get is_default => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditCardCopyWith<CreditCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCardCopyWith<$Res> {
  factory $CreditCardCopyWith(
          CreditCard value, $Res Function(CreditCard) then) =
      _$CreditCardCopyWithImpl<$Res, CreditCard>;
  @useResult
  $Res call(
      {int id,
      String token,
      String masked_number,
      DateTime expiry_date,
      String cvv,
      String holder,
      bool is_default});
}

/// @nodoc
class _$CreditCardCopyWithImpl<$Res, $Val extends CreditCard>
    implements $CreditCardCopyWith<$Res> {
  _$CreditCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? token = null,
    Object? masked_number = null,
    Object? expiry_date = null,
    Object? cvv = null,
    Object? holder = null,
    Object? is_default = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      masked_number: null == masked_number
          ? _value.masked_number
          : masked_number // ignore: cast_nullable_to_non_nullable
              as String,
      expiry_date: null == expiry_date
          ? _value.expiry_date
          : expiry_date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cvv: null == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as String,
      holder: null == holder
          ? _value.holder
          : holder // ignore: cast_nullable_to_non_nullable
              as String,
      is_default: null == is_default
          ? _value.is_default
          : is_default // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreditCardCopyWith<$Res>
    implements $CreditCardCopyWith<$Res> {
  factory _$$_CreditCardCopyWith(
          _$_CreditCard value, $Res Function(_$_CreditCard) then) =
      __$$_CreditCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String token,
      String masked_number,
      DateTime expiry_date,
      String cvv,
      String holder,
      bool is_default});
}

/// @nodoc
class __$$_CreditCardCopyWithImpl<$Res>
    extends _$CreditCardCopyWithImpl<$Res, _$_CreditCard>
    implements _$$_CreditCardCopyWith<$Res> {
  __$$_CreditCardCopyWithImpl(
      _$_CreditCard _value, $Res Function(_$_CreditCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? token = null,
    Object? masked_number = null,
    Object? expiry_date = null,
    Object? cvv = null,
    Object? holder = null,
    Object? is_default = null,
  }) {
    return _then(_$_CreditCard(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      masked_number: null == masked_number
          ? _value.masked_number
          : masked_number // ignore: cast_nullable_to_non_nullable
              as String,
      expiry_date: null == expiry_date
          ? _value.expiry_date
          : expiry_date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cvv: null == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as String,
      holder: null == holder
          ? _value.holder
          : holder // ignore: cast_nullable_to_non_nullable
              as String,
      is_default: null == is_default
          ? _value.is_default
          : is_default // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreditCard implements _CreditCard {
  _$_CreditCard(
      {required this.id,
      required this.token,
      required this.masked_number,
      required this.expiry_date,
      required this.cvv,
      required this.holder,
      required this.is_default});

  factory _$_CreditCard.fromJson(Map<String, dynamic> json) =>
      _$$_CreditCardFromJson(json);

  @override
  final int id;
  @override
  final String token;
  @override
  final String masked_number;
  @override
  final DateTime expiry_date;
  @override
  final String cvv;
  @override
  final String holder;
  @override
  final bool is_default;

  @override
  String toString() {
    return 'CreditCard(id: $id, token: $token, masked_number: $masked_number, expiry_date: $expiry_date, cvv: $cvv, holder: $holder, is_default: $is_default)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreditCard &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.masked_number, masked_number) ||
                other.masked_number == masked_number) &&
            (identical(other.expiry_date, expiry_date) ||
                other.expiry_date == expiry_date) &&
            (identical(other.cvv, cvv) || other.cvv == cvv) &&
            (identical(other.holder, holder) || other.holder == holder) &&
            (identical(other.is_default, is_default) ||
                other.is_default == is_default));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, token, masked_number,
      expiry_date, cvv, holder, is_default);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreditCardCopyWith<_$_CreditCard> get copyWith =>
      __$$_CreditCardCopyWithImpl<_$_CreditCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreditCardToJson(
      this,
    );
  }
}

abstract class _CreditCard implements CreditCard {
  factory _CreditCard(
      {required final int id,
      required final String token,
      required final String masked_number,
      required final DateTime expiry_date,
      required final String cvv,
      required final String holder,
      required final bool is_default}) = _$_CreditCard;

  factory _CreditCard.fromJson(Map<String, dynamic> json) =
      _$_CreditCard.fromJson;

  @override
  int get id;
  @override
  String get token;
  @override
  String get masked_number;
  @override
  DateTime get expiry_date;
  @override
  String get cvv;
  @override
  String get holder;
  @override
  bool get is_default;
  @override
  @JsonKey(ignore: true)
  _$$_CreditCardCopyWith<_$_CreditCard> get copyWith =>
      throw _privateConstructorUsedError;
}
