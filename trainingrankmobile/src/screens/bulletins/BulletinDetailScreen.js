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
      <View style={styles.header}>
        <Image source={{ uri: bulletin.author.avatar }} style={styles.avatar} />
        <View style={styles.headerText}>
          <Text numberOfLines={1} ellipsizeMode="tail" style={styles.username}>
            {bulletin.author.first_name} {bulletin.author.last_name}
          </Text>
          <Text style={styles.date}>{moment(bulletin.created_date).fromNow()}</Text>
        </View>
      </View>
      <Text numberOfLines={1} ellipsizeMode="tail" style={styles.title}>
        {bulletin.title}
      </Text>
      <Image source={{ uri: bulletin.image }} style={styles.image} />
      <Text style={styles.content}>{bulletin.content}</Text>
      <View style={styles.bottom}>
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
          color="#007bff" // Màu sắc của nút
          textColor="#fff" // Màu sắc chữ
          style={styles.customButton} // Custom style nếu cần thiết
        />
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
    padding: 20,
  },
  contentContainer: {
    alignItems: 'center',
    overflow: 'hidden',
  },
  bulletin: {
    borderWidth: 1,
    borderRadius: 20,
    width: '95%',
    marginBottom: 10,
    alignSelf: 'center',
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'flex-start',
    marginBottom: 10,
    width: '100%',
    maxWidth: '100%',
    overflow: 'hidden',
  },
  headerText: {
    maxWidth: '85%',
  },
  bottom: {
    flexDirection: 'row',
    alignItems: 'center',
    maxWidth: '100%',
  },
  avatar: {
    width: 40,
    height: 40,
    borderRadius: 25,
    marginRight: 10,
  },
  username: {
    fontSize: 18,
    fontWeight: 'bold',
  },
  hashtag: {
    fontSize: 16,
    marginBottom: 10,
    alignSelf: 'flex-start',
    color: 'lightblue',
    fontWeight: 'bold',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 10,
    width: '100%',
  },
  image: {
    width: '100%',
    height: 200,
    marginBottom: 10,
  },
  content: {
    fontSize: 16,
    lineHeight: 24,
    marginBottom: 10,
  },
  button: {
    backgroundColor: '#007bff',
    paddingVertical: 10,
    paddingHorizontal: 20,
    borderRadius: 5,
  },
  buttonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: 'bold',
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  commentsContainer: {
    width: '100%',
  },
  likeButton: {
    marginRight: 5,
  },
  likeText: {
    fontSize: 16,
    marginRight: 15,
  },
  customButton: {
    marginLeft: 10, // Custom style nếu cần thiết
  },
});

export default BulletinDetailScreen;
