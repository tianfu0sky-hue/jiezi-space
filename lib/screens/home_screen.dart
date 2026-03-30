import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../widgets/top_bar.dart';
import '../widgets/tool_bar.dart';
import '../widgets/filter_bar.dart';
import '../widgets/card_item.dart';
import '../widgets/bottom_nav.dart';
import 'side_menu_screen.dart';
import 'account_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<SpaceCard> allCards;
  late List<SpaceCard> filteredCards;
  String selectedFilter = '全部';
  int _selectedIndex = 0;
  
  final List<String> filters = ['全部', '证件', '书籍', '卡片', '头像'];

  @override
  void initState() {
    super.initState();
    allCards = MockData.getSampleCards();
    filteredCards = allCards;
  }

  void _applyFilter(String filter) {
    setState(() {
      selectedFilter = filter;
      if (filter == '全部') {
        filteredCards = allCards;
      } else {
        filteredCards = allCards.where((card) => card.category == filter).toList();
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    if (index == 1) {
      // 中间添加按钮
      _showAddModal();
    } else if (index == 2) {
      // 我的页面
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AccountScreen()),
      );
    }
  }

  void _showAddModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '添加物品',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D3436),
              ),
            ),
            const SizedBox(height: 24),
            _buildAddOption(
              icon: Icons.photo_camera,
              title: '拍照',
              subtitle: '拍摄新的物品照片',
              color: const Color(0xFF00B894),
            ),
            _buildAddOption(
              icon: Icons.photo_library,
              title: '从相册选择',
              subtitle: '选择现有照片',
              color: const Color(0xFF6C5CE7),
            ),
            _buildAddOption(
              icon: Icons.qr_code_scanner,
              title: '扫描识别',
              subtitle: '扫描证件或卡片',
              color: const Color(0xFFFF7675),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildAddOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(icon, color: color, size: 26),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2D3436),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFFA0A0A0),
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: Color(0xFFB2BEC3),
        size: 24,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            // 顶部栏（渐变背景 + 菜单 + 金币）
            TopBar(
              coins: 2393,
              onMenuTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SideMenuScreen()),
                );
              },
              onCoinsTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AccountScreen()),
                );
              },
            ),
            
            // 工具栏图标
            const ToolBar(),
            
            // 筛选栏
            FilterBar(
              filters: filters,
              selectedFilter: selectedFilter,
              onFilterSelected: _applyFilter,
            ),
            
            // 卡片网格
            Expanded(
              child: filteredCards.isEmpty
                  ? _buildEmptyState()
                  : _buildGridView(),
            ),
            
            // 总计
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                '总计 ${allCards.length}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ],
        ),
      ),
      
      // 底部导航
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildGridView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.85,
        ),
        itemCount: filteredCards.length,
        itemBuilder: (context, index) {
          return CardItem(card: filteredCards[index]);
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.folder_open_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            '暂无内容',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '点击底部 + 添加物品',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
