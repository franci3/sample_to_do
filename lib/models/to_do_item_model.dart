import 'package:json_annotation/json_annotation.dart';

part 'to_do_item_model.g.dart';

@JsonSerializable()
class ToDoListItem {
  final int id, userId;
  final String title;
  final bool completed;

  ToDoListItem(
      {required this.id,
      required this.userId,
      required this.title,
      required this.completed});

  factory ToDoListItem.fromJson(Map<String, dynamic> json) =>
      _$ToDoListItemFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoListItemToJson(this);
}
