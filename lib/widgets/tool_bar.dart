import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget {
  const ToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildToolIcon(Icons.grid_view_rounded, true),
          _buildToolIcon(Icons.add_box_rounded, false),
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
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isActive 
            ? const Color(0xFF00B894) 
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: isActive ? Colors.white : const Color(0xFFA0A0A0),
        size: 22,
      ),
    );
  }
}
