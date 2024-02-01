import 'package:equatable/equatable.dart';

class Issue extends Equatable{
  final int id;
  final String title;

  const Issue({required this.id, required this.title});

  @override
  List<Object?> get props => throw [
    id,
    title
  ];
}
