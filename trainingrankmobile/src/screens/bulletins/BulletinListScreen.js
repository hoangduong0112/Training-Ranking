// screens/BulletinListScreen.js
import React, { useState, useEffect } from 'react';
import { View, FlatList, StyleSheet, Text, TouchableOpacity } from 'react-native';
import { authAPI, endpoints } from '../../configs/APIs';
import Loading from '../../components/common/Loading';
import { getTokens } from '../../utils/utils';
import BulletinCard from './../../components/bulletin/BulletinCard';

const BulletinListScreen = () => {
  const [bulletins, setBulletins] = useState([]);
  const [selectedBulletin, setSelectedBulletin] = useState(null);
  const [loading, setLoading] = useState(true);
  const [nextPage, setNextPage] = useState(null);

  useEffect(() => {
    fetchBulletins();
  }, []);

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

  const handleViewDetails = async (bulletinID) => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).get(endpoints['bulletins-detail'](bulletinID));
      setSelectedBulletin(response.data);
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

      setBulletins(prevBulletins => [...prevBulletins, ...response.data.results]);
      setNextPage(response.data.next);
    } catch (error) {
      console.error(error);
    }
  };

  const renderBulletinItem = ({ item }) => (
    <BulletinCard bulletin={item} onPress={() => handleViewDetails(item.id)} />
  );

  if (loading && bulletins.length === 0) {
    return (
      <Loading style={styles.loadingContainer}>
        <Text>Loading bulletins...</Text>
      </Loading>
    );
  }

  return (
    <View style={styles.container}>
      {selectedBulletin ? (
        <View style={styles.bulletinDetailContainer}>
          <Text style={styles.title}>{selectedBulletin.title}</Text>
          <Text style={styles.content}>{selectedBulletin.content}</Text>
          <Text style={styles.date}>Created Date: {selectedBulletin.created_date}</Text>
          <TouchableOpacity style={styles.backButton} onPress={() => setSelectedBulletin(null)}>
            <Text style={styles.backButtonText}>Back to Bulletins</Text>
          </TouchableOpacity>
        </View>
      ) : (
        <FlatList
          data={bulletins}
          keyExtractor={(item) => item.id.toString()}
          renderItem={renderBulletinItem}
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
  bulletinDetailContainer: {
    flex: 1,
    backgroundColor: '#fff',
    padding: 16,
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 16,
  },
  content: {
    fontSize: 16,
    marginBottom: 8,
  },
  date: {
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
  loadMoreContainer: {
    paddingVertical: 16,
    alignItems: 'center',
  },
  loadMoreText: {
    fontSize: 16,
    color: '#666',
  },
});

export default BulletinListScreen;
