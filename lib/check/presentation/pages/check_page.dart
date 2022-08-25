import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_news_app/check/presentation/bloc/todo_bloc.dart';
import 'package:task1_news_app/check/presentation/widgets/todo_shimmer.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[900],
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is ToDoInitial) {
            context.read<TodoBloc>().add(GetToDoDataEvent());
          } else if (state is ToDoLoadingState) {
            return const ToDosShimmerWidget();
          } else if (state is ToDoNoDataState) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            );
          } else if (state is ToDoDataSuccessState) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return Container(
                  // padding: const EdgeInsets.all(15),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: state.list[index].completed!
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    // borderRadius: BorderRadius.circular(10)),
                  ),
                  child: NotCompletedToDoWidget(
                    title: state.list[index].title,
                    completed: state.list[index].completed ?? false,
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

class NotCompletedToDoWidget extends StatelessWidget {
  const NotCompletedToDoWidget({
    Key? key,
    required this.title,
    required this.completed,
  }) : super(key: key);
  final String? title;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$title',
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      iconColor: Colors.white24,
      leading: completed
          ? const Icon(Icons.check_box)
          : const Icon(Icons.check_box_outline_blank),
    );
  }
}
//Row(
//       children: [
//         completed
//             ? const Icon(Icons.check_box)
//             : const Icon(Icons.check_box_outline_blank),
//         Container(
//           width: MediaQuery.of(context).size.width / 1.4,
//           margin: EdgeInsets.symmetric(horizontal: 10),
//           child: Text(
//             '$title',
//             maxLines: 2,
//             style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.white,
//                 overflow: TextOverflow.ellipsis),
//           ),
//         ),
//       ],
//     );
