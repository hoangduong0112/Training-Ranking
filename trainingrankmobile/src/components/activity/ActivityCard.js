
import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet } from 'react-native';

const ActivityCard = ({ instance, onPress }) => {
  return (
    <TouchableOpacity style={styles.card} onPress={onPress}>
      <View>
        <Text style={styles.title}>Tên hoạt động: {instance.title}</Text>
        <Text>Mô tả: {instance.description}</Text>
      </View>
      <Text style={styles.detailsButton}>View Details</Text>
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  card: {
    padding: 16,
    marginBottom: 16,
    backgroundColor: '#f9f9f9',
    borderRadius: 8,
    shadowColor: '#000',
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 4,
  },
  title: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 8,
  },
  detailsButton: {
    color: 'blue',
    marginTop: 10,
  },
});

export default ActivityCard;
