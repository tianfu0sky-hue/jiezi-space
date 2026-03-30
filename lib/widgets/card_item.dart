import 'package:flutter/material.dart';
import '../models/card_model.dart';

class CardItem extends StatelessWidget {
  final SpaceCard card;

  const CardItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 卡片图片
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                card.imageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFF0F2F5),
                    child: const Icon(
                      Icons.image_outlined,
                      size: 40,
                      color: Color(0xFFB2BEC3),
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: const Color(0xFFF0F2F5),
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        strokeWidth: 2,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF00B894),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          
          // 卡片内容
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 标题
                  Text(
                    card.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D3436),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 4),
                  
                  // 描述
                  if (card.description != null && card.description!.isNotEmpty)
                    Expanded(
                      child: Text(
                        card.description!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFFA0A0A0),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  
                  const SizedBox(height: 8),
                  
                  // 状态标签
                  _buildStatusBadge(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color badgeColor;
    Color badgeBgColor;
    String statusText;
    
    switch (card.status) {
      case CardStatus.using:
        badgeColor = const Color(0xFF00B894);
        badgeBgColor = const Color(0xFFE8F8F5);
        statusText = '使用中';
        break;
      case CardStatus.rare:
        badgeColor = const Color(0xFFFF7675);
        badgeBgColor = const Color(0xFFFFEBEB);
        statusText = '珍惜';
        break;
      case CardStatus.legendary:
        badgeColor = const Color(0xFFFFA502);
        badgeBgColor = const Color(0xFFFFF3E0);
        statusText = '传说';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: badgeBgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: badgeColor,
          width: 1,
        ),
      ),
      child: Text(
        statusText,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: badgeColor,
        ),
      ),
    );
  }
}
