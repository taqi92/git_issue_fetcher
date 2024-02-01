
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/issue.dart';
import '../../domain/repositories/issue_repository.dart';
import '../../domain/use_case/issue_use_case.dart';

part 'issue_event.dart';
part 'issue_state.dart';

class IssueBloc extends Bloc<IssueEvent, IssueState> {

  //final IssueRepository repository;
  final IssueUseCase _issueUseCase;

  IssueBloc(this._issueUseCase) : super(IssueInitial());

  @override
  Stream<IssueState> mapEventToState(IssueEvent event) async* {
    if (event is GetOpenIssuesEvent) {
      yield IssueLoading();
      final result = await _issueUseCase.execute(event.page);
      yield result.fold(
            (error) => IssueError(error),
            (issues) => IssueLoaded(issues),
      );
    }
  }
}
