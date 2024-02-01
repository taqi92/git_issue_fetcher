class Urls {
  static const String baseUrl = 'https://api.github.com/repos/flutter/flutter/issues';
  static String getCurrentIssues(int pageNumber) =>
      '$baseUrl?page=$pageNumber&per_page=20';
}
