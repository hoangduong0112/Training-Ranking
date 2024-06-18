import React, { useState, useEffect } from 'react';
import { Modal, View, ScrollView, TextInput, Button, ActivityIndicator, StyleSheet } from 'react-native';
import CommentCard from './CommentCard';
import { authAPI, endpoints } from '../../configs/APIs';
import { getTokens } from '../../utils/utils';

const CommentSection = ({ visible, onClose, bulletinID }) => {
  const [comment, setComment] = useState('');
  const [loading, setLoading] = useState(false);
  const [listComment, setListComment] = useState([]);
  const [page, setPage] = useState(1); // Added page state

  useEffect(() => {
    if (visible) {
      getComments();
    }
  }, [visible]);

  const getComments = async () => {
    setLoading(true);
    try {
      const { accessToken } = await getTokens();
      const res = await authAPI(accessToken).get(endpoints['bulletins-comments'](bulletinID));
      setListComment(res.data);
    } catch (error) {
      console.error('Error fetching comments:', error);
    } finally {
      setLoading(false);
    }
  };

  const handlePostComment = async () => {
    if (comment.trim() !== '') {
      try {
        const { accessToken } = await getTokens();
        const res = await authAPI(accessToken).post(endpoints['bulletins-comments'](bulletinID), {
          content: comment,
        });
        setComment('');
        setPage(1); // Reset page state after posting comment
        getComments();
      } catch (error) {
        console.error('Error posting comment:', error);
      }
    }
  };

  return (
    <Modal visible={visible} animationType="slide">
      <View style={styles.container}>
        {loading && page === 1 ? (
          <ActivityIndicator />
        ) : (
          <ScrollView style={styles.scrollView}>
            {listComment.map((c) => (
              <CommentCard key={c.id} comment={c} />
            ))}
          </ScrollView>
        )}
        {loading && page > 1 && <ActivityIndicator />}
        <View style={styles.inputContainer}>
          <TextInput
            placeholder="Bình luận...."
            value={comment}
            multiline
            onChangeText={(text) => setComment(text)}
            style={styles.input}
          />
          <Button title="Gửi" onPress={handlePostComment} style={styles.button} />
          <Button title="Đóng" onPress={onClose} style={styles.button} />
        </View>
      </View>
    </Modal>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  scrollView: {
    width: '100%',
    marginBottom: 50,
  },
  inputContainer: {
    position: 'absolute',
    bottom: 20,
    flexDirection: 'row',
    width: '85%',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  input: {
    flex: 1,
    maxHeight: 100,
    borderWidth: 1,
    borderColor: 'gray',
    borderRadius: 5,
    paddingHorizontal: 10,
  },
  button: {
    marginLeft: 10,
  },
});

export default CommentSection;
