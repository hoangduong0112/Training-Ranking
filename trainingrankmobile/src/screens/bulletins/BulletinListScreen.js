import React, { useState, useEffect, useCallback } from 'react';
import { View, FlatList, StyleSheet, Text, RefreshControl } from 'react-native';
import { useNavigation, useFocusEffect } from '@react-navigation/native';
import { authAPI, endpoints } from '../../configs/APIs';
import Loading from '../../components/common/Loading';
import BulletinCard from '../../components/bulletin/BulletinCard';
import { useUser } from '../../stores/contexts/UserContext';
import { getTokens } from '../../utils/utils';
import CustomButton from './../../components/common/CustomButton';
import moment from 'moment/moment';
const BulletinListScreen = () => {
  const navigation = useNavigation();
  const { data: userData } = useUser();

  const [bulletins, setBulletins] = useState([]);
  const [loading, setLoading] = useState(true);
  const [nextPage, setNextPage] = useState(null);
  const [refreshing, setRefreshing] = useState(false);

  const fetchBulletins = async () => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).get(endpoints['bulletins']);

      setBulletins(response.data.results);
      setNextPage(response.data.next);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchBulletins();
  }, []);

  useFocusEffect(
    useCallback(() => {
      fetchBulletins();
    }, [])
  );

  const handleViewDetails = (bulletinID) => {
    navigation.navigate('BulletinStack', {
      screen: 'BulletinDetailScreen',
      params: { bulletinID },
    });
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

      setBulletins((prevBulletins) => [...prevBulletins, ...response.data.results]);
      setNextPage(response.data.next);
    } catch (error) {
      console.error(error);
    }
  };

  const renderBulletinItem = ({ item }) => (
    <BulletinCard bulletin={item} onPress={() => handleViewDetails(item.id)} />
  );

  const handleRefresh = async () => {
    setRefreshing(true);
    try {
      await fetchBulletins();
    } catch (error) {
      console.error(error);
    } finally {
      setRefreshing(false);
    }
  };

  if (loading && bulletins.length === 0) {
    return (
      <Loading style={styles.loadingContainer}>
        <Text>Loading bulletins...</Text>
      </Loading>
    );
  }

  return (
    <View style={styles.container}>
      {userData && (userData.user_role === 'TLSV' || userData.user_role === 'CV') && (
        <CustomButton
          title="Tạo Bulletin"
          onPress={() =>
            navigation.navigate('BulletinStack', {
              screen: 'CreateBulletinScreen',
            })
          }
          color="#007bff"
          textColor="#fff"
          style={styles.createButton}
        />
      )}

      <FlatList
        data={bulletins}
        keyExtractor={(item) => item.id.toString()}
        renderItem={renderBulletinItem}
        onEndReached={handleLoadMore}
        onEndReachedThreshold={0.5}
        refreshControl={<RefreshControl refreshing={refreshing} onRefresh={handleRefresh} />}
        ListFooterComponent={() =>
          nextPage ? (
            <View style={styles.loadMoreContainer}>
              <Text style={styles.loadMoreText}>Loading more...</Text>
            </View>
          ) : null
        }
      />
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
  loadMoreContainer: {
    paddingVertical: 16,
    alignItems: 'center',
  },
  loadMoreText: {
    fontSize: 16,
    color: '#666',
  },
  createButton: {
    marginTop: 16,
  },
});

export default BulletinListScreen;
