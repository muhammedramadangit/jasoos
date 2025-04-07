abstract class Endpoints{
  static const String SOCIAL_AUTH = "social-auth";
  static const String REGISTER = "register";
  static const String OTP = "verify";
  static const String CATEGORIES = "categories";
  static const String SELECT_CATEGORIES = "assign-categories";
  static const String LOGIN = "login";
  static const String PROFILE = "profile";
  static const String UPDATE_PROFILE = "profile/update";
  static const String UPDATE_PROFILE_IMAGE = "profile/update-image";
  static const String UPDATE_PROFILE_ID = "profile/update-identification";
  static const String FORGET_PASSWORD = "forget-password";
  static const String RESET_PASSWORD = "reset-password";
  static const String CHANGE_PASSWORD = "profile/change-password";
  static const String UPDATE_BANK_ACCOUNT = "profile/update-bank-account";

  static const String HOME_CATEGORIES = "task-types";
  static const String RECENT_TASKS = "tasks";
  static const String MY_TASKS = "tasks";
  static const String MY_TASKS_STATUS = "task-statuses";
  static String TASK_DETAILS(int id) => "tasks/$id";
  static String START_TASK(int id) => "tasks/start/$id";
  static String TASK_QUESTIONS(int id) => "tasks/$id/questions";
  static String SUBMIT_ANSWER({int? taskSubmission, int? questionId}) => "taskSubmission/$taskSubmission/questions/$questionId/submit";
  static const String SHOPS = "shops";
  static String SHOPS_DETAILS(int id) => "shops/$id";
  static String POLICY = "privacy";
  static String TERMS = "terms";
  static String HELP = "faqs";
  static String DELETE_ACCOUNT = "delete-account/";
}