import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final int coins;

  const TopBar({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 左侧菜单按钮
          _buildMenuButton(),
          
          // 右侧金币显示
          _buildCoinsDisplay(),
        ],
      ),
    );
  }

  Widget _buildMenuButton() {
    return GestureDetector(
      onTap: () {
        // TODO: 打开侧边菜单
        debugPrint('打开菜单');
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Icon(
          Icons.menu_rounded,
          color: Color(0xFF2D3436),
          size: 24,
        ),
      ),
    );
  }

  Widget _buildCoinsDisplay() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3CD),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFFFE69C),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 金币图标
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD93D),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.attach_money,
              color: Color(0xFFB8860B),
              size: 16,
            ),
          ),
          const SizedBox(width: 8),
          // 金币数量
          Text(
            coins.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB8860B),
            ),
          ),
        ],
      ),
    );
  }
}
