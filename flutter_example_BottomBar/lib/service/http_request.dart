import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {

    // get请求
    static Future get(String url,{Map<String, dynamic> params,Interceptor inter}) {
      return _HttpBase.request(url,params: params,inter: inter);
    }
    // post请求
    static Future post(String url,{String method = "post",Map<String,dynamic>params,Interceptor inter}) {
      return _HttpBase.request(url,params: params,inter: inter);
    }

}

class _HttpBase {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeout);
  static final Dio _dio = Dio(baseOptions);

  static Future request(String url,
      {String method = 'get',
        Map<String, dynamic> params,
        Interceptor inter}) async {

    Options options = Options(
      method: method,
    );

    List<Interceptor> inters = [];

    Interceptor dinter = InterceptorsWrapper(onRequest: (request) {
      print("请求拦截");
      return request;
    }, onResponse: (response) {
      print("响应拦截");
      return response;
    }, onError: (error) {
      print("错误拦截");
      return error;
    });

    inters.add(dinter);

    if (inter != null) {
      inters.add(inter);
    }

    _dio.interceptors.addAll(inters);

    try {
      Response response =
      await _dio.request(url, options: options, queryParameters: params);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
