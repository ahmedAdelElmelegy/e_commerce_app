class Api {
  static String getUrl({required String endPoint}) {
    String url = 'https://student.valuxapps.com/api/${endPoint}';
    return url;
  }
}
