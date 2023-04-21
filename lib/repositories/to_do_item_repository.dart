import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_to_do/models/to_do_item_model.dart';

class ToDoItemRepository {
  final Uri toDoListUrl = Uri.https('jsonplaceholder.typicode.com', '/todos');

  static final ToDoItemRepository _toDoItemRepository =
      ToDoItemRepository._privateConstructor();

  ToDoItemRepository._privateConstructor();

  factory ToDoItemRepository.instance() => _toDoItemRepository;

  Future<ToDoListItem> createToDoListItem(ToDoListItem toDoListItem) async {
    throw UnimplementedError();
  }

  Future<ToDoListItem> getToDoListItem(int toDoListItemId) async {
    throw UnimplementedError();
  }

  Future<ToDoListItem> updateToDoListItem(ToDoListItem toDoListItem) async {
    throw UnimplementedError();
  }

  Future<void> deleteToDoListItem(ToDoListItem toDoListItem) async {
    throw UnimplementedError();
  }

  Future<List<ToDoListItem>> getAllToDoListItems() async {
    http.Response response = await http.get(toDoListUrl);

    List<ToDoListItem> toDoListItems = (jsonDecode(response.body) as List)
        .map((e) => ToDoListItem.fromJson(e))
        .toList();

    return toDoListItems;
  }
}
