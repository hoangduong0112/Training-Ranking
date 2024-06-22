import React from 'react';
import { View, Text, StyleSheet, TouchableOpacity, Image } from 'react-native';
import moment from 'moment'; // Import moment correctly

const BulletinCard = ({ bulletin, onPress }) => {
  return (
    <TouchableOpacity onPress={onPress} style={styles.bulletinCard}>
      {bulletin.image && (
        <Image source={{ uri: bulletin.image }} style={styles.image} />
      )}
      <Text style={styles.title}>{bulletin.title}</Text>
      <Text style={styles.content}>{bulletin.content}</Text>
      <Text style={styles.date}>Ngày đăng: {moment(bulletin.created_date).fromNow()}</Text>
      {/* Use moment() to format date */}
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  bulletinCard: {
    padding: 16,
    marginBottom: 8,
    backgroundColor: '#f0f0f0',
    borderRadius: 8,
  },
  image: {
    width: '100%',
    height: 200,
    marginBottom: 8,
    borderRadius: 8,
  },
  title: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 8,
  },
  content: {
    fontSize: 16,
    marginBottom: 4,
  },
  date: {
    fontSize: 14,
    color: '#666',
  },
});

export default BulletinCard;
