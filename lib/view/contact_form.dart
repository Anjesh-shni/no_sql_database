import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:no_sql_database/model/contact_model.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final formkey = GlobalKey<FormState>();

  String? _name;
  String? _age;

  void addToContact(Contact contact) {
    print('name:${contact.name}, Age:${contact.age}');
    Hive.box('contact').add(contact);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "name"),
                    keyboardType: TextInputType.name,
                    onSaved: (value) => _name = value!,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Age"),
                    keyboardType: TextInputType.number,
                    onSaved: (value) => _age = value!,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                formkey.currentState!.save();
                final newContact = Contact(_name!, int.parse(_age!));
                addToContact(newContact);
              },
              child: const Text("Add to Contact")),
        ],
      ),
    );
  }
}
