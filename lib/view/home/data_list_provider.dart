import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/list_model.dart';

final todoList = StateNotifierProvider<TodoDataList, List<TodoItem>>((ref) => TodoDataList());

class TodoDataList extends StateNotifier<List<TodoItem>> {
  TodoDataList()
      : super([]);


  void addList(TodoItem data) {
    state.insert(0,data);
    log(state.length.toString());
    state = [...state];
  }

  void remove(TodoItem data) {
    state.remove(data);
    state = [...state];
  }

  void updateItem(TodoItem data,int index) {
    state.removeAt(index);
    state.insert(index,data);
    log(state.length.toString());
    state = [...state];
  }

  void updateStatus(int index,bool value) {

    if(value){
      state[index].flag=value;
      state[index].status=TaskStatus.completed;
    }else{
      state[index].flag=value;
      state[index].status=TaskStatus.pending;
    }

    log(state.length.toString());
    state = [...state];
  }
}
/*[
          TodoItem(
              title: "Water the plants",
              description:
                  " are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are ",
              status: TaskStatus.completed,
              flag: true),
          TodoItem(
              title: "Pay the monthly bills",
              description:
                  "h for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, so",
              status: TaskStatus.pending,
              flag: false),
          TodoItem(
              title: "Plan a weekend getaway",
              description:
                  " a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
              status: TaskStatus.completed,
              flag: true),
        ]*/