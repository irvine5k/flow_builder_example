import 'package:flow_builder/flow_builder.dart';
import 'package:flow_builder_example/src/common/models/book.dart';
import 'package:flow_builder_example/src/features/add_book/add_book_success_page.dart';
import 'package:flutter/material.dart';

List<Page> onGenerateAddBookPages(Book book, List<Page> pages) {
  return [
    MaterialPage<void>(child: AddBookTitleForm()),
    if (book.title != null) MaterialPage<void>(child: AddBookAuthorForm()),
  ];
}

class AddBookFlow extends StatelessWidget {
  static Route<Book> route() {
    return MaterialPageRoute(builder: (_) => AddBookFlow());
  }

  @override
  Widget build(BuildContext context) => FlowBuilder<Book>(
        state: Book(),
        onGeneratePages: (book, pages) {
          return [
            MaterialPage<void>(child: AddBookTitleForm()),
            if (book.title != null)
              MaterialPage<void>(child: AddBookAuthorForm()),
          ];
        },
        onComplete: (_) => Navigator.pushReplacement(
          context,
          AddBookSuccessPage.route(),
        ),
      );
}

class AddBookTitleForm extends StatefulWidget {
  @override
  _AddBookTitleFormState createState() => _AddBookTitleFormState();
}

class _AddBookTitleFormState extends State<AddBookTitleForm> {
  String _title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Título')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (value) => setState(() => _title = value),
                decoration: const InputDecoration(
                  labelText: 'Título',
                  hintText: 'Bela e a Fera',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _title.isNotEmpty
          ? FloatingActionButton(
              child: Icon(Icons.arrow_forward),
              onPressed: _onNextPressed,
            )
          : null,
    );
  }

  void _onNextPressed() {
    context.flow<Book>().update((profile) => profile.copyWith(title: _title));
  }
}

class AddBookAuthorForm extends StatefulWidget {
  @override
  _AddBookAuthorFormState createState() => _AddBookAuthorFormState();
}

class _AddBookAuthorFormState extends State<AddBookAuthorForm> {
  String _author = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Autor')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (value) => setState(() => _author = value),
                decoration: const InputDecoration(
                  labelText: 'Autor',
                  hintText: 'Gabrielle-Suzanne Barbot',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _author.isNotEmpty
          ? FloatingActionButton(
              child: Icon(Icons.arrow_forward),
              onPressed: _onNextPressed,
            )
          : null,
    );
  }

  void _onNextPressed() {
    context.flow<Book>().complete((book) => book.copyWith(author: _author));
  }
}
