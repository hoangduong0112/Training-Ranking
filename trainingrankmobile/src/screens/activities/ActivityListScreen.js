import React, { useState, useEffect, useCallback } from 'react';
import { View, FlatList, StyleSheet, Text, TouchableOpacity, BackHandler, RefreshControl } from 'react-native';
import { useNavigation, useFocusEffect } from '@react-navigation/native';
import { authAPI, endpoints } from '../../configs/APIs';
import Loading from '../../components/common/Loading';
import { getTokens } from '../../utils/utils';
import { useUser } from '../../stores/contexts/UserContext';

const ActivityListScreen = () => {
  const [activities, setActivities] = useState([]);
  const [loading, setLoading] = useState(true);
  const [nextPage, setNextPage] = useState(null);
  const [refreshing, setRefreshing] = useState(false); // State for RefreshControl
  const { data: userData } = useUser();
  const navigation = useNavigation();

  useFocusEffect(
    useCallback(() => {
      fetchActivities();

      const onBackPress = () => false; // Prevent default behavior (navigating back)

      BackHandler.addEventListener('hardwareBackPress', onBackPress);

      return () => BackHandler.removeEventListener('hardwareBackPress', onBackPress);
    }, [])
  );

  const fetchActivities = async () => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).get(endpoints['activities']);
      setActivities(response.data.results.map(activity => ({
        ...activity,
        isExpired: isActivityExpired(activity.date_register),
      })));
      setNextPage(response.data.next);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  const handleViewDetails = (activityID) => {
    navigation.navigate('ActivityStack', { screen: 'ActivityDetail', params: {activityID}});
  };

  const handleLoadMore = () => {
    if (nextPage) {
      fetchNextPage(nextPage);
    }
  };

  const fetchNextPage = async (pageUrl) => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).get(pageUrl);
      setActivities(prevActivities => [
        ...prevActivities,
        ...response.data.results.map(activity => ({
          ...activity,
          isExpired: isActivityExpired(activity.date_register),
        })),
      ]);
      setNextPage(response.data.next);
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
    setRefreshing(true); // Set refreshing to true to show the RefreshControl
    try {
      await fetchActivities(); // Fetch fresh activities
    } catch (error) {
      console.error(error);
    } finally {
      setRefreshing(false); // Set refreshing to false when done
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
      <FlatList
        data={activities}
        keyExtractor={(item) => item.id.toString()}
        renderItem={renderActivityItem}
        onEndReached={handleLoadMore}
        refreshControl={
          <RefreshControl
            refreshing={refreshing}
            onRefresh={handleRefresh}
          />
        }
        onEndReachedThreshold={0.5}
        ListFooterComponent={() => (
          nextPage ? (
            <View style={styles.loadMoreContainer}>
              <Text style={styles.loadMoreText}>Loading more...</Text>
            </View>
          ) : null
        )}
      />
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
  loadMoreContainer: {
    paddingVertical: 16,
  },
  loadMoreText: {
    textAlign: 'center',
    color: '#007BFF',
  },
});

export default ActivityListScreen;
