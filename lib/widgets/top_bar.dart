import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final int coins;

  const TopBar({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF00F5A0),
            Color(0xFF00D9F5),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // 顶部状态栏区域
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 左侧菜单按钮
                  _buildMenuButton(),
                  // 右侧金币显示
                  _buildCoinsDisplay(),
                ],
              ),
            ),
            // 工具栏图标
            _buildToolBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.menu_rounded,
        color: Colors.white,
        size: 24,
      ),
    );
  }

  Widget _buildCoinsDisplay() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 金币图标
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD700),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.star_rounded,
              color: Color(0xFFB8860B),
              size: 14,
            ),
          ),
          const SizedBox(width: 6),
          // 金币数量
          Text(
            coins.toString(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB8860B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildToolIcon(Icons.grid_view_rounded, true),
          _buildToolIcon(Icons.add_circle_outline_rounded, false),
          _buildToolIcon(Icons.text_fields_rounded, false),
          _buildToolIcon(Icons.book_rounded, false),
          _buildToolIcon(Icons.credit_card_rounded, false),
          _buildToolIcon(Icons.view_list_rounded, false),
          _buildToolIcon(Icons.search_rounded, false),
        ],
      ),
    );
  }

  Widget _buildToolIcon(IconData icon, bool isActive) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: isActive 
            ? const Color(0xFF00B894) 
            : Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: isActive ? Colors.white : Colors.white,
        size: 24,
      ),
    );
  }
}
