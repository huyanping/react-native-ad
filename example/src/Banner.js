import React, {useEffect} from 'react';
import {StyleSheet, Text, View, Dimensions} from 'react-native';
import {ad} from 'react-native-ad';

export default function Banner() {
  useEffect(() => {
    ad.init({
      appid: '5188701',
    });

    return () => {};
  }, []);
  return (
    <View style={styles.container}>
      <Text>测试Banner</Text>
      <ad.Banner
        codeid="946309523" //必传 广告位 codeid 注意区分 Android 和 IOS
        adSize="600x90"
        adWidth={150}
        onAdLayout={(data) => {
          console.log('Feed 广告加载成功！', data);
        }}
        onAdClose={(data) => {
          console.log('Feed 广告关闭！', data);
        }}
        onAdError={(err) => {
          console.log('Feed 广告加载失败！', err);
        }}
        onAdClick={(val) => {
          console.log('Feed 广告被用户点击！', val);
        }}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    // flex: 1,
    // justifyContent: 'center',
    // alignItems: 'center',
    backgroundColor: '#cccccc',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    // margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
