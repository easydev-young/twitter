class User {
  final String profileImage;
  final String nickname;
  final String username;
  final bool isVerified;
  final bool isFollowed;
  final String content;
  final String time;
  final String followers;
  final String reply;
  final String mention;
  final String hashtag;

  User({
    required this.profileImage,
    required this.nickname,
    required this.username,
    required this.isVerified,
    required this.isFollowed,
    required this.content,
    required this.time,
    required this.followers,
    required this.reply,
    required this.mention,
    required this.hashtag,
  });

  User copyWith({
    String? profileImage,
    String? nickname,
    String? username,
    bool? isVerified,
    bool? isFollowed,
    String? content,
    String? time,
    String? followers,
    String? reply,
    String? mention,
    String? hashtag,
  }) {
    return User(
      profileImage: profileImage ?? this.profileImage,
      nickname: nickname ?? this.nickname,
      username: username ?? this.username,
      isVerified: isVerified ?? this.isVerified,
      isFollowed: isFollowed ?? this.isFollowed,
      content: content ?? this.content,
      time: time ?? this.time,
      followers: followers ?? this.followers,
      reply: reply ?? this.reply,
      mention: mention ?? this.mention,
      hashtag: hashtag ?? this.hashtag,
    );
  }
}

final List<User> users = [
  User(
    profileImage: 'assets/users/1.png',
    nickname: "Woody",
    username: '우디',
    isVerified: true,
    content: 'There\'s a snake in my boot!',
    time: '2m',
    followers: '26.6K followers',
    isFollowed: true,
    reply: 'The day has finally come to duel with you.',
    mention: "",
    hashtag: "",
  ),
  User(
    profileImage: 'assets/users/2.png',
    nickname: "Buzz Lightyear",
    username: '버즈 라이트이어',
    isVerified: true,
    content: '',
    time: '1h',
    followers: '780K followers',
    isFollowed: true,
    reply: "",
    mention: 'Please do not duel for the peace of the universe. @naya',
    hashtag: "",
  ),
  User(
    profileImage: 'assets/users/3.png',
    nickname: "Jessie",
    username: '제시',
    isVerified: true,
    content: 'Yodel-ay-hee-hoo!',
    time: '7h',
    followers: '935K followers',
    isFollowed: true,
    reply: "",
    mention: "I believe Woody will survive the duel. haha @naya",
    hashtag: "",
  ),
  User(
    profileImage: 'assets/users/4.png',
    nickname: "Rex",
    username: '렉스',
    isVerified: true,
    content: 'I don\'t like confrontations!',
    time: '1d',
    followers: '789K followers',
    isFollowed: false,
    reply: "",
    mention: "",
    hashtag: "🌟 #Rex🦖 #Toy Story",
  ),
  User(
    profileImage: 'assets/users/5.png',
    nickname: "Hamm",
    username: '햄',
    isVerified: false,
    content: 'Alright, nobody look till I get my cork back in.',
    time: '2h',
    followers: '500M followers',
    isFollowed: false,
    reply: "",
    mention: "",
    hashtag: "🐷 #Hamm #Toy Story",
  ),
  User(
    profileImage: 'assets/users/6.png',
    nickname: "Slinky Dog",
    username: '슬링키 독',
    isVerified: true,
    content: 'Well, I may not be a smart dog, but I know what roadkill is.',
    time: '2h',
    followers: '69.2K followers',
    isFollowed: true,
    reply: "",
    mention: "",
    hashtag: "🐶🐾 #Slinky Dog #Toy Story",
  ),
  User(
    profileImage: 'assets/users/8.jpeg',
    nickname: "Prospector",
    username: '프로스펙터',
    isVerified: false,
    content: '⛏️ Specialized in treasure hunting! The adventure continues!',
    time: '2h',
    followers: '234K followers',
    isFollowed: false,
    reply: "",
    mention: "",
    hashtag: "🌟 #Prospector #Toy Story",
  ),
  User(
    profileImage: 'assets/users/9.jpeg',
    nickname: "Mr. Potato Head",
    username: '미스터 포테이토 헤드(',
    isVerified: false,
    content: '🥔 Mr. Potato appears! Have fun by changing parts!',
    time: '2h',
    followers: '59.3K followers',
    isFollowed: false,
    reply: "",
    mention: "",
    hashtag: "😎 #Mr. Potato #Toy Story",
  ),
  User(
    profileImage: 'assets/users/10.webp',
    nickname: "Bo Peep",
    username: '보 핍',
    isVerified: true,
    content: '🐑 It\'s Bo Peep! loves adventure!',
    time: '2h',
    followers: '900K followers',
    isFollowed: false,
    reply: "",
    mention: "",
    hashtag: "💖 #Bo Peep #Toy Story",
  ),
  User(
    profileImage: 'assets/users/11.webp',
    nickname: "Wheezy",
    username: '위지',
    isVerified: false,
    content: "🐧 Hello, I'm Wheezy the Singing Penguin!",
    time: '2h',
    followers: '100K followers',
    isFollowed: false,
    reply: "",
    mention: "",
    hashtag: "🎤💙 #Wheezy #singing penguin",
  ),
];
