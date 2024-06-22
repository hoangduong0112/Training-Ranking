import React, { useState, useEffect } from 'react';
import { View, Text, ScrollView, RefreshControl, Image, StyleSheet } from 'react-native';
import { authAPI, endpoints } from '../../configs/APIs';
import { getTokens } from '../../utils/utils';
import CustomButton from '../common/CustomButton';
import { useNavigation } from '@react-navigation/native';
import { useUser } from '../../stores/contexts/UserContext';

const ActivityDetails = ({ activity, onBack }) => {
  const navigation = useNavigation();
  const [statute, setStatute] = useState(null);
  const [refreshing, setRefreshing] = useState(false);
  const [status, setStatus] = useState(activity.status);
  const { data: userData } = useUser();
  const [activityDetails, setActivityDetails] = useState(activity);

  useEffect(() => {
    fetchStatute(activityDetails.statute);
  }, [activityDetails.statute]);

  const fetchStatute = async (statuteId) => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).get(endpoints['statute-detail'](statuteId));
      setStatute(response.data);
    } catch (error) {
      console.error(error);
    }
  };

  const fetchActivityDetails = async () => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).get(endpoints['activity-detail'](activity.id));
      setActivityDetails(response.data);
      setStatus(response.data.status);
    } catch (error) {
      console.error('Error fetching activity details:', error);
    }
  };

  const handleRefresh = async () => {
    setRefreshing(true);
    try {
      await fetchActivityDetails();
      await fetchStatute(activityDetails.statute);
    } catch (error) {
      console.error(error);
    } finally {
      setRefreshing(false);
    }
  };

  const handleRegister = async (activityId) => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).post(endpoints['activity-register'](activityId));
      setStatus(response.data.status);
      fetchActivityDetails(); 
    } catch (error) {
      console.error(error);
    }
  };

  const navigateToReport = (id) => {
    navigation.navigate('ActivityStack', { screen: 'ReportForm', params: { id } });
  };

  return (
    <ScrollView
      style={styles.activityDetailContainer}
      refreshControl={<RefreshControl refreshing={refreshing} onRefresh={handleRefresh} />}
    >
      <View style={styles.headerContainer}>
        <Image source={{ uri: activityDetails.assistant_creator.avatar }} style={styles.avatar} />
        <View style={styles.assistantInfo}>
          <Text style={styles.assistantName}>{activityDetails.assistant_creator.first_name} {activityDetails.assistant_creator.last_name}</Text>
          <Text style={styles.createdDate}>Ngày tạo: {new Date(activityDetails.date_register).toLocaleDateString()}</Text>
        </View>
      </View>
      <Text style={styles.title}>Hoạt động: {activityDetails.title}</Text>
      <Text style={styles.description}>Mô tả: {activityDetails.description}</Text>
      <Text style={styles.location}>Vị trí tổ chức: {activityDetails.location}</Text>
      <Text style={styles.date}>Ngày: {new Date(activityDetails.date_register).toLocaleDateString()}</Text>
      <Text style={styles.points}>Điểm cộng: {activityDetails.points}</Text>
      
      <View>
        {(userData.user_role === 'SV' && activityDetails.isExpired) && (
          <>
            <Text style={styles.status}>Trạng thái: {status === 'attended' ? 'Đã tham gia' : 'Chưa tham gia'}</Text>
            <Text style={styles.expiredText}>Hoạt động đã kết thúc</Text>
            <CustomButton 
              title={status === 'registered' ? 'Hủy Đăng ký' : 'Đăng ký'}
              onPress={() => handleRegister(activityDetails.id)}
              backgroundColor={status === 'registered' ? '#dc3545' : '#28a745'}
            />
          </>
        )}
      </View>

      {statute && (
        <View style={styles.statuteContainer}>
          <Text style={styles.statuteTitle}>Chi tiết Quy định:</Text>
          <Text style={styles.statuteName}>Tên: {statute.statute_name}</Text>
          <Text style={styles.statuteMaxPoints}>Điểm tối đa: {statute.max_point}</Text>
        </View>
      )}
      
      {userData.user_role === 'SV' && (
        <>
          <CustomButton 
            title="Báo cáo"
            onPress={() => navigateToReport(activityDetails.id)}
            backgroundColor="#ff6347"
            style={styles.spacing}
          />
          <CustomButton 
            title="Trở về danh sách hoạt động"
            onPress={onBack}
            backgroundColor="#6c757d"
            style={styles.spacing}
          />
        </>
      )}
      
      {(userData.user_role === 'TLSV' || userData.user_role === 'CV') && (
        <>
          <CustomButton 
            title="Sinh viên đăng ký"
            onPress={() => navigation.navigate('ManagementStack', { screen: 'RegisteredStudentScreen', params: { activityId: activityDetails.id } })}
            backgroundColor="#ff6347"
            style={styles.spacing}
          />
          {(userData.email === activityDetails.assistant_creator.email || activityDetails.isExpired ) && (
            <CustomButton 
              title="Chỉnh sửa"
              onPress={() => navigation.navigate('ActivityStack', { screen: 'ActivityModal', params: { activityId: activityDetails.id } })}
              backgroundColor="#ff6347"
              style={styles.spacing}
            />
          )}
        </>
      )}

    </ScrollView>
  );
};

const styles = StyleSheet.create({
  activityDetailContainer: {
    flex: 1,
    backgroundColor: '#fff',
    padding: 16,
  },
  headerContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 16,
  },
  avatar: {
    width: 50,
    height: 50,
    borderRadius: 25,
    marginRight: 16,
  },
  assistantInfo: {
    flex: 1,
  },
  assistantName: {
    fontSize: 18,
    fontWeight: 'bold',
  },
  createdDate: {
    fontSize: 14,
    color: '#888',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 16,
  },
  description: {
    fontSize: 16,
    marginBottom: 8,
  },
  location: {
    fontSize: 16,
    marginBottom: 8,
  },
  date: {
    fontSize: 16,
    marginBottom: 8,
  },
  points: {
    fontSize: 16,
    marginBottom: 8,
  },
  status: {
    fontSize: 16,
    marginBottom: 8,
  },
  expiredText: {
    fontSize: 14,
    color: 'red',
    marginTop: 4,
  },
  statuteContainer: {
    marginTop: 16,
    padding: 16,
    backgroundColor: '#f9f9f9',
    borderRadius: 8,
  },
  statuteTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 8,
  },
  statuteName: {
    fontSize: 16,
    marginBottom: 4,
  },
  statuteMaxPoints: {
    fontSize: 16,
    marginBottom: 4,
  },
  spacing: {
    marginVertical: 8,
  },
});

export default ActivityDetails;
