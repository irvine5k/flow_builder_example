import 'package:equatable/equatable.dart';

class Book extends Equatable {
  const Book({
    this.title,
    this.author,
  });

  final String title;
  final String author;

  Book copyWith({
    String title,
    String author,
  }) {
    return Book(
      title: title ?? this.title,
      author: author ?? this.author,
    );
  }

  @override
  List<Object> get props => [title, author];
}
