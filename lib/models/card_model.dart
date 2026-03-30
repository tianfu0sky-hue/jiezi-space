import 'package:flutter/material.dart';

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

  Color get color {
    switch (this) {
      case CardStatus.using:
        return const Color(0xFF00B894);
      case CardStatus.rare:
        return const Color(0xFFFF7675);
      case CardStatus.legendary:
        return const Color(0xFFFFA502);
    }
  }
}

class SpaceCard {
  final String id;
  final String title;
  final String imageUrl;
  final CardStatus status;
  final String category;
  final String? description;
  final int quantity;
  final DateTime createdAt;

  SpaceCard({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.status,
    required this.category,
    this.description,
    this.quantity = 1,
    required this.createdAt,
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
      category: json['category'] ?? '全部',
      description: json['description'],
      quantity: json['quantity'] ?? 1,
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt']) 
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'status': status.name,
      'category': category,
      'description': description,
      'quantity': quantity,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

// 示例数据
class MockData {
  static List<SpaceCard> getSampleCards() {
    return [
      SpaceCard(
        id: '1',
        title: '静心',
        imageUrl: 'https://picsum.photos/seed/book1/300/300',
        status: CardStatus.using,
        category: '书籍',
        description: '心理学相关书籍',
        quantity: 10,
        createdAt: DateTime.now(),
      ),
      SpaceCard(
        id: '2',
        title: '学生证',
        imageUrl: 'https://picsum.photos/seed/card1/300/300',
        status: CardStatus.using,
        category: '证件',
        quantity: 1,
        createdAt: DateTime.now(),
      ),
      SpaceCard(
        id: '3',
        title: '头像',
        imageUrl: 'https://picsum.photos/seed/avatar1/300/300',
        status: CardStatus.rare,
        category: '头像',
        quantity: 10,
        createdAt: DateTime.now(),
      ),
      SpaceCard(
        id: '4',
        title: '头像',
        imageUrl: 'https://picsum.photos/seed/avatar2/300/300',
        status: CardStatus.rare,
        category: '卡片',
        quantity: 10,
        createdAt: DateTime.now(),
      ),
      SpaceCard(
        id: '5',
        title: '小风扇',
        imageUrl: 'https://picsum.photos/seed/fan/300/300',
        status: CardStatus.using,
        category: '书籍',
        description: '便携式小风扇',
        quantity: 10,
        createdAt: DateTime.now(),
      ),
      SpaceCard(
        id: '6',
        title: '证书',
        imageUrl: 'https://picsum.photos/seed/cert/300/300',
        status: CardStatus.legendary,
        category: '证件',
        quantity: 1,
        createdAt: DateTime.now(),
      ),
    ];
  }
}
