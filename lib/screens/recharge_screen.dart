import 'package:flutter/material.dart';

class RechargeScreen extends StatefulWidget {
  const RechargeScreen({super.key});

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  int selectedAmount = 98;

  final List<Map<String, dynamic>> rechargeOptions = [
    {'coins': 1, 'price': 100},
    {'coins': 6, 'price': 600},
    {'coins': 12, 'price': 1200},
    {'coins': 50, 'price': 5000},
    {'coins': 98, 'price': 9800},
    {'coins': 298, 'price': 29800},
  ];

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
                      '充值',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3436),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 充值金额选择
                    _buildRechargeGrid(),
                    
                    const SizedBox(height: 24),
                    
                    // 充值说明
                    _buildRechargeInstructions(),
                  ],
                ),
              ),
            ),
            
            // 底部充值按钮
            _buildBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildRechargeGrid() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '我要充值',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D3436),
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.3,
            ),
            itemCount: rechargeOptions.length,
            itemBuilder: (context, index) {
              final option = rechargeOptions[index];
              final isSelected = selectedAmount == option['price'];
              
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAmount = option['price'];
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? const Color(0xFFE8F8F5) 
                        : const Color(0xFFF5F7FA),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected 
                          ? const Color(0xFF00B894) 
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFD700),
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${option['coins']}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3436),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '¥${option['price']}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      if (isSelected) ...[
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Color(0xFF00B894),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRechargeInstructions() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '充值说明：',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D3436),
            ),
          ),
          const SizedBox(height: 12),
          _buildInstructionItem('1. 您在 iOS 端充值的资金，无法在非 iOS 端内使用。'),
          _buildInstructionItem('2. 充值未完成时，请不要切换账号或卸载 APP，请等待充值结束，否则可能出现资金无法到账的情况。若出现此类状况，请联系客服。'),
          _buildInstructionItem('3. 充值成功后不可提现，如需退款请联系客服。'),
          _buildInstructionItem('4. 未成年请在监护人明确许可以及陪同下进行操作。'),
          _buildInstructionItem('5. APP Store 目前已支持绑定微信支付或支付宝支付。'),
          _buildInstructionItem('6. 在 iOS 端领取的兑换券，只能在 iOS 端使用无法在非 iOS 端内使用。'),
        ],
      ),
    );
  }

  Widget _buildInstructionItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey[600],
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF00B894),
                    Color(0xFF00D9F5),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(
                child: Text(
                  '¥ $selectedAmount 立即充值',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {},
              child: const Text(
                '查看充值服务协议',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF00B894),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
