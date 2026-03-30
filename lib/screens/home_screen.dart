import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../widgets/top_bar.dart';
import '../widgets/filter_bar.dart';
import '../widgets/card_item.dart';
import '../widgets/add_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<SpaceCard> allCards;
  late List<SpaceCard> filteredCards;
  String selectedFilter = '全部';
  
  final List<String> filters = ['全部', '使用中', '珍惜', '传说'];

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
        final status = filter == '使用中' 
            ? CardStatus.using 
            : filter == '珍惜' 
                ? CardStatus.rare 
                : CardStatus.legendary;
        filteredCards = allCards.where((card) => card.status == status).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FA),
      body: SafeArea(
        child: Column(
          children: [
            // 顶部栏（渐变背景 + 工具栏）
            const TopBar(coins: 2393),
            
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
          ],
        ),
      ),
      
      // 悬浮添加按钮
      floatingActionButton: const AddButton(),
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
          childAspectRatio: 0.75,
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
            Icons.folder_open,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            '暂无内容',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '点击 + 添加新的空间卡片',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
