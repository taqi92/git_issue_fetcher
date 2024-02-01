import 'package:equatable/equatable.dart';

class Issue extends Equatable{
  final int id;
  final String title;
  final String body;

  const Issue({required this.id, required this.title, required this.body});

  @override
  List<Object?> get props => throw [
    id,
    title,
    body
  ];
}
