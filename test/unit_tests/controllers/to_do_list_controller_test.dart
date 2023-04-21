import 'package:flutter_test/flutter_test.dart';
import 'package:sample_to_do/controllers/to_do_list_controller.dart';
import 'package:sample_to_do/models/to_do_item_model.dart';

void main() {
  ToDoListController toDoListController = ToDoListController();

  test('should fetch list of toDos', () async {
    await toDoListController.fetchToDoList();
    expect(toDoListController.toDoList, isNotEmpty);
  });

  test('should remove item from list of toDos', () async {
    ToDoListItem toDoListItem = ToDoListItem(
        id: 4, userId: 1, title: 'et porro tempora', completed: true);

    await toDoListController.fetchToDoList();
    toDoListController.removeToDoListItem(toDoListItem);
    expect(toDoListController.toDoList.contains(toDoListItem), isFalse);
  });

  test('should add item to list of toDos', () async {
    ToDoListItem toDoListItem =
        ToDoListItem(userId: 1, title: 'Test', completed: true);
    await toDoListController.fetchToDoList();
    toDoListController.addToDoListItem(toDoListItem);
    expect(toDoListController.toDoList.contains(toDoListItem), isTrue);
  });

  test('should update item in list of toDos', () async {
    ToDoListItem oldToDoListItem = ToDoListItem(
        id: 4, userId: 1, title: 'et porro tempora', completed: true);
    ToDoListItem newToDoListItem =
        ToDoListItem(id: 4, userId: 1, title: 'test', completed: true);
    await toDoListController.fetchToDoList();
    toDoListController.updateToDoListItem(newToDoListItem);
    expect(toDoListController.toDoList.contains(newToDoListItem), isTrue);
    expect(toDoListController.toDoList.contains(oldToDoListItem), isFalse);
  });
}
