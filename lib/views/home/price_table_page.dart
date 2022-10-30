import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/extensions.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';

final _categoryListKo = [
  "티셔츠/맨투맨",
  "셔츠/블라우스",
  "바지",
  "원피스",
  "치마",
];
final _partListKo = [
  [
    "소매기장 줄임",
    "전체팔통 줄임",
    "어깨길이 줄임",
    "전체품 줄임",
    "총기장 줄임",
    "부속품 찢김, 수선",
  ],
  [
    "소매기장 줄임",
    "전체팔통 줄임",
    "어깨길이 줄임",
    "전체품 줄임",
    "총기장 줄임",
    "어깨패드 추가/제거/교체",
    "부속품 찢김, 수선",
  ],
  [
    "허리/힙 줄임",
    "전체통 줄임",
    "밑위 줄임",
    "기장 줄임",
    "부분통 줄임",
    "지퍼 교체",
    "부속품 찢김, 수선",
  ],
  [
    "소매기장 줄임",
    "전체팔통 줄임",
    "어깨길이 줄임",
    "전체품 줄임",
    "총기장 줄임",
    "부속품 찢김, 수선",
  ],
  [
    "허리/힙 줄임",
    "전체통 줄임",
    "기장 줄임",
    "부분통 줄임",
    "부속품 찢김, 수선",
  ],
];
final _prices = [
  [7500, 7500, 9500, 8000, 10000, 3000],
  [14500, 14500, 14500, 14500, 11500, 7500, 3000],
  [14500, 14500, 14500, 5500, 12500, 11500, 3000],
  [14500, 14500, 14500, 17500, 14500, 3000],
  [14500, 14500, 14500, 14500, 3000],
];

class PriceTablePage extends StatefulWidget {
  const PriceTablePage({super.key});

  static const route = "/home/price";

  @override
  State<PriceTablePage> createState() => _PriceTablePageState();
}

class _PriceTablePageState extends State<PriceTablePage>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "수선 가격표"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              tabs: _categoryListKo
                  .map(
                    (e) => Tab(
                      child: Text(
                        e,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  for (int i = 0; i < _categoryListKo.length; i++)
                    PriceList(categoryIndex: i),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PriceList extends StatelessWidget {
  final int categoryIndex;

  const PriceList({
    super.key,
    required this.categoryIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < _partListKo[categoryIndex].length; i++)
          PriceListTile(
            categoryIndex: categoryIndex,
            partIndex: i,
          ),
      ],
    );
  }
}

class PriceListTile extends StatelessWidget {
  final int categoryIndex;
  final int partIndex;

  const PriceListTile({
    super.key,
    required this.categoryIndex,
    required this.partIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 92,
            height: 92,
            decoration: const BoxDecoration(
              color: lightGreyBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: CustomCachedImage(
              width: 56,
              height: 56,
              path: "icons/order_category/$categoryIndex/$partIndex.png",
            ),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _partListKo[categoryIndex][partIndex],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "${_prices[categoryIndex][partIndex].toFormatted()} ~",
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
