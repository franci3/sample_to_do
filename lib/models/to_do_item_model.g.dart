// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDoListItem _$ToDoListItemFromJson(Map<String, dynamic> json) => ToDoListItem(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$ToDoListItemToJson(ToDoListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'completed': instance.completed,
    };
