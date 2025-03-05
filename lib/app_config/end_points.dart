abstract class Endpoints{
  static const String SOCIAL_AUTH = "social-auth";
  static const String REGISTER = "register";
  static const String OTP = "verify";
  static const String CATEGORIES = "categories";
  static const String SELECT_CATEGORIES = "assign-categories";
  static const String LOGIN = "login";
  static const String FORGET_PASSWORD = "forget-password";
  static const String RESET_PASSWORD = "reset-password";

  static const String HOME_CATEGORIES = "task-types";
  static const String RECENT_TASKS = "tasks";
  static const String GOING_TASKS = "tasks/ongoing";
  static const String COMPLETED_TASKS = "tasks/completed";
  static String TASK_DETAILS(int id) => "tasks/$id";
  static const String SHOPS = "shops";
  static String SHOPS_DETAILS(int id) => "shops/$id";
}