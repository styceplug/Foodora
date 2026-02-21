class AppConstants {
  static const String APP_NAME = "Foodora";
  static const String VERSION = "1.0.0";
  
  static const String BASE_URL = '';

  //TOKEN
  static const authToken = 'authToken';
  static const header = 'header';
  static const String lastVersionCheck = 'lastVersionCheck';

  static const String PUT_DEVICE_TOKEN = '/api/v1/user/device-tokens';





  
    static String getPngAsset(String image) {
    return 'assets/images/$image.png';
  }
  static String getGifAsset(String image) {
    return 'assets/gifs/$image.gif';
  }
}
