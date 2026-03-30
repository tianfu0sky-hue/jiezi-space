import 'package:flutter/material.dart';

class RechargeHistoryScreen extends StatelessWidget {
  const RechargeHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            // 顶部导航栏
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                      color: Color(0xFF2D3436),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      '充值记录',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3436),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 40),
                  const Icon(
                    Icons.refresh_rounded,
                    color: Color(0xFF2D3436),
                    size: 22,
                  ),
                ],
              ),
            ),
            
            // 充值记录列表
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      _buildRechargeItem('支付宝充值', '+ 100.00', '2025-10-31 08:10:26'),
                      const Divider(height: 1, indent: 20),
                      _buildRechargeItem('支付宝充值', '+ 100.00', '2025-10-31 08:10:26'),
                      const Divider(height: 1, indent: 20),
                      _buildRechargeItem('支付宝充值', '+ 100.00', '2025-10-31 08:10:26'),
                      const Divider(height: 1, indent: 20),
                      _buildRechargeItem('支付宝充值', '+ 100.00', '2025-10-31 08:10:26'),
                    ],
                  ),
                ),
              ),
            ),
            
            // 底部提示
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                '没有更多啦~',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRechargeItem(String title, String amount, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2D3436),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF00B894),
            ),
          ),
        ],
      ),
    );
  }
}
