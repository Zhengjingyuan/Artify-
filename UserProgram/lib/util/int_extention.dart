import 'package:userprogram/util/size_fit.dart';

extension IntExtension on int {
  double get px {
    return HYSizeFit.setPx(this.toDouble()); // 假设HYSizeFit类提供了setPx方法
  }

  double get rpx {
    return HYSizeFit.setRpx(this.toDouble()); // 假设HYSizeFit类提供了setRpx方法
  }
}