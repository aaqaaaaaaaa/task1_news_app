import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_news_app/check/presentation/bloc/todo_bloc.dart';
import 'package:task1_news_app/contacts/presentation/manager/users_bloc.dart';
import 'package:task1_news_app/contacts_details/presentation/manager/contact_details_bloc.dart';
import 'package:task1_news_app/gallery/presentation/manager/gallery_bloc.dart';
import 'package:task1_news_app/gallery_photos/presentation/manager/gallery_photos_bloc.dart';
import 'package:task1_news_app/news/presentation/manager/news_bloc.dart';
import 'package:task1_news_app/news_comments/presentation/manager/comments_bloc.dart';

import 'home_page/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => NewsBloc(),
        ),
        BlocProvider(
          create: (context) => CommentsBloc(),
        ),
        BlocProvider(
          create: (context) => ContactDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => GalleryBloc(),
        ),
        BlocProvider(
          create: (context) => UsersBloc(),
        ),
        BlocProvider(
          create: (context) => TodoBloc(),
        ),
       
      ], child: const HomePage()),
    );
  }
}
