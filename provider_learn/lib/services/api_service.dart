class ApiService {
  String? token;

  ApiService(this.token);

  Future<String> fetchData() async {
    print(token!=null?"Calling api with token :$token":"Token not found");
    return 'Some Data';
  }
}
