import 'package:json_annotation/json_annotation.dart';

part 'to_do_item_model.g.dart';

@JsonSerializable()
class ToDoListItem {
  int? id;
  int userId;
  String title;
  bool completed;

  ToDoListItem(
      {this.id,
      required this.userId,
      required this.title,
      required this.completed});

  factory ToDoListItem.fromJson(Map<String, dynamic> json) =>
      _$ToDoListItemFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoListItemToJson(this);
}
