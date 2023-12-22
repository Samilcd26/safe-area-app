// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get message => throw _privateConstructorUsedError;
  @HiveField(2)
  int get from => throw _privateConstructorUsedError;
  @HiveField(3)
  int get to => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get sendDate => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get seeDate => throw _privateConstructorUsedError;
  @HiveField(6)
  bool get isSend => throw _privateConstructorUsedError;
  @HiveField(7)
  bool get isSee => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) then) =
      _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String message,
      @HiveField(2) int from,
      @HiveField(3) int to,
      @HiveField(4) DateTime sendDate,
      @HiveField(5) DateTime seeDate,
      @HiveField(6) bool isSend,
      @HiveField(7) bool isSee});
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? from = null,
    Object? to = null,
    Object? sendDate = null,
    Object? seeDate = null,
    Object? isSend = null,
    Object? isSee = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
      sendDate: null == sendDate
          ? _value.sendDate
          : sendDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      seeDate: null == seeDate
          ? _value.seeDate
          : seeDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSend: null == isSend
          ? _value.isSend
          : isSend // ignore: cast_nullable_to_non_nullable
              as bool,
      isSee: null == isSee
          ? _value.isSee
          : isSee // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageModelImplCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$MessageModelImplCopyWith(
          _$MessageModelImpl value, $Res Function(_$MessageModelImpl) then) =
      __$$MessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String message,
      @HiveField(2) int from,
      @HiveField(3) int to,
      @HiveField(4) DateTime sendDate,
      @HiveField(5) DateTime seeDate,
      @HiveField(6) bool isSend,
      @HiveField(7) bool isSee});
}

/// @nodoc
class __$$MessageModelImplCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$MessageModelImpl>
    implements _$$MessageModelImplCopyWith<$Res> {
  __$$MessageModelImplCopyWithImpl(
      _$MessageModelImpl _value, $Res Function(_$MessageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? from = null,
    Object? to = null,
    Object? sendDate = null,
    Object? seeDate = null,
    Object? isSend = null,
    Object? isSee = null,
  }) {
    return _then(_$MessageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
      sendDate: null == sendDate
          ? _value.sendDate
          : sendDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      seeDate: null == seeDate
          ? _value.seeDate
          : seeDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSend: null == isSend
          ? _value.isSend
          : isSend // ignore: cast_nullable_to_non_nullable
              as bool,
      isSee: null == isSee
          ? _value.isSee
          : isSee // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveTypes.messageModelId)
class _$MessageModelImpl extends _MessageModel {
  _$MessageModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.message,
      @HiveField(2) required this.from,
      @HiveField(3) required this.to,
      @HiveField(4) required this.sendDate,
      @HiveField(5) required this.seeDate,
      @HiveField(6) required this.isSend,
      @HiveField(7) required this.isSee})
      : super._();

  factory _$MessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String message;
  @override
  @HiveField(2)
  final int from;
  @override
  @HiveField(3)
  final int to;
  @override
  @HiveField(4)
  final DateTime sendDate;
  @override
  @HiveField(5)
  final DateTime seeDate;
  @override
  @HiveField(6)
  final bool isSend;
  @override
  @HiveField(7)
  final bool isSee;

  @override
  String toString() {
    return 'MessageModel(id: $id, message: $message, from: $from, to: $to, sendDate: $sendDate, seeDate: $seeDate, isSend: $isSend, isSee: $isSee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.sendDate, sendDate) ||
                other.sendDate == sendDate) &&
            (identical(other.seeDate, seeDate) || other.seeDate == seeDate) &&
            (identical(other.isSend, isSend) || other.isSend == isSend) &&
            (identical(other.isSee, isSee) || other.isSee == isSee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, message, from, to, sendDate, seeDate, isSend, isSee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      __$$MessageModelImplCopyWithImpl<_$MessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageModelImplToJson(
      this,
    );
  }
}

abstract class _MessageModel extends MessageModel {
  factory _MessageModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String message,
      @HiveField(2) required final int from,
      @HiveField(3) required final int to,
      @HiveField(4) required final DateTime sendDate,
      @HiveField(5) required final DateTime seeDate,
      @HiveField(6) required final bool isSend,
      @HiveField(7) required final bool isSee}) = _$MessageModelImpl;
  _MessageModel._() : super._();

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$MessageModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get message;
  @override
  @HiveField(2)
  int get from;
  @override
  @HiveField(3)
  int get to;
  @override
  @HiveField(4)
  DateTime get sendDate;
  @override
  @HiveField(5)
  DateTime get seeDate;
  @override
  @HiveField(6)
  bool get isSend;
  @override
  @HiveField(7)
  bool get isSee;
  @override
  @JsonKey(ignore: true)
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
