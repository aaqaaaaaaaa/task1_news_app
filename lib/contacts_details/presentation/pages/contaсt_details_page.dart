import 'package:flutter/material.dart';
import 'package:task1_news_app/contacts/data/models/users_model.dart';

import '../widgets/text_field_widget.dart';

class ContactDetailsPage extends StatefulWidget {
  const ContactDetailsPage({
    Key? key,
    required this.model,
  }) : super(key: key);
  final UsersModel model;

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController webSiteCon = TextEditingController();
  TextEditingController companyCon = TextEditingController();
  TextEditingController addressCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailCon.text = widget.model.email ?? '';
    phoneCon.text = widget.model.phone ?? '';
    webSiteCon.text = widget.model.website ?? '';
    companyCon.text = widget.model.company?.name ?? '';
    addressCon.text = widget.model.address?.street ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        title: Text(widget.model.name ?? ''),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 80,
              height: 80,
              child: CircleAvatar(
                child: Icon(Icons.person, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Text(
                widget.model.name ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              widget.model.email ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              controller: emailCon,
              label: 'E-mail',
            ),
            TextFieldWidget(
              controller: phoneCon,
              label: 'Phone number',
            ),
            TextFieldWidget(
              controller: webSiteCon,
              label: 'Website',
            ),
            TextFieldWidget(
              controller: companyCon,
              label: 'Company',
            ),
            TextFieldWidget(
              controller: addressCon,
              label: 'Address',
            ),
          ],
        ),
      ),
    );
  }
}
