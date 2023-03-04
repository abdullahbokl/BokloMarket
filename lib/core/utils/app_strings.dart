class AppStrings {

  /// user data
  static String userToken = '';


  /// firebase
  // collections names
  static const String kUserCollection = 'users';
  static const String kCategoriesCollection = 'categories';
  static const String kProductsCollection = 'products';

  /** auth **/

  /// password controllers names
  static const String kSignInPasswordController = 'signInPasswordController';
  static const String kRegisterPasswordController =
      'registerPasswordController';
  static const String kRegisterConfirmPasswordController =
      'registerConfirmPasswordController';
  static const verifyEmail = 'Please verify your email';

  /// Hive
  static const String kOnBoardingBox = 'onBoarding';


  /// home page
  static const List<String> categories = [
    'All',
    'Electronics',
    'Fashion',
    'Home & Living',
    'Health & Beauty',
    'Phones & Tablets',
    'Groceries',
  ];

}
