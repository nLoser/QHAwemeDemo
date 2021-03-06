# QHAwemeDemo


>模仿抖音App的主导航框架

## 特性

- [x] 手势 push 
- [x] 为单个控制器关闭 pop 手势支持
- [x] 为所有控制器关闭 pop 手势支持
- [x] Present 的 push 和 pop 动画

## 集成
>pod 'QHNavigationControllerMan'


## 使用
0.1.2使用手动添加手势push，代码如下
```
//AppDelegate：  
if let navigationC = self.window?.rootViewController as? QHNavigationController {  
    navigationC.addGesturePush()  
}  
//或者
//UIViewController：
if let navigationC = self.navigationController as? QHNavigationController {
    navigationC.addGesturePush()
}
```
0.1.1直接使用

## 注意
>目前Demo由于首页是有左广告页，会控制root的scrollView的滑动状态，因此下面的两个回调需要bool相同，第一个是true，而后一个是false的话，就不会回调End（即第三个func），只有这种情况才有问题。
```   
QHNavigationControllerProtocol的实现里面
func navigationControllerShouldPush(_ vc: QHNavigationController) -> Bool   
func navigationControllerDidPushBegin(_ vc: QHNavigationController) -> Bool   
func navigationControllerDidPushEnd(_ vc: QHNavigationController)   
```
需要说明下，这里逻辑是对的，第一其实是第二个的状态回调，就是拿bool而没有其他操作的API。

## 预览

![image](https://github.com/chenqihui/QHAwemeDemo/blob/master/screenshots/QHAwemeDemoGif.gif)


## 说明
>手势push跟下面链接的JPNavigationController类似，不过这里的实现是添加全局手势之后，没有改变原来的pop的手势，然后通过手势回调区分是否出发对应的手势功能。相对而去不用担心替换系统pop手势的target问题。
然后对于支持屏幕边缘滑动的手势push，其实也是可以，当是由于业务需求，还没增加对这部分的额外处理，所以暂时忽略，后续再补上。

## 参考
 
- [JPNavigationController](https://github.com/newyjp/JPNavigationController)
- [开发中的疑惑点---手势位置locationInView、velocityInView、translationInView](http://www.jianshu.com/p/be29e46fb2c4)
[iOS7下滑动返回与ScrollView共存二三事](http://www.cnblogs.com/lexingyu/p/3702742.html)
* [JPNavigationController](https://github.com/newyjp/JPNavigationController)
* [自定义控制器的转场动画（Push、Pop）](http://www.jianshu.com/p/59224648828b)
* [iOS动画之自定义转场动画(push)](http://www.jianshu.com/p/4d2fea0f6ecc)
