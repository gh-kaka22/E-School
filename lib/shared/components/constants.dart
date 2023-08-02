


// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=83aa6be7b2ba4a7eb2c6090b4af48ce4

// base url : https://newsapi.org/
// method (url) : v2/everything?
// queries : q=tesla&from=2023-03-02&sortBy=publishedAt&apiKey=API_KEY


import 'package:e_school/models/timetable_model.dart';

String? token='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiY2JkNDBjZjIwNjc5Njk5YmI0MjE5ODhjYjYxNTkwMjJjMDZlMzUwNTM1ZDI3MzE3ZmNiNmVhMDhiOTJlMmQzZGYzNzkzN2M1YmZkZGZkOTEiLCJpYXQiOjE2OTA5NzI4NTUuOTc4Nzc0LCJuYmYiOjE2OTA5NzI4NTUuOTc4NzgxLCJleHAiOjE3MjI1OTUyNTUuOTcxMzUzLCJzdWIiOiIzNSIsInNjb3BlcyI6W119.tacHHkcgS6iU5gr5J3kY9PgO1OzQTbPlMa-cuGlx9b__Bby5JNlobjPbicb9FUbzwEDgL-WJWycwmdrezELgFaN2SkJN-ONvlDmRQjboI1jMkCLGXJ-VPuo7shenYu4LHnOUjIC-wtGVcuU6Eqt5TlaJtL9KFAJIhG5ZzRJjdbxMMVtP45yJfmyiNPbWwDck9LZ6H4qRVKzdN9nmD5sGgJjppUEMD2obQvvvUy2aTHh53WttLvAfjRCrE5kOnOsZOyD7fJeveS-23nP3jQrafDgava9pVH7R9hxdZnd3MKnoECBvCsLY_htJFewNZfPvD2nXR7R2tkshK9AmMdCKpG7FVxSWiJBn6bdaKA3MHAnCnyKLAhkfecrvx-jB9IIKeXwCJ9RZpr_ZKrmGa27Jl-3alCgaZekstrKf1HFfZq435GL3fxKC7q3J_EjLUXLrE8rI6LOOUJh4U4V9mJNZ6fFXyiWPgBnYBRRODFUfyNot5eVzFyrEAozxg8hVsYhOISYANRFPPYcdk4sB_VSuFXDyDA-Gk8fqVP_zZWPZ_np1GhIsrIaYeLv_7yf7jMKGa9ko2tKycHdFA4y9Cz-qGkrD8cRY_HzDQFHHqXONi2Zwjz0gSyhWuE2N4APmzc8X-c0FLQQGVsFozUuQdN_cpo7Rbg9_qPb12IAbjpAVqYI';
String? userType;
int? kidID;
String? kidName;
TimetableModel? timetableModel;

const String baseUrl= 'http://192.168.1.9:8000/';

