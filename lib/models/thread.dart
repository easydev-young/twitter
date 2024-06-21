class Thread {
  final String profileImage;
  final String username;
  final String time;
  final String content;
  final String reProfileImage;
  final String reUsername;
  final String reTime;
  final String reContent;
  final bool isThread;
  final bool isReply;
  final Post post;

  Thread({
    required this.profileImage,
    required this.username,
    required this.time,
    required this.content,
    required this.reProfileImage,
    required this.reUsername,
    required this.reTime,
    required this.reContent,
    required this.isThread,
    required this.isReply,
    required this.post,
  });
}

class Post {
  final String profileImage;
  final String username;
  final bool isVerified;
  final String content;
  final List<String> images;

  Post({
    required this.profileImage,
    required this.username,
    required this.isVerified,
    required this.content,
    required this.images,
  });
}

final List<Thread> threads = [
  Thread(
    profileImage: 'assets/users/7.png',
    username: 'naya_dev',
    time: '1h',
    content: 'There\'s a snake in my boot!',
    reProfileImage: '',
    reUsername: '',
    reTime: '',
    reContent: '',
    isThread: true,
    isReply: false,
    post: Post(
      profileImage: 'assets/users/2.png',
      username: 'Buzz Lightyear',
      isVerified: true,
      content: 'Alright, nobody look till I get my cork back in.',
      images: [
        'assets/posts/9.png',
      ],
    ),
  ),
  Thread(
    profileImage: 'assets/users/7.png',
    username: 'naya_dev',
    time: '1h',
    content: 'There\'s a snake in my boot!',
    reProfileImage: '',
    reUsername: '',
    reTime: '',
    reContent: '',
    isThread: true,
    isReply: false,
    post: Post(
      profileImage: 'assets/users/2.png',
      username: 'Buzz Lightyear',
      isVerified: true,
      content: 'Alright, nobody look till I get my cork back in.',
      images: [
        'assets/posts/9.png',
      ],
    ),
  ),
  Thread(
    profileImage: 'assets/users/7.png',
    username: 'naya_dev',
    time: '1h',
    content: 'I don\'t fight.',
    reProfileImage: '',
    reUsername: '',
    reTime: '',
    reContent: '',
    isThread: true,
    isReply: false,
    post: Post(
      profileImage: 'assets/users/1.png',
      username: 'Woody',
      isVerified: true,
      content: 'The day has finally come to duel with you.',
      images: [],
    ),
  ),
  Thread(
    profileImage: 'assets/users/7.png',
    username: 'naya_dev',
    time: '1h',
    content: 'There\'s a snake in my boot!',
    reProfileImage: '',
    reUsername: '',
    reTime: '',
    reContent: '',
    isThread: true,
    isReply: false,
    post: Post(
      profileImage: 'assets/users/2.png',
      username: 'Buzz Lightyear',
      isVerified: true,
      content: 'Alright, nobody look till I get my cork back in.',
      images: [
        'assets/posts/9.png',
      ],
    ),
  ),
  Thread(
    profileImage: 'assets/users/4.png',
    username: 'Rex',
    time: '1h',
    content: 'I don\'t like confrontations!',
    reProfileImage: 'assets/users/7.png',
    reUsername: 'naya_dev',
    reTime: '2m',
    reContent: 'Alright.',
    isThread: false,
    isReply: true,
    post: Post(
      profileImage: 'assets/users/2.png',
      username: 'Jessie',
      isVerified: true,
      content: 'Yodel-ay-hee-hoo!',
      images: [
        'assets/posts/3.png',
      ],
    ),
  ),
  Thread(
    profileImage: 'assets/users/10.webp',
    username: 'Bo Peep',
    time: '1h',
    content: '🐑 It\'s Bo Peep! loves adventure!',
    reProfileImage: 'assets/users/7.png',
    reUsername: 'naya_dev',
    reTime: '9m',
    reContent: 'Hello.',
    isThread: false,
    isReply: true,
    post: Post(
      profileImage: 'assets/users/4.png',
      username: 'Rex',
      isVerified: true,
      content: 'I don\'t like confrontations!',
      images: [
        'assets/posts/5.png',
      ],
    ),
  ),
];
