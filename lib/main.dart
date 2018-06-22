import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
//  debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('企鹅电竞布局实战篇一'),
        ),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return index == 0 ? buildHeader() : buildContent(index);
          },
          itemCount: 3,
        ),
      ),
    );
  }
}

///构建内容头
Widget buildHeader() {
  return new Container(
    alignment: Alignment.topLeft,
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //布局轮播图区域,本篇只讲简单的布局,不做轮播图介绍
        //设置宽度最大,高度150像素,裁剪方式:居中裁剪
        new Image.asset(
          'images/lake.jpg',
          width: double.infinity,
          height: 126.6,
          fit: BoxFit.cover,
        ),
        _buildReminder(),
        _buildRecommendList(),
      ],
    ),
  );
}

///构建提醒区域
Widget _buildReminder() {
  return new Row(
    children: <Widget>[
      ///赛季标题,日期,预订数据量
      ///提醒区域内容介绍部分：
      ///上方:标题,下方:日期+预定数据量
      new Container(
        //设置容器内部边距
        padding: const EdgeInsets.fromLTRB(15.3, 10.0, 0.0, 2.0),
        child: new Column(
          //小部件左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: new Text(
                'LPL夏季赛-SNG vs LGD',
                textAlign: TextAlign.left,
                style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 12.0,
                ),
              ),
            ),
            new Container(
              //设置日期区域距离标题的间距
              padding: const EdgeInsets.only(top: 10.0),
              child: new Text(
                '06月16日 14:00 | 2599人已预定',
                textAlign: TextAlign.left,
                style: new TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: 10.0),
              ),
            ),
          ],
        ),
      ),

      ///预订按钮区域
      new Container(
        //设置容器边距
        padding: const EdgeInsets.only(top: 21.0, left: 20.0),
        child: new Container(
          //容器中小部件居中
          alignment: Alignment.center,
          //设置小部件距离容器的边距
          padding: const EdgeInsets.fromLTRB(14.0, 7.0, 14.0, 7.0),
          //设置装饰器
          decoration: new BoxDecoration(
            //设置边界
            border: new Border.all(
              color: Colors.black38,
              width: 1.0,
            ),
            //设置边界半径
            borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
          ),
          child: new Row(
            //按钮和预订文字水平排列显示
            children: <Widget>[
              new Icon(Icons.timer, color: Colors.black38, size: 12.0),
              new Text(
                "预订",
                style: new TextStyle(fontSize: 13.0),
              )
            ],
          ),
        ),
      ),

      ///分割线
      new Container(
        //设置外边距
        margin: const EdgeInsets.only(left: 9.0),
        color: const Color.fromARGB(255, 233, 233, 233),
        width: 1.0,
        height: 35.6,
      ),

      ///视频总数据量区域,用Expanded来强制填充剩余空间
      ///因为我们不知道具体剩余空间是多少
      new Expanded(
        child: new Container(
          padding: const EdgeInsets.only(top: 11.0),
          child: new Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'images/iconvideo.png',
                  height: 22.3,
                  fit: BoxFit.cover,
                ),
                new Text(
                  '共1046个视频',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(color: Colors.black54),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}

///构建推荐列表
Widget _buildRecommendList() {
  Widget buildUserInfo(String assetName, String listLabel, String roomName) {
    return new Container(
      padding: const EdgeInsets.only(top: 13.3, left: 11.0, right: 20.0),
      child: new Row(
        children: <Widget>[
          new Container(
            //外边距,如果用padding的话头像会变形
            margin: new EdgeInsets.symmetric(horizontal: 10.0),
            //需要定容器宽高,否则CircleAvatar裁剪出来的图片很小
            width: 40.6,
            height: 40.6,
            //添加一个边框
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(
                  width: 1.0,
                  color: Colors.yellow,
                )),
            child: new CircleAvatar(
              radius: 5.0,
              //AssetBundleImageProvider
              backgroundImage: new AssetImage(
                assetName,
              ),
            ),
          ),
          new Column(
            //垂直列表内部小部件左对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(top: 5.0, bottom: 3.0),
                child: new Text(
                  listLabel,
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              new Text(
                roomName,
                style: new TextStyle(color: Colors.black38, fontSize: 13.6),
              ),
            ],
          )
        ],
      ),
    );
  }

  //构建用户列表分割线
  Widget buildVerticalLine() {
    return new Container(
      width: 1.0,
      color: const Color.fromARGB(255, 233, 233, 233),
      margin: const EdgeInsets.only(top: 13.6, bottom: 16.0),
    );
  }

  return new Container(
    //注意:不设置高度,会显示不出来
    height: 70.6,
    child: new ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        buildUserInfo("images/chenghe.jpeg", '吸金榜', '陈赫'),
        buildVerticalLine(),
        buildUserInfo("images/mozi.jpeg", '周礼榜', 'SnakeTC-沫子'),
        buildVerticalLine(),
        buildUserInfo("images/wutongxuejie.jpeg", '真爱榜', '梧桐学姐'),
      ],
    ),
  );
}

///构建body体
Widget buildContent(int index) {
  return new Column(
    children: <Widget>[
      new Container(
        margin: const EdgeInsets.all(15.0),
        child: new Row(
          //等分
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //强制子类填充可用空间==match_parent
            new Expanded(
                child: new Text(
              '直播推荐',
              textAlign: TextAlign.left,
              style: new TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            )),
            new Expanded(
                child: new Text(
              '刷新',
              textAlign: TextAlign.right,
              style: new TextStyle(
                  fontSize: 12.0,
                  color: const Color.fromARGB(255, 136, 136, 153)),
            ))
          ],
        ),
      ),
      new Row(
        children: <Widget>[
          //强制填充剩余空间
          new Expanded(
              child: new Container(
            margin: const EdgeInsets.only(right: 1.5),
            child: _buildContentImageText(
                'images/zhubo01.jpg', '新进主播,多多关注', 'Dae-安格', 16.6),
          )),
          new Expanded(
            child: new Container(
              margin: const EdgeInsets.only(left: 1.5),
              child: _buildContentImageText(
                  'images/zhubo02.jpeg', '国服李白,了解一下', 'EL-溜神', 52.1),
            ),
          ),
        ],
      ),
      new Row(
        children: <Widget>[
          new Expanded(
              child: new Container(
            margin: const EdgeInsets.only(right: 1.5),
            child: _buildContentImageText(
                'images/zhubo03.jpeg', '貂蝉带你五杀', '吕布别走\(^o^)/~', 5.9),
          )),
          new Expanded(
              child: new Container(
            margin: const EdgeInsets.only(left: 1.5),
            child: _buildContentImageText(
                'images/zhubo04.jpeg', '国服最骚香香', '国服最骚香香', 11.1),
          ))
        ],
      )
    ],
  );
}

///构建body体图文部分
Widget _buildContentImageText(
    String asserPath, String desc, String username, double onlinePopulation) {
  return new Container(
    alignment: Alignment.center,
    child: new Column(
      children: <Widget>[
        ///Stack控件的每一个子控件都是定位或不定位
        ///定位的子控件是被Positioned控件包裹的。
        ///Stack控件本身包含所有不定位的子控件，其根据alignment定位（默认为左上角）。
        ///然后根据定位的子控件的top、right、bottom和left属性将它们放置在Stack控件上。
        new Stack(
          children: <Widget>[
            //封面图
            new Image.asset(
              asserPath,
              fit: BoxFit.cover,
            ),
            //抽奖标识
            new Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(top: 5.0),
              child: new Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  //RotatedBox:旋转内部小部件;
                  //quarterTurns:旋转的次数;每旋转一次走顺时针方向的四分之一;
                  new RotatedBox(
                    quarterTurns: 2,
                    child: new Image.asset(
                      'images/battle_status_bg_yellow.9.png',
                      width: 45.0,
                      height: 20.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  new Text(
                    '抽奖中',
                    style: new TextStyle(fontSize: 9.0, color: Colors.black),
                  ),
                ],
              ),
            ),
            //用户名和人气值
            new Positioned(
              //控制[Stack]子部件位置的小部件
              left: 15.0,
              right: 11.0,
              bottom: 7.0,
              child: new Row(
                children: <Widget>[
                  //填充剩余空间
                  new Expanded(
                      child: new Text(
                    username,
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      fontSize: 8.0,
                      color: Colors.white,
                    ),
                  )),
                  new Expanded(
                      child: new Text(
                    '$onlinePopulation 万人气',
                    textAlign: TextAlign.right,
                    style: new TextStyle(fontSize: 8.0, color: Colors.white),
                  ))
                ],
              ),
            ),
          ],
        ),
        new Container(
          margin: const EdgeInsets.only(top: 7.0, bottom: 16.0),
          child: new Text(
            desc,
            style: new TextStyle(
              color: Colors.black,
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    ),
  );
}
