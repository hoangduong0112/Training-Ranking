import React, { useState, useEffect } from 'react';
import { View, FlatList, StyleSheet, Text, TouchableOpacity } from 'react-native';
import { authAPI, endpoints } from '../../configs/APIs';
import Loading from '../../components/common/Loading';
import { getTokens } from '../../utils/utils';

const ActivityListScreen = () => {
  const [activities, setActivities] = useState([]);
  const [selectedActivity, setSelectedActivity] = useState(null);
  const [loading, setLoading] = useState(true);
  const [nextPage, setNextPage] = useState(null);

  useEffect(() => {
    fetchActivities();
  }, []);

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
        <View style={styles.activityDetailContainer}>
          <Text style={styles.title}>{selectedActivity.title}</Text>
          <Text style={styles.description}>{selectedActivity.description}</Text>
          <Text style={styles.location}>Location: {selectedActivity.location}</Text>
          <Text style={styles.date}>Date: {selectedActivity.date_register}</Text>
          <Text style={styles.points}>Points: {selectedActivity.points}</Text>
          {selectedActivity.isExpired ? (
            <Text style={styles.expiredText}>Hoạt động đã kết thúc</Text>
          ) : (
            <TouchableOpacity style={styles.registerButton} onPress={() => handleRegister(selectedActivity.id, selectedActivity.status)}>
              <Text style={styles.registerButtonText}>
                {selectedActivity.status === 'register' ? 'Đăng ký' : 'Hủy đăng ký'}
              </Text>
            </TouchableOpacity>
          )}
          <TouchableOpacity style={styles.backButton} onPress={() => setSelectedActivity(null)}>
            <Text style={styles.backButtonText}>Back to Activities</Text>
          </TouchableOpacity>
        </View>
      ) : (
        <FlatList
          data={activities}
          keyExtractor={(item) => item.id.toString()}
          renderItem={renderActivityItem}
          onEndReached={handleLoadMore}
          onEndReachedThreshold={0.5}
          ListFooterComponent={() => (
            nextPage ? (
              <View style={styles.loadMoreContainer}>
                <Text style={styles.loadMoreText}>Loading more...</Text>
              </View>
            ) : null
          )}
        />
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    padding: 16,
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  activityCard: {
    padding: 16,
    marginBottom: 8,
    backgroundColor: '#f0f0f0',
    borderRadius: 8,
  },
  activityDetailContainer: {
    flex: 1,
    backgroundColor: '#fff',
    padding: 16,
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
  backButton: {
    marginTop: 16,
    padding: 8,
    backgroundColor: '#ccc',
    borderRadius: 8,
    alignSelf: 'flex-start',
  },
  backButtonText: {
    fontSize: 16,
  },
  registerButton: {
    marginTop: 8,
    paddingVertical: 12,
    paddingHorizontal: 24,
    backgroundColor: '#007BFF',
    borderRadius: 8,
    alignItems: 'center',
  },
  registerButtonText: {
    fontSize: 16,
    color: '#fff',
  },
  loadMoreContainer: {
    paddingVertical: 16,
    alignItems: 'center',
  },
  loadMoreText: {
    fontSize: 16,
    color: '#666',
  },
  expiredText: {
    fontSize: 14,
    color: 'red',
    marginTop: 4,
  },
});

export default ActivityListScreen;
