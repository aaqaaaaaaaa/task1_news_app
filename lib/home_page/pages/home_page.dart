import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_news_app/check/presentation/pages/check_page.dart';
import 'package:task1_news_app/contacts/presentation/pages/contacts_page.dart';
import 'package:task1_news_app/gallery/presentation/pages/gallery_page.dart';
import 'package:task1_news_app/home_page/bloc/home_bloc.dart';
import 'package:task1_news_app/news/presentation/pages/news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  late PageController pageController;
  List<Widget> pages = [
    const NewsPage(),
    const GalleryPage(),
    const CheckPage(),
    const ContactsPage(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
    );
  }

  void onButtonPressed(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 800), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeChangeEvent(0)),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is ChangeIndexState) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('News'),
                centerTitle: true,
              ),
              body: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                allowImplicitScrolling: true,
                children: pages,
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.index,
                onTap: (index) {
                  context.read<HomeBloc>().add(HomeChangeEvent(index));
                  onButtonPressed(index);
                },
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white24,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    backgroundColor: Colors.indigo,
                    label: 'News',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book),
                    backgroundColor: Colors.indigo,
                    label: 'Gallery',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    backgroundColor: Colors.indigo,
                    label: 'Check',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    backgroundColor: Colors.indigo,
                    label: 'Contacts',
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
