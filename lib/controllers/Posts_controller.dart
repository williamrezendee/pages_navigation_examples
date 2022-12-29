import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:pages_navigation/models/posts_model.dart';

import 'package:http/http.dart' as http;

class PostsController {
  final ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);
  final ValueNotifier<bool> inLoading = ValueNotifier<bool>(false);

  callAPI() async {
    var client = http.Client();
    try {
      inLoading.value = true;
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      var decodedResponse = jsonDecode(response.body) as List;
      posts.value = decodedResponse.map((e) => Post.fromJson(e)).toList();
      await Future.delayed(const Duration(seconds: 2));
    } finally {
      client.close();
      inLoading.value = false;
    }
  }
}
