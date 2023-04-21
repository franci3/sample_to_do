import 'package:flutter/material.dart';
import 'package:sample_to_do/models/to_do_item_model.dart';
import 'package:sample_to_do/repositories/to_do_item_repository.dart';

class ToDoListController extends ChangeNotifier {
  List<ToDoListItem> _toDoListItems = [];
  final ToDoItemRepository toDoItemRepository = ToDoItemRepository.instance();

  List<ToDoListItem> get toDoList => _toDoListItems;

  Future<void> fetchToDoList() async {
    await toDoItemRepository
        .getAllToDoListItems()
        .then((List<ToDoListItem> items) {
      _toDoListItems = items;
      notifyListeners();
    });
  }

  void removeToDoListItem(ToDoListItem toDoListItem) {
    _toDoListItems.removeWhere((ToDoListItem elementToRemove) =>
        elementToRemove.id == toDoListItem.id);
    notifyListeners();
  }

  void addToDoListItem(ToDoListItem toDoListItem) {
    _toDoListItems.add(toDoListItem);
    notifyListeners();
  }

  void updateToDoListItem(ToDoListItem toDoListItem) {
    int indexOfItem = _toDoListItems
        .indexWhere((ToDoListItem element) => element.id == toDoListItem.id);
    _toDoListItems[indexOfItem] = toDoListItem;
    notifyListeners();
  }
}
