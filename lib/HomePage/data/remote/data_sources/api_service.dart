import 'package:get/get.dart';

///Service class for API Calls
class ApiService extends GetConnect{
  Future<Response> getFeeds() async {
    print("ApiService - getFeeds Called");
    return await get('https://hiit.ria.rocks/videos_api/cdn/com.rstream.crafts?versionCode=40&lurl=Canvas%20painting%20ideas');
  }
  Future<Response> getComments() async {
    print("ApiService - getComments Called");
    return await get('http://cookbookrecipes.in/test.php');
  }

}