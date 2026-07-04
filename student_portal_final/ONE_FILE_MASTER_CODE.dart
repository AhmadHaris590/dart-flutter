/*
  ONE FILE MASTER CODE
  --------------------

  How to use this file:

  1. Open the Flutter project:
     student_portal_final/

  2. Copy this whole file into:
     lib/main.dart

  3. Make sure pubspec.yaml has:
     http: ^1.2.1
     provider: ^6.1.2

  4. Run:
     flutter pub get
     flutter run

  This is an alternative "everything in one file" version.
  The normal project has separate files. This file keeps the whole app,
  models, provider, API service, widgets, and notes together so you can
  study it like one master sheet.

  Think of Flutter like building with blocks:

  - main() starts the app.
  - runApp() puts the first block on the screen.
  - MaterialApp gives the app theme and navigation behavior.
  - Scaffold gives a page structure: top bar, body, floating button.
  - Widgets are screen pieces.
  - State means data that can change.
  - Provider stores shared state outside the screen.
  - API code talks to the internet.
*/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(
    // ChangeNotifierProvider gives the app one CounterBox object.
    // Any child widget can read it or listen to it.
    ChangeNotifierProvider(
      create: (context) => CounterBox(),
      child: const MasterApp(),
    ),
  );
}

/*
  MODEL CLASS

  A model class is a clean box for related data.
  Instead of separate lists for ids, titles, and bodies, we use one Post object.
*/
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // Factory constructor:
  // Takes map/API data and creates a real Post object.
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

/*
  PROVIDER CLASS

  ChangeNotifier means this object can shout:
  "My data changed, rebuild the listening widgets."
*/
class CounterBox extends ChangeNotifier {
  int _count = 0;

  // Getter lets other widgets read count safely.
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

/*
  API SERVICE CLASS

  This class talks to a real API.
  API means another computer gives us data.
  http.get asks for data.
  jsonDecode turns JSON text into Dart list/map data.
*/
class PostApiService {
  final Uri postsUri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(postsUri);

    if (response.statusCode != 200) {
      throw Exception('GET failed with status ${response.statusCode}');
    }

    final List<dynamic> decoded = jsonDecode(response.body) as List<dynamic>;

    return decoded
        .map((item) => Post.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<String> createPost() async {
    final response = await http.post(
      postsUri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': 1,
        'title': 'One file master code',
        'body': 'This was created using http.post.',
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('POST failed with status ${response.statusCode}');
    }

    final post = Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    return 'POST success: created fake post id ${post.id}';
  }

  Future<String> updatePost() async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id': 1,
        'userId': 1,
        'title': 'Updated from Flutter',
        'body': 'This was updated using http.put.',
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('PUT failed with status ${response.statusCode}');
    }

    final post = Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    return 'PUT success: ${post.title}';
  }

  Future<String> deletePost() async {
    final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    );

    if (response.statusCode != 200) {
      throw Exception('DELETE failed with status ${response.statusCode}');
    }

    return 'DELETE success: fake post removed';
  }
}

/*
  ROOT APP WIDGET

  StatelessWidget means this widget has no changing data inside it.
*/
class MasterApp extends StatelessWidget {
  const MasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One File Master Code',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MasterScreen(),
    );
  }
}

/*
  MAIN SCREEN

  StatefulWidget means this screen has changing data:
  - text field values
  - login message
  - API result message
  - Future<List<Post>>
*/
class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final PostApiService apiService = PostApiService();

  late Future<List<Post>> postsFuture;
  bool hidePassword = true;
  String loginMessage = 'Enter email and password.';
  String apiMessage = 'Tap API buttons to practice real HTTP calls.';

  @override
  void initState() {
    super.initState();
    postsFuture = apiService.fetchPosts();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submitLogin() {
    if (emailController.text.trim().isEmpty) {
      setState(() {
        loginMessage = 'Email is required.';
      });
      return;
    }

    if (passwordController.text.length < 4) {
      setState(() {
        loginMessage = 'Password must be at least 4 characters.';
      });
      return;
    }

    setState(() {
      loginMessage = 'Login success for ${emailController.text.trim()}';
    });
  }

  Future<void> runApiAction(Future<String> Function() action) async {
    setState(() {
      apiMessage = 'Calling API...';
    });

    try {
      final message = await action();

      if (!mounted) return;

      setState(() {
        apiMessage = message;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        apiMessage = 'API error: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One File Master Code'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBox>().increment();
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle('1. Login Form'),
            loginSection(),
            sectionTitle('2. Provider Counter'),
            providerSection(),
            sectionTitle('3. Real HTTP API'),
            apiSection(),
            sectionTitle('4. Widgets Gallery'),
            widgetsGallerySection(),
            sectionTitle('5. Notes'),
            notesSection(),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget loginSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: passwordController,
          obscureText: hidePassword,
          decoration: InputDecoration(
            labelText: 'Password',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              icon: Icon(
                hidePassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: submitLogin,
          child: const Text('Submit Login'),
        ),
        Text(loginMessage),
      ],
    );
  }

  Widget providerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer<CounterBox>(
          builder: (context, counterBox, child) {
            return Text('Consumer is watching count: ${counterBox.count}');
          },
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<CounterBox>().increment();
              },
              child: const Text('Increment'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                context.read<CounterBox>().reset();
              },
              child: const Text('Reset'),
            ),
          ],
        ),
        const Text(
          'Provider means shared state. notifyListeners tells Consumer to rebuild.',
        ),
      ],
    );
  }

  Widget apiSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(apiMessage),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  postsFuture = apiService.fetchPosts();
                  apiMessage = 'GET posts again.';
                });
              },
              child: const Text('GET'),
            ),
            ElevatedButton(
              onPressed: () => runApiAction(apiService.createPost),
              child: const Text('POST'),
            ),
            ElevatedButton(
              onPressed: () => runApiAction(apiService.updatePost),
              child: const Text('PUT'),
            ),
            ElevatedButton(
              onPressed: () => runApiAction(apiService.deletePost),
              child: const Text('DELETE'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 260,
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
                itemCount: 5,
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
    );
  }

  Widget widgetsGallerySection() {
    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.teal,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Row puts boxes left to right. Container is a box.'),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(width: 60, height: 60, color: Colors.indigo),
            const SizedBox(width: 8),
            Container(width: 60, height: 60, color: Colors.amber),
            const SizedBox(width: 8),
            Container(width: 60, height: 60, color: Colors.pink),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Stack puts widgets on top of each other.'),
        const SizedBox(height: 8),
        Stack(
          children: [
            Image.network(
              'https://picsum.photos/600/240',
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black87,
                child: const Text(
                  'Positioned',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('GridView makes a grid.'),
        const SizedBox(height: 8),
        SizedBox(
          height: 260,
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: [
              for (int i = 0; i < colors.length; i++)
                Container(
                  color: colors[i],
                  child: Center(
                    child: Text(
                      'Grid ${i + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget notesSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('main(): app starts here.'),
        Text('MaterialApp: app wrapper.'),
        Text('Scaffold: page skeleton.'),
        Text('TextField: input box.'),
        Text('TextEditingController: reads input text.'),
        Text('setState: rebuild this screen after local data changes.'),
        Text('Provider: stores shared data outside the screen.'),
        Text('Consumer: listens to Provider changes.'),
        Text('Future: data that comes later.'),
        Text('FutureBuilder: UI for loading/error/success async data.'),
        Text('http.get/post/put/delete: real API calls.'),
        Text('jsonDecode: turns JSON text into Dart data.'),
        Text('ListView.builder: builds list rows from data.'),
        Text('SingleChildScrollView: lets the page scroll.'),
      ],
    );
  }
}

/*
  QUICK EXERCISE
  --------------

  Build this same file again but change:

  1. Post -> Course
  2. title/body -> courseName/teacher
  3. API section -> fake Course list
  4. CounterBox -> CourseCounter
  5. Widgets gallery colors -> your own colors

  If you can rebuild this from memory, you understand the class material.
*/
