import React, { useEffect, useState } from 'react';
import { View, StyleSheet, Alert, Text, ScrollView } from 'react-native';
import ProfileSection from '../../components/profile/ProfileSection';
import { getTokens, removeTokens } from '../../utils/utils';
import { authAPI, endpoints } from '../../configs/APIs';
import Loading from '../../components/common/Loading';
import { useUserDispatch } from '../../stores/contexts/UserContext';
import { SignOutAction } from '../../stores/actions/UserAction';
import CustomButton from '../../components/common/CustomButton'; // Assuming CustomButton is in common folder

const ProfileScreen = ({ navigation }) => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const userDispatch = useUserDispatch();

  useEffect(() => {
    const fetchUser = async () => {
      try {
        const { accessToken } = await getTokens();
        const response = await authAPI(accessToken).get(endpoints['me']);
        setUser(response.data);
      } catch (error) {
        console.error('Error fetching user profile:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchUser();
  }, []);

  const handleEditPress = () => {
    Alert.alert("Chỉnh sửa", "Chức năng này chưa được triển khai.");
  };

  const handleLogoutPress = async () => {
    Alert.alert(
      'Đăng xuất',
      'Bạn chắc chắn muốn đăng xuất?',
      [
        {
          text: 'Đăng xuất',
          onPress: () => {
            removeTokens();
            userDispatch(SignOutAction());
            navigation.navigate('AuthStack', { screen: 'SignIn' });
          },
        },
        {
          text: 'Hủy',
          style: 'cancel',
        },
      ],
      { cancelable: true },
    );
  };

  const handleActivityHistoryPress = () => {
    navigation.navigate('ProfileStack', { screen: 'MyActivities' });
  };

  const handlePointsPress = () => {
    navigation.navigate('ProfileStack', { screen: 'MyPoints' });
  };

  if (loading) {
    return (
      <Loading style={styles.loadingContainer}>
        <Text>Loading profile...</Text>
      </Loading>
    );
  }

  return (
    <ScrollView contentContainerStyle={styles.container}>
      <ProfileSection user={user} onEditPress={handleEditPress} onLogoutPress={handleLogoutPress} />
      
      {user.user_role === 'SV' && (
        <>
          <CustomButton 
            onPress={handleActivityHistoryPress} 
            title="Lịch sử hoạt động" 
            icon="history" // Assuming you have an icon named 'history' in react-native-paper
            style={styles.button}
          />
          <CustomButton 
            onPress={handlePointsPress} 
            title="Điểm số" 
            icon="text-box-check" 
            style={styles.button}
          />
        </>
      )}

      <CustomButton 
        onPress={handleLogoutPress} 
        title="Đăng xuất" 
        icon="logout" 
        style={styles.button}
      />
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flexGrow: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  button: {
    width: '100%',
    marginVertical: 10,
  },
});

export default ProfileScreen;
