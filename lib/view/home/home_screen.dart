import 'package:assignment_4/view/add_task/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widget/widget.dart';
import 'data_list_provider.dart';

class MyHomePage extends  StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Consumer(
            builder: (context, ref, child) {
              final data = ref.watch(todoList);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  data.isEmpty
                      ? const Center(child: Text("No Todo list"))
                      : Expanded(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                onDismissed: (direction) async {
                                  ref.read(todoList.notifier).remove(data[index]);
                                },
                                key: UniqueKey(),
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return FractionallySizedBox(
                                          heightFactor: 0.8,
                                          child: AddTaskScreen(
                                            data: UpdateData(
                                              index: index,
                                              title: data[index].title,
                                              description: data[index].description,
                                              homeScreen: true,
                                              taskStatus: data[index].status,
                                              flag:data[index].flag
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Card(
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Tile(data: data,index: index,),

                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () async {
                                                  ref.read(todoList.notifier).remove(data[index]);
                                                },
                                                icon: const Icon(Icons.delete_outline_rounded),
                                              ),
                                              Checkbox(
                                                value: data[index].flag,
                                                onChanged: (value)  {
                                                  ref.read(todoList.notifier).updateStatus(index,value!);
                                                },
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const FractionallySizedBox(
                heightFactor: 0.8,
                child: AddTaskScreen(),
              );
            },
          );
        },
        child: const Icon(Icons.add_task_rounded),
      ),
    );
  }
}
