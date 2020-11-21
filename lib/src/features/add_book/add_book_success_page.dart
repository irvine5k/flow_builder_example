import 'package:flutter/material.dart';

import 'add_book_page.dart';

class AddBookSuccessPage extends StatelessWidget {
  static Route<bool> route() {
    return MaterialPageRoute(builder: (_) => AddBookSuccessPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: const Text('Sucesso')),
      body: Center(
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 50,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushReplacement(
          context,
          AddBookFlow.route(),
        ),
      ),
    );
  }
}
