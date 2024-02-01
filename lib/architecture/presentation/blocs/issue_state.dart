
part of 'issue_bloc.dart';

@immutable
abstract class IssueState extends Equatable {
  const IssueState();

  @override
  List<Object?> get props => [];
}

class IssueInitial extends IssueState {}

class IssueLoading extends IssueState {}

class IssueLoaded extends IssueState {
  final List<Issue> issues;

  IssueLoaded(this.issues);

  @override
  List<Object?> get props => [issues];
}

class IssueError extends IssueState {
  final String message;

  IssueError(this.message);

  @override
  List<Object?> get props => [message];
}
