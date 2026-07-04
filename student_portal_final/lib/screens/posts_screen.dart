import 'package:flutter/material.dart';
import 'package:student_portal_final/models/post.dart';
import 'package:student_portal_final/services/posts_api_service.dart';

// Real HTTP API screen.
// It uses FutureBuilder for GET and buttons for POST, PUT, DELETE.
class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final PostsApiService apiService = PostsApiService();
  late Future<List<Post>> postsFuture;
  String actionMessage = 'Use buttons below to call POST, PUT, or DELETE.';

  @override
  void initState() {
    super.initState();
    postsFuture = apiService.fetchPosts();
  }

  Future<void> runApiAction(Future<String> Function() action) async {
    setState(() {
      actionMessage = 'Calling API...';
    });

    try {
      final message = await action();

      if (!mounted) return;

      setState(() {
        actionMessage = message;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        actionMessage = 'API error: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Real API')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              actionMessage,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    postsFuture = apiService.fetchPosts();
                    actionMessage = 'GET posts again.';
                  });
                },
                child: const Text('GET'),
              ),
              ElevatedButton(
                onPressed: () {
                  runApiAction(() async {
                    final post = await apiService.createPost();
                    return 'POST created post id ${post.id}.';
                  });
                },
                child: const Text('POST'),
              ),
              ElevatedButton(
                onPressed: () {
                  runApiAction(() async {
                    final post = await apiService.updatePost();
                    return 'PUT updated: ${post.title}';
                  });
                },
                child: const Text('PUT'),
              ),
              ElevatedButton(
                onPressed: () {
                  runApiAction(() async {
                    await apiService.deletePost();
                    return 'DELETE finished successfully.';
                  });
                },
                child: const Text('DELETE'),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: FutureBuilder<List<Post>>(
              future: postsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No posts found'));
                }

                final posts = snapshot.data!;

                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];

                    return ListTile(
                      leading: CircleAvatar(child: Text('${post.id}')),
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
