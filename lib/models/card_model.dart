enum CardStatus {
  using,    // 使用中
  rare,     // 珍惜
  legendary // 传说
}

extension CardStatusExtension on CardStatus {
  String get label {
    switch (this) {
      case CardStatus.using:
        return '使用中';
      case CardStatus.rare:
        return '珍惜';
      case CardStatus.legendary:
        return '传说';
    }
  }

  int get color {
    switch (this) {
      case CardStatus.using:
        return 0xFF00B894;
      case CardStatus.rare:
        return 0xFFFD79A8;
      case CardStatus.legendary:
        return 0xFFFDCB6E;
    }
  }
}

class SpaceCard {
  final String id;
  final String title;
  final String imageUrl;
  final CardStatus status;
  final String? description;
  final DateTime createdAt;
  final int? order;

  SpaceCard({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.status,
    this.description,
    required this.createdAt,
    this.order,
  });

  factory SpaceCard.fromJson(Map<String, dynamic> json) {
    return SpaceCard(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      status: CardStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => CardStatus.using,
      ),
      description: json['description'],
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt']) 
          : DateTime.now(),
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'status': status.name,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'order': order,
    };
  }
}

// 示例数据
class MockData {
  static List<SpaceCard> getSampleCards() {
    return [
      SpaceCard(
        id: '1',
        title: '工作台',
        imageUrl: 'https://picsum.photos/seed/desk/300/200',
        status: CardStatus.using,
        description: '日常办公区域',
        createdAt: DateTime.now(),
        order: 1,
      ),
      SpaceCard(
        id: '2',
        title: '阅读角',
        imageUrl: 'https://picsum.photos/seed/book/300/200',
        status: CardStatus.rare,
        description: '安静的阅读空间',
        createdAt: DateTime.now(),
        order: 2,
      ),
      SpaceCard(
        id: '3',
        title: '游戏室',
        imageUrl: 'https://picsum.photos/seed/game/300/200',
        status: CardStatus.legendary,
        description: '娱乐游戏专属空间',
        createdAt: DateTime.now(),
        order: 3,
      ),
      SpaceCard(
        id: '4',
        title: '会议室',
        imageUrl: 'https://picsum.photos/seed/meeting/300/200',
        status: CardStatus.using,
        description: '团队讨论区域',
        createdAt: DateTime.now(),
        order: 4,
      ),
      SpaceCard(
        id: '5',
        title: '休息区',
        imageUrl: 'https://picsum.photos/seed/rest/300/200',
        status: CardStatus.rare,
        description: '放松休息的地方',
        createdAt: DateTime.now(),
        order: 5,
      ),
      SpaceCard(
        id: '6',
        title: '创意工作室',
        imageUrl: 'https://picsum.photos/seed/art/300/200',
        status: CardStatus.legendary,
        description: '艺术创作空间',
        createdAt: DateTime.now(),
        order: 6,
      ),
    ];
  }
}
