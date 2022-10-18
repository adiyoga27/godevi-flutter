
// class Auth {
//   static Future<User> user() async {
//     dynamic user = await storage.read('user');

//     if (user != null) {
//       return User.fromJson(user);
//     }

//     return User();
//   }

//   static Future<bool> isLogged() async {
//     String? token = storage.read('token');
//     bool isLoggedIn = token != null;

//     if (isLoggedIn) {
//       // set token to Dio
//       dio.options.headers['authorization'] = 'Bearer $token';
//     }

//     return isLoggedIn;
//   }
// }
