import 'package:dartz/dartz.dart';

import '../entities/issue.dart';
import '../repositories/issue_repository.dart';

class IssueUseCase {

  final IssueRepository repository;

  IssueUseCase(this.repository);

  Future<Either<String, List<Issue>>> execute(int page) async {
    return await repository.getOpenIssues(page);
  }
}
