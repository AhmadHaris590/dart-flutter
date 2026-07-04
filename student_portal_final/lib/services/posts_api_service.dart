import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:student_portal_final/models/post.dart';

// Real API topic:
// This class talks to JSONPlaceholder using the http package.
// It demonstrates GET, POST, PUT, and DELETE.
class PostsApiService {
  final Uri postsUri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(postsUri);

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch posts: ${response.statusCode}');
    }

    final List<dynamic> decoded = jsonDecode(response.body) as List<dynamic>;

    return decoded
        .map((item) => Post.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<Post> createPost() async {
    final response = await http.post(
      postsUri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': 1,
        'title': 'Student Portal Practice',
        'body': 'This post was created from Flutter http.post.',
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create post: ${response.statusCode}');
    }

    return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<Post> updatePost() async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id': 1,
        'userId': 1,
        'title': 'Updated title',
        'body': 'This post was updated from Flutter http.put.',
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update post: ${response.statusCode}');
    }

    return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<void> deletePost() async {
    final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete post: ${response.statusCode}');
    }
  }
}
