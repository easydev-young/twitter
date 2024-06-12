class Post {
  final String profileImage;
  final String username;
  final bool isVerified;
  final String content;
  final num replies;
  final num likes;
  final String time;
  final List<String> images;
  final List<String> repliers;

  Post({
    required this.profileImage,
    required this.username,
    required this.isVerified,
    required this.content,
    required this.replies,
    required this.likes,
    required this.time,
    required this.images,
    required this.repliers,
  });
}

final List<Post> posts = [
  Post(
    profileImage: 'assets/users/1.png',
    username: 'Woody',
    isVerified: true,
    content: 'There\'s a snake in my boot!',
    replies: 2,
    likes: 4,
    time: '2m',
    images: [],
    repliers: [
      'assets/users/2.png',
      'assets/users/3.png',
    ],
  ),
  Post(
    profileImage: 'assets/users/2.png',
    username: 'Buzz Lightyear',
    isVerified: true,
    content: '',
    replies: 3,
    likes: 631,
    time: '1h',
    images: [
      'assets/posts/9.png',
      'assets/posts/10.png',
      'assets/posts/11.png',
    ],
    repliers: [
      'assets/users/3.png',
      'assets/users/4.png',
      'assets/users/5.png',
    ],
  ),
  Post(
    profileImage: 'assets/users/5.png',
    username: 'Hamm',
    isVerified: false,
    content: 'Alright, nobody look till I get my cork back in.',
    replies: 2,
    likes: 450,
    time: '2h',
    images: [],
    repliers: [
      'assets/users/3.png',
      'assets/users/4.png',
    ],
  ),
  Post(
    profileImage: 'assets/users/6.png',
    username: 'Slinky Dog',
    isVerified: false,
    content: 'Well, I may not be a smart dog, but I know what roadkill is.',
    replies: 1,
    likes: 450,
    time: '2h',
    images: [],
    repliers: [
      'assets/users/3.png',
    ],
  ),
  Post(
    profileImage: 'assets/users/3.png',
    username: 'Jessie',
    isVerified: true,
    content: 'Yodel-ay-hee-hoo!',
    replies: 5,
    likes: 74,
    time: '7h',
    images: [
      'assets/posts/1.png',
      'assets/posts/3.png',
      'assets/posts/2.png',
    ],
    repliers: [
      'assets/users/1.png',
      'assets/users/2.png',
      'assets/users/3.png',
      'assets/users/4.png',
    ],
  ),
  Post(
    profileImage: 'assets/users/4.png',
    username: 'Rex',
    isVerified: true,
    content: 'I don\'t like confrontations!',
    replies: 1,
    likes: 300,
    time: '1d',
    images: [
      'assets/posts/5.png',
    ],
    repliers: [
      'assets/users/1.png',
    ],
  ),
];
