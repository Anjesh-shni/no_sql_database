import 'package:flutter/material.dart';

import 'contact_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive Database"),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(child: _listView()),
        ContactForm(),
      ]),
    );
  }

  ListView _listView() {
    return ListView(
      children: [
        ListTile(
          title: Text("Name"),
          subtitle: Text("age"),
        ),
      ],
    );
  }
}
