class AppNetworkConstants {
  AppNetworkConstants._();

  static const baseURL =
      "https://marathaweds-service.herokuapp.com";
  static const loginURL = '$baseURL/users/login';
  static const listURL = 'https://reqres.in/api/users?page=2';

  //Methods
  static const get = 'get';
  static const post = 'post';
  static const put = 'put';
  static const delete = 'delete';
  static const image = 'image';
}
