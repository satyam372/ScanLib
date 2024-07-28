import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_fetch.g.dart';

@RestApi(baseUrl:"http://192.168.0.107:8080/library/")
abstract class FetchClient {
  factory FetchClient(Dio dio,{String baseUrl}) = _FetchClient;
  @GET("fetch_info.php")
  Future<List<Post>> getTasks(@Query("rollno") String rollno);
}

@JsonSerializable()
class Post {
  String rollno;
  String name;
  String department;


  Post({
    required this.rollno,
    required this.name,
    required this.department,
  });
//
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String,dynamic> toJson() => _$PostToJson(this);
}
