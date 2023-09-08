import 'package:flutter/material.dart';

class Post {
  final String username;
  final String postText;
  final String? imageUrl;
  final String? videoUrl;

  Post({
    required this.username,
    required this.postText,
    this.imageUrl,
    this.videoUrl,
  });
}

class CommunityScreen extends StatelessWidget {
  CommunityScreen({Key? key}) : super(key: key); // Remove 'const' here

  // Dummy post data for demonstration
  final List<Post> postData = [
    Post(
      username: "User1",
      postText: "Hello, everyone! This is my first post in the community.",
    ),
    Post(
      username: "User1",
      postText: "Hello, everyone! This is my first post in the community.",
    ),
    Post(
      username: "User1",
      postText: "Hello, everyone! This is my first post in the community.",
    ),
    Post(
      username: "User3",
      postText: "Check out this amazing recipe I tried last night.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
      ),
      body: ListView.builder(
        itemCount: postData.length,
        itemBuilder: (context, index) {
          final post = postData[index];
          return PostWidget(post: post);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement functionality to create and share a new post
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(post.username),
            subtitle: Text(post.postText),
          ),
          if (post.imageUrl != null)
            Image.network(
              post.imageUrl!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0,
            ),
          if (post.videoUrl != null)
            VideoPlayerWidget(videoUrl: post.videoUrl!),
          if (post.imageUrl == null && post.videoUrl == null)
            Container(
              width: double.infinity,
              height: 200.0,
              color: Colors.grey, // Replace with your preferred blank box styling
              alignment: Alignment.center,
              child: const Text(
                'No Image or Video',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    // You can use a video player package like 'video_player' to display videos here
    // For this example, we're just displaying a placeholder
    return Container(
      width: double.infinity,
      height: 200.0,
      color: Colors.black,
      alignment: Alignment.center,
      child: const Text(
        'Video Player Placeholder',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CommunityScreen(),
  ));
}
