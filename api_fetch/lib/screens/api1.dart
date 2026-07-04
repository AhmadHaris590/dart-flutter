import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api1 extends StatelessWidget {
  Api1({super.key});

  Future<List?> getPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      print('Total posts: ${data.length}');
      // print('First post title: ${data[0]}');
      return data;
    }
  }

  Future<void> createPost() async {
    try {
      Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/");
      final data = await http.post(
        uri,
        headers: {'content-Type': 'application/json'},
        body: jsonEncode({
          'userId': 20,
          'id': 500,
          'title': 'khuzaima bhrwa',
          'body': 'piyali gayi tut',
        }),
      );
      if (data.statusCode == 201) {
        print('Created: ${jsonDecode(data.body)}');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updatePost() async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id': 1,
        'title': 'Updated',
        'body': 'New content',
        'userId': 1,
      }),
    );
    if (response.statusCode == 200) {
      print('Updated: ${jsonDecode(response.body)}');
    }
  }

  Future<void> deletePost() async {
    final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    );
    if (response.statusCode == 200) {
      print('Deleted!');
    }
  }

  Future<int> dataLength() async {
    List? data = await getPosts();

    return data!.length;
  }

  String? keera;

  void ShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Item'),
          content: Text("Are you sure want to delete this post"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    keera = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: keera != null
          ? AppBar(
              title: Text("$keera"),
              centerTitle: true,
              elevation: 7,
              backgroundColor: Colors.indigo[200],
            )
          : null,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPosts(),
              builder: (context, snapshot) {
                List data = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text("${data[index]["id"]}"),
                      title: Text(
                        data[index]["title"],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                          // fontStyle: FontStyle.italic
                          letterSpacing: 1.0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      subtitle: Text(
                        data[index]["body"],
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Icon(Icons.person),
                    );
                  },
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                createPost();
              },
              child: Text("Create Post"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                updatePost();
              },
              child: Text("Update Post"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                deletePost();
                ShowDialog(context);
              },
              child: Text("Delete Data"),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.perm_contact_cal)),
    );
  }
}
