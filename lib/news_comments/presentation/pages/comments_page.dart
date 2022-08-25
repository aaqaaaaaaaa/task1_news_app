import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_news_app/news_comments/presentation/manager/comments_bloc.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({
    Key? key,
    required this.title,
    required this.commentId,
    required this.description,
  }) : super(key: key);
  final String title;
  final String description;
  final int commentId;

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) =>
            CommentsBloc()..add(GetCommentsEvent(widget.commentId)),
        child: BlocBuilder<CommentsBloc, CommentsState>(
          builder: (context, state) {
            if (state is CommentsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CommentsNoDataState) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              );
            } else if (state is CommentsDataSuccessState) {
              return Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      widget.description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    padding: const EdgeInsets.all(10),
                                    child: const CircleAvatar(
                                      child: Icon(Icons.person,
                                          color: Colors.black),
                                    ),
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width /
                                                1.7),
                                    child: Text(
                                      state.list[index].name ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                state.list[index].body ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
