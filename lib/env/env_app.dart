abstract class EnvApp {
  static const title = String.fromEnvironment('APP_TITLE', defaultValue: 'Github Top 10 Repo');
}
