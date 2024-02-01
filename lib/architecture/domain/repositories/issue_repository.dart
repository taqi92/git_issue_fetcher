
import 'package:dartz/dartz.dart';

import '../entities/issue.dart';

abstract class IssueRepository {
  Future<Either<String, List<Issue>>> getOpenIssues(int page);
}
