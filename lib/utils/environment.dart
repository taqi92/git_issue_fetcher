enum Environment {
  STAGING,
  PRODUCTION,
}

const Environment activeProfile = Environment.PRODUCTION;

String getBaseUrl() {
  switch (activeProfile) {
    case Environment.STAGING:
      return "https://api.github.com/repos";

    case Environment.PRODUCTION:
      return "https://api.github.com/repos";
  }
}

enum HttpMethod {
  GET,
  POST,
  PUT,
}

