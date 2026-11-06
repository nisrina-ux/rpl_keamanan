import '../models/post.dart';

/// Abstraksi repository untuk mengelola data Post.
abstract class PostRepository {
  /// Mengambil daftar semua post dari sumber data.
  Future<List<Post>> getPosts();
}