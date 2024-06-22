import React, { useEffect, useState, useCallback} from 'react';
import { View, Text, StyleSheet, ScrollView, Alert } from 'react-native';
import { useRoute, useFocusEffect } from '@react-navigation/native';
import { authAPI, endpoints } from '../../configs/APIs';
import Loading from '../../components/common/Loading';
import { getTokens } from '../../utils/utils';
import ActivityDetails from '../../components/activity/ActivityDetails';

const ActivityDetailScreen = ({ navigation }) => {
  const route = useRoute();
  const { activityID } = route.params;
  const [activity, setActivity] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchActivityDetails();
  }, [activityID]);

  useFocusEffect(
    useCallback(() => {
      fetchActivityDetails();
    }, [activityID])
  );

  const fetchActivityDetails = async () => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).get(endpoints['activity-detail'](activityID));
      setActivity({
        ...response.data,
        isExpired: isActivityExpired(response.data.date_register),
      });
    } catch (error) {
      console.error(error);
      Alert.alert('Lỗi', 'Đã xảy ra lỗi khi lấy thông tin hoạt động.');
    } finally {
      setLoading(false);
    }
  };

  const isActivityExpired = (activityDate) => {
    const currentDate = new Date();
    const activityEndDate = new Date(activityDate);
    return currentDate > activityEndDate;
  };

  if (loading) {
    return (
      <Loading style={styles.loadingContainer}>
        <Text>Loading activity details...</Text>
      </Loading>
    );
  }

  return (
    <ScrollView contentContainerStyle={styles.container}>
      {activity ? (
        <ActivityDetails activity={activity} onBack={() => navigation.goBack()} />
      ) : (
        <Text>No activity details found.</Text>
      )}
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
    backgroundColor: '#fff',
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default ActivityDetailScreen;
