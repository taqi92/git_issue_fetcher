
part of 'issue_bloc.dart';

@immutable
abstract class IssueEvent extends Equatable {
  const IssueEvent();

  @override
  List<Object?> get props => [];
}

class GetOpenIssuesEvent extends IssueEvent {
  final int page;

  const GetOpenIssuesEvent(this.page);

  @override
  List<Object?> get props => [page];
}
