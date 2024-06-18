import React from 'react';
import { Image, Text, View, StyleSheet } from 'react-native';
import moment from 'moment';
import 'moment/locale/vi'; // Import Vietnamese locale for moment

const CommentCard = ({ comment }) => {
  return (
    <View style={styles.container}>
      <Image source={{ uri: comment.user.avatar }} style={styles.avatar} />
      <View style={styles.commentContent}>
        <View style={styles.commentHeader}>
          <Text style={styles.username}>{comment.user.username}</Text>
          <Text style={styles.commentDate}>{moment(comment.created_date).fromNow()}</Text>
        </View>
        <Text>{comment.content}</Text>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 10,
  },
  avatar: {
    width: 40,
    height: 40,
    borderRadius: 20,
    marginRight: 10,
  },
  commentContent: {
    maxWidth: '85%',
    backgroundColor: 'lightgray',
    borderRadius: 15,
    padding: 8,
    paddingRight: 20,
  },
  commentHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 4,
  },
  username: {
    fontWeight: 'bold',
  },
  commentDate: {
    color: 'gray',
  },
});

export default CommentCard;
