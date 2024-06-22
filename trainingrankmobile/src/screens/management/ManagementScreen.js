import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import CustomButton from '../../components/common/CustomButton';

const ManagementScreen = () => {
  const navigation = useNavigation();

  const navigateToScreen = (screenName) => {
    navigation.navigate('ManagementStack', { screen: screenName });
  };

  return (
    <View style={styles.container}>
      <Text style={styles.header}>Trang quản trị</Text>
      <CustomButton
        title="Hoạt động đã tạo"
        onPress={() => navigateToScreen('CreatedActivitiesScreen')}
        backgroundColor="#303cbe"
        style={styles.button}
      />
      <CustomButton
        title="Danh sách báo thiếu"
        onPress={() => navigateToScreen('ReportScreen')}
        backgroundColor="#9d59d2"
        style={styles.button}
      />
      {/* <CustomButton
        title="Điểm danh toàn khoa"
        onPress={() => navigateToScreen('Attendance')}
        backgroundColor="#282828"
        style={styles.button}
      /> */}
      <CustomButton
        title="Tạo thêm tài khoản"
        onPress={() => navigateToScreen('CreateAccount')}
        backgroundColor="#d62800"
        style={styles.button}
      />
      <CustomButton
        title="Thêm thêm hoạt động mới"
        onPress={() => navigation.navigate('ActivityStack',{screen: 'ActivityModal'})}
        backgroundColor="#ff9b56"
        style={styles.button}
      />
      <CustomButton
        title="Thêm bài viết mới"
        onPress={() => navigation.navigate('BulletinStack',{screen: 'CreateBulletinScreen'})}
        backgroundColor="#bf12d7"
        style={styles.button}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    padding: 16,
  },
  header: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 24,
  },
  button: {
    marginVertical: 8,
    width: '100%',
  },
});

export default ManagementScreen;
