import 'package:flutter_test/flutter_test.dart';
import 'package:sample_to_do/models/to_do_item_model.dart';
import 'package:sample_to_do/repositories/to_do_item_repository.dart';

void main() {
  ToDoItemRepository toDoItemRepository = ToDoItemRepository.instance();

  test('should return list of toListItems', () async {
    //Note API should be mocked, test should not use real API

    List<ToDoListItem> toDoListItems =
        await toDoItemRepository.getAllToDoListItems();

    expect(toDoListItems, isNotEmpty);
  });
}
