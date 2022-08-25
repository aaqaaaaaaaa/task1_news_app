import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_news_app/contacts/presentation/widgets/users_item_shimmer.dart';
import 'package:task1_news_app/contacts_details/presentation/pages/conta%D1%81t_details_page.dart';

import '../manager/users_bloc.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[900],
      child: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersInitial) {
            context.read<UsersBloc>().add(GetUsersDataEvent());
          }
          if (state is UsersLoadingState) {
            return const UsersShimmerWidget();
          } else if (state is UsersNoDataState) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            );
          } else if (state is UsersDataSuccessState) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ContactDetailsPage(model: state.list[index]),
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration:
                        const BoxDecoration(color: Colors.transparent),
                    child: UsersItemWidget(
                      title: state.list[index].name,
                    ),
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

class UsersItemWidget extends StatelessWidget {
  const UsersItemWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String? title;

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
      leading: const Icon(Icons.person),
    );
  }
}
