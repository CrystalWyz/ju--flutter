

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'hotel_app_theme.dart';
import 'map_base_page_state.dart';

/// 地图类型示例
class ShowMapTypePage extends StatefulWidget {
  const ShowMapTypePage({
    Key? key,
  }) : super(key: key);

  @override
  _ShowMapTypePageState createState() => _ShowMapTypePageState();
}

class _ShowMapTypePageState extends BMFBaseMapState<ShowMapTypePage> {
  BMFMapType mapType = BMFMapType.Standard;

  /// 创建完成回调
  @override
  void onBMFMapCreated(BMFMapController controller) {
    super.onBMFMapCreated(controller);

    /// 地图渲染每一帧画面过程中，以及每次需要重绘地图时（例如添加覆盖物）都会调用此接口
    myMapController.setMapOnDrawMapFrameCallback(
        callback: (BMFMapStatus mapStatus) {
//       print('地图渲染每一帧\n mapStatus = ${mapStatus.toMap()}');
    });

    myMapController.setMapRenderValidDataCallback(
      callback: (bool isValid, int errorCode, String errorMessage) {

        print('渲染状态回调 \n isValid = ${isValid} \n errorCode = ${errorCode} \n errorMessage = ${errorMessage}');

      });

    /// 地图区域即将改变时会调用此接口
    /// mapStatus 地图状态信息
    myMapController.setMapRegionWillChangeCallback(
        callback: (BMFMapStatus mapStatus) {
      print('地图区域即将改变时会调用此接口1\n mapStatus = ${mapStatus.toMap()}');
    });

    /// 地图区域改变完成后会调用此接口
    /// mapStatus 地图状态信息
    myMapController.setMapRegionDidChangeCallback(
        callback: (BMFMapStatus mapStatus) {
      print('地图区域改变完成后会调用此接口2\n mapStatus = ${mapStatus.toMap()}');
    });

    /// 地图区域即将改变时会调用此接口
    /// mapStatus 地图状态信息
    /// reason 地图改变原因
    myMapController.setMapRegionWillChangeWithReasonCallback(callback:
        (BMFMapStatus mapStatus, BMFRegionChangeReason regionChangeReason) {
      print(
          '地图区域即将改变时会调用此接口3\n mapStatus = ${mapStatus.toMap()}\n reason = ${regionChangeReason.index}');
    });

    /// 地图区域改变完成后会调用此接口
    /// mapStatus 地图状态信息
    /// reason 地图改变原因
    myMapController.setMapRegionDidChangeWithReasonCallback(callback:
        (BMFMapStatus mapStatus, BMFRegionChangeReason regionChangeReason) {
      print(
          '地图区域改变完成后会调用此接口4\n mapStatus = ${mapStatus.toMap()}\n reason = ${regionChangeReason.index}');
    });
  }

  @override
  void dispose() {
    // _mapController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: <Widget>[generateMap(),generateControlBar()]),
      ),
    );
  }

  @override
  Widget generateControlBar() {
    return Container(
        width: screenSize.width,
        height: 60,
        color: HotelAppTheme.buildLightTheme().primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Radio(
                  value: BMFMapType.Standard,
                  groupValue: this.mapType,
                  onChanged: (value) {
                    myMapController.updateMapOptions(
                        BMFMapOptions(mapType: BMFMapType.Standard));
                    setState(() {
                      this.mapType = value as BMFMapType;
                    });
                  },
                ),
                Text(
                  "普通地图",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: BMFMapType.Satellite,
                  groupValue: this.mapType,
                  onChanged: (value) {
                    myMapController.updateMapOptions(
                        BMFMapOptions(mapType: BMFMapType.Satellite));
                    setState(() {
                      this.mapType = value as BMFMapType;
                    });
                  },
                ),
                Text(
                  "卫星图",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: BMFMapType.None,
                  groupValue: this.mapType,
                  onChanged: (value) {
                    myMapController.updateMapOptions(
                        BMFMapOptions(mapType: BMFMapType.None));
                    setState(() {
                      this.mapType = value as BMFMapType;
                    });
                  },
                ),
                Text(
                  "空白地图",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )
          ],
        ));
  }

  /// 设置地图参数
  @override
  BMFMapOptions initMapOptions() {
    BMFCoordinate center = BMFCoordinate(39.965, 116.404);
    BMFMapOptions mapOptions = BMFMapOptions(
        mapType: BMFMapType.Standard,
        zoomLevel: 12,
        maxZoomLevel: 21,
        minZoomLevel: 4,
        logoPosition: BMFLogoPosition.LeftBottom,
        mapPadding: BMFEdgeInsets(top: 0, left: 50, right: 50, bottom: 0),
        overlookEnabled: true,
        overlooking: -15,
        center: center);
    return mapOptions;
  }
}
