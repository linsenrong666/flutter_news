import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_news/pages/main/categories_widget.dart';

import '../../common/apis/api.dart';
import '../../common/entities/entities.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  late EasyRefreshController _controller; // EasyRefresh控制器

  NewsPageListResponseEntity? _newsPageList; // 新闻翻页
  NewsRecommendResponseEntity? _newsRecommend; // 新闻推荐
  List<CategoryResponseEntity>? _categories; // 分类
  List<ChannelResponseEntity>? _channels; // 频道

  String? _selCategoryCode; // 选中的分类Code

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _loadAllData();
  }

  // 读取所有数据
  _loadAllData() async {
    _categories = await NewsAPI.categories(
      cacheDisk: true,
    );
    _channels = await NewsAPI.channels(
      cacheDisk: true,
    );
    _newsRecommend = await NewsAPI.newsRecommend(
      cacheDisk: true,
    );
    _newsPageList = await NewsAPI.newsPageList(
      cacheDisk: true,
    );

    _selCategoryCode = _categories?.first.code;

    if (mounted) {
      setState(() {});
    }
  }

  // 分类菜单
  Widget _buildCategories() {
    if (_categories == null) {
      return Container();
    } else {
      return newsCategoriesWidget(
        categories: _categories!,
        selCategoryCode: _selCategoryCode!,
        onTap: (CategoryResponseEntity item) {
          _loadNewsData(item.code);
        },
      );
    }
  }

  // 拉取推荐、新闻
  _loadNewsData(
    categoryCode, {
    bool refresh = false,
  }) async {
    _selCategoryCode = categoryCode;
    _newsRecommend = await NewsAPI.newsRecommend(
      params: NewsRecommendRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );
    _newsPageList = await NewsAPI.newsPageList(
      params: NewsPageListRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );

    if (mounted) {
      setState(() {});
    }
  }

  // 抽取前先实现业务

  // 推荐阅读
  Widget _buildRecommend() {
    return Container();
  }

  // 频道
  Widget _buildChannels() {
    return Container();
  }

  // 新闻列表
  Widget _buildNewsList() {
    return Container();
  }

  // ad 广告条
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      enableControlFinishRefresh: true,
      controller: _controller,
      header: ClassicalHeader(),
      onRefresh: () async {
        await _loadNewsData(
          _selCategoryCode,
          refresh: true,
        );
        _controller.finishRefresh();
      },
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildCategories(),
            const Divider(height: 1),
            _buildRecommend(),
            const Divider(height: 1),
            _buildChannels(),
            const Divider(height: 1),
            _buildNewsList(),
            _buildEmailSubscribe(),
            const Divider(height: 1),
          ],
        ),
      ),
    );
  }
}
