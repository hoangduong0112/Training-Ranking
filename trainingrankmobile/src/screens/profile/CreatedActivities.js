import React, { useState, useEffect, useCallback } from 'react';
import { View, FlatList, StyleSheet, Text, TouchableOpacity, BackHandler, RefreshControl } from 'react-native';
import { useNavigation, useFocusEffect } from '@react-navigation/native';
import { authAPI, endpoints } from '../../configs/APIs';
import Loading from '../../components/common/Loading';
import { getTokens } from '../../utils/utils';
import { useUser } from '../../stores/contexts/UserContext';
import ActivityDetails from '../../components/activity/ActivityDetails';

const CreatedActivitiesScreen = () => {
  const [activities, setActivities] = useState([]);
  const [selectedActivity, setSelectedActivity] = useState(null);
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);
  const { data: userData } = useUser();
  const navigation = useNavigation();

  useFocusEffect(
    useCallback(() => {
      fetchCreatedActivities();

      const onBackPress = () => {
        if (selectedActivity) {
          setSelectedActivity(null);
          return true;
        }
        return false;
      };

      BackHandler.addEventListener('hardwareBackPress', onBackPress);

      return () => BackHandler.removeEventListener('hardwareBackPress', onBackPress);
    }, [selectedActivity])
  );

  const fetchCreatedActivities = async () => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).get(endpoints['user-created-activities']);
      setActivities(response.data.map(activity => ({
        ...activity,
        isExpired: isActivityExpired(activity.date_register),
      })));
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  const handleViewDetails = async (activityID) => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).get(endpoints['activity-detail'](activityID));
      setSelectedActivity({
        ...response.data,
        isExpired: isActivityExpired(response.data.date_register),
      });
    } catch (error) {
      console.error(error);
    }
  };

  const isActivityExpired = (activityDate) => {
    const currentDate = new Date();
    const activityEndDate = new Date(activityDate);
    return currentDate > activityEndDate;
  };

  const renderActivityItem = ({ item }) => (
    <TouchableOpacity onPress={() => handleViewDetails(item.id)} style={styles.activityCard}>
      <Text>{item.title}</Text>
      {item.isExpired && <Text style={styles.expiredText}>Hoạt động đã kết thúc</Text>}
    </TouchableOpacity>
  );

  const handleRefresh = async () => {
    setRefreshing(true);
    try {
      await fetchCreatedActivities();
    } catch (error) {
      console.error(error);
    } finally {
      setRefreshing(false);
    }
  };

  if (loading && activities.length === 0) {
    return (
      <Loading style={styles.loadingContainer}>
        <Text>Loading activities...</Text>
      </Loading>
    );
  }

  return (
    <View style={styles.container}>
      {selectedActivity ? (
        <ActivityDetails activity={selectedActivity} onBack={() => setSelectedActivity(null)} />
      ) : (
        <FlatList
          data={activities}
          keyExtractor={(item) => item.id.toString()}
          renderItem={renderActivityItem}
          refreshControl={
            <RefreshControl
              refreshing={refreshing}
              onRefresh={handleRefresh}
            />
          }
        />
      )}
    </View>
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
  activityCard: {
    padding: 16,
    backgroundColor: '#f9f9f9',
    borderBottomWidth: 1,
    borderBottomColor: '#ddd',
  },
  expiredText: {
    color: 'red',
  },
});

export default CreatedActivitiesScreen;
