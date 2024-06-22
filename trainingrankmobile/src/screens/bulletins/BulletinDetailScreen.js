import React, { useState, useEffect } from 'react';
import { View, Text, Image, ScrollView, StyleSheet } from 'react-native';
import { IconButton } from 'react-native-paper';
import moment from 'moment';
import 'moment/locale/vi';
import { getTokens } from '../../utils/utils';
import Loading from '../../components/common/Loading';
import CommentSection from '../../components/bulletin/CommentSection';
import CommentCard from '../../components/bulletin/CommentCard';
import CustomButton from '../../components/common/CustomButton';
import { authAPI, endpoints } from '../../configs/APIs';

const BulletinDetailScreen = ({ route }) => {
  const { bulletinID } = route.params;
  const [bulletin, setBulletin] = useState(null);
  const [liked, setLiked] = useState(false);
  const [loading, setLoading] = useState(false);
  const [comments, setComments] = useState([]);
  const [modalVisible, setModalVisible] = useState(false);

  useEffect(() => {
    const getBulletin = async () => {
      try {
        setLoading(true);
        const { accessToken } = await getTokens();
        const response = await authAPI(accessToken).get(endpoints['bulletins-detail'](bulletinID));
        setBulletin(response.data);
        setLiked(response.data.liked);
        setLoading(false);
      } catch (error) {
        console.error('Error get bulletin details:', error);
        setLoading(false);
      }
    };

    const getComments = async () => {
      try {
        const { accessToken } = await getTokens();
        const response = await authAPI(accessToken).get(endpoints['bulletins-comments'](bulletinID));
        setComments(response.data);
      } catch (error) {
        console.error('Error get comments:', error);
      }
    };

    getBulletin();
    getComments();
  }, [bulletinID]);

  const handleLiked = async () => {
    try {
      const { accessToken } = await getTokens();
      const likeResponse = await authAPI(accessToken).post(endpoints['bulletins-like'](bulletin.id));
      setLiked(!liked);
    } catch (error) {
      console.error('Error liking bulletin:', error);
    }
  };

  const handleModalVisible = () => {
    setModalVisible(true);
  };

  const handleCloseModal = () => {
    setModalVisible(false);
  };

  if (loading || !bulletin) {
    return (
      <Loading style={styles.loadingContainer}>
        <Text>Loading bulletin details...</Text>
      </Loading>
    );
  }

  return (
    <ScrollView style={styles.container} contentContainerStyle={styles.contentContainer}>
      <View style={styles.postContainer}>
        <View style={styles.header}>
          <Image source={{ uri: bulletin.author.avatar }} style={styles.avatar} />
          <View style={styles.headerText}>
            <Text style={styles.username}>
              {bulletin.author.first_name} {bulletin.author.last_name}
            </Text>
            <Text style={styles.date}>{moment(bulletin.created_date).fromNow()}</Text>
          </View>
        </View>
        <Text style={styles.title}>{bulletin.title}</Text>
        <Image source={{ uri: bulletin.image }} style={styles.image} />
        <Text style={styles.content}>{bulletin.content}</Text>
        <View style={styles.actions}>
          <IconButton
            icon={liked ? 'thumb-up' : 'thumb-up-outline'}
            size={24}
            onPress={handleLiked}
            style={styles.likeButton}
          />
          <Text style={styles.likeText}>{liked ? 'Đã thích' : 'Thích'}</Text>
          <CustomButton 
            onPress={handleModalVisible}
            title="Bình luận"
            icon="comment-outline" // Icon from react-native-paper
            iconSize={20}
            backgroundColor="#007bff"
            textColor="#fff"
            style={styles.customButton}
          />
        </View>
      </View>
      <CommentSection visible={modalVisible} onClose={handleCloseModal} bulletinID={bulletin.id} />
      <View style={styles.commentsContainer}>
        {comments.map(comment => (
          <CommentCard key={comment.id} comment={comment} />
        ))}
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  contentContainer: {
    paddingHorizontal: 16,
    paddingBottom: 20,
  },
  postContainer: {
    backgroundColor: '#fff',
    borderRadius: 10,
    padding: 12,
    marginBottom: 12,
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 1,
    },
    shadowOpacity: 0.18,
    shadowRadius: 1.0,
    elevation: 1,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 8,
  },
  headerText: {
    marginLeft: 8,
  },
  avatar: {
    width: 40,
    height: 40,
    borderRadius: 20,
  },
  username: {
    fontSize: 16,
    fontWeight: 'bold',
  },
  date: {
    fontSize: 12,
    color: '#777',
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 8,
  },
  image: {
    width: '100%',
    height: 200,
    borderRadius: 10,
    marginBottom: 8,
  },
  content: {
    fontSize: 16,
    lineHeight: 24,
    marginBottom: 12,
  },
  actions: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  likeButton: {
    marginRight: 8,
  },
  likeText: {
    fontSize: 14,
    color: '#777',
    marginRight: 16,
  },
  customButton: {
    marginLeft: 'auto',
  },
  commentsContainer: {
    marginTop: 12,
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default BulletinDetailScreen;
