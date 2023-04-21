import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_to_do/controllers/to_do_list_controller.dart';
import 'package:sample_to_do/models/to_do_item_model.dart';

class ToDoListScreen extends StatelessWidget {
  const ToDoListScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(title),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () => addListItem(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
          future: context.read<ToDoListController>().fetchToDoList(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const ToDoListGridView();
            }
          }),
    );
  }

  void addListItem(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          TextEditingController textEditingController = TextEditingController();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Add To Do',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                        color: Colors.grey.shade200,
                        child: const Text('Add'),
                        onPressed: () {
                          final ToDoListItem newToDoListItem = ToDoListItem(
                              userId: 1, title: title, completed: false);
                          context
                              .read<ToDoListController>()
                              .addToDoListItem(newToDoListItem);
                          Navigator.pop(context);
                        })
                  ],
                )
              ],
            ),
          );
        });
  }
}

class ToDoListGridView extends StatelessWidget {
  const ToDoListGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ToDoListItem> toDoListItems =
        context.watch<ToDoListController>().toDoList;
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) => ToDoListCard(
            key: const Key('to_do_list_card'), item: toDoListItems[index]));
  }
}

class ToDoListCard extends StatelessWidget {
  ToDoListCard({Key? key, required this.item}) : super(key: key);
  ToDoListItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: item.completed ? Colors.grey.shade200 : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      item.completed = !item.completed;
                      context
                          .read<ToDoListController>()
                          .updateToDoListItem(item);
                    },
                    icon: Icon(item.completed
                        ? Icons.done_all
                        : Icons.check_box_outline_blank)),
                IconButton(
                    onPressed: () {
                      context
                          .read<ToDoListController>()
                          .removeToDoListItem(item);
                    },
                    icon: const Icon(Icons.delete_outline))
              ],
            )
          ],
        ),
      ),
    );
  }
}
