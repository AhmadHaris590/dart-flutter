import 'package:flutter_test/flutter_test.dart';
import 'package:student_portal_final/models/post.dart';
import 'package:student_portal_final/providers/counter_provider.dart';

void main() {
  test('CounterProvider increments, decrements, and resets', () {
    final counter = CounterProvider();

    expect(counter.count, 0);

    counter.increment();
    expect(counter.count, 1);

    counter.decrement();
    expect(counter.count, 0);

    counter.increment();
    counter.reset();
    expect(counter.count, 0);
  });

  test('Post.fromJson creates a post model from API data', () {
    final post = Post.fromJson({
      'userId': 1,
      'id': 10,
      'title': 'Hello',
      'body': 'Body text',
    });

    expect(post.userId, 1);
    expect(post.id, 10);
    expect(post.title, 'Hello');
    expect(post.body, 'Body text');
  });
}
