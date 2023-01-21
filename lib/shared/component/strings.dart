import '../helper/shared_preferences.dart';

//////Font Family///////
String demi = "demi";

////////////////////CashHelper////////////////////
String cashHelperDarkKey= "isDark";
bool cashHelperDarkValue = CacheHelper.getData(key: cashHelperDarkKey);

String cashHelperOnBoardingKey= "onBoarding";
bool? cashHelperOnBoardingValue = CacheHelper.getData(key: cashHelperOnBoardingKey);

String cashHelperUserNameKey= "userName";
String?  cashHelperUserNameValue = CacheHelper.getData(key: cashHelperUserNameKey);

String cashHelperUserPhoneKey= "userPhone";
String?  cashHelperUserPhoneValue = CacheHelper.getData(key: cashHelperUserPhoneKey);


////////////////////AppStrings////////////////////
String appName = "A R I A M";
String? userName = cashHelperUserNameValue;
String? userPhone = cashHelperUserPhoneValue;



////////////////////categories list////////////////////
String crochet = "Crochet";
String bouquet = "Bouquet";
String planner = "Concert Planner";
String accessories = "Accessories";


////////////////////Firebase Firestore Keys////////////////////
String adminKey = "admin";
String productsKey = "products";

String userKey = "users";
String userStateKey = "user";