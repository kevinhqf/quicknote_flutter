package com.example.quicknote;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import cn.smssdk.flutter.MobsmsPlugin;
public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    // 注册SMSSDK Flutter插件
    MobsmsPlugin.registerWith(registrarFor(MobsmsPlugin.CHANNEL));
    String MOB_APPKEY="2b6a5e65dc366";
    String MOB_APPSECRET="e9a268224301a800555b1fdca6533ce4";
    // 初始化SMSSDK
    MobSDK.init(this, MOB_APPKEY, MOB_APPSECRET);
  }

  @Override
	protected void onDestroy() {
		super.onDestroy();
		// 执行回收操作
		MobsmsPlugin.recycle();
	}
}
