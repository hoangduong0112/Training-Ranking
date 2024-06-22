import React, { useState, useEffect } from 'react';
import { View, Text, FlatList, TouchableOpacity, StyleSheet } from 'react-native';
import { authAPI, endpoints } from '../../configs/APIs';
import { getTokens } from '../../utils/utils';

const ReportScreen = () => {
  const [reports, setReports] = useState([]);

  useEffect(() => {
    fetchReports();
  }, []);

  const fetchReports = async () => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).get(endpoints['reports']);
      setReports(response.data);
    } catch (error) {
      console.error('Error fetching reports:', error);
    }
  };

  const handleAccept = async (reportId) => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).post(endpoints['reports-approve'](reportId));
      console.log(response.data);
      fetchReports();
    } catch (error) {
      console.error('Error accepting report:', error);
    }
  };

  const handleReject = async (reportId) => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).post(endpoints['reports-reject'](reportId));
      console.log(response.data); 
      fetchReports();
    } catch (error) {
      console.error('Error rejecting report:', error);
    }
  };

  const renderItem = ({ item }) => (
    <View style={styles.reportItem}>
      <Text style={styles.reportText}>Reason: {item.reason}</Text>
      <Text style={styles.reportText}>Status: {item.status}</Text>
      <View style={styles.actionButtons}>
        { item.status === 'pending' && ( <>
        <TouchableOpacity style={[styles.actionButton, { backgroundColor: '#28a745' }]} onPress={() => handleAccept(item.id)}>
          <Text style={styles.buttonText}>Accept</Text>
        </TouchableOpacity>
        <TouchableOpacity style={[styles.actionButton, { backgroundColor: '#dc3545' }]} onPress={() => handleReject(item.id)}>
          <Text style={styles.buttonText}>Reject</Text>
        </TouchableOpacity>
        </>
        )}
      </View>
    </View>
  );

  return (
    <View style={styles.container}>
      <FlatList
        data={reports}
        renderItem={renderItem}
        keyExtractor={(item) => item.student_activity.toString()}
        ListEmptyComponent={() => <Text>No reports available</Text>}
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
  reportItem: {
    backgroundColor: '#f9f9f9',
    padding: 20,
    marginBottom: 10,
    borderRadius: 5,
  },
  reportText: {
    fontSize: 16,
    marginBottom: 8,
  },
  actionButtons: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  actionButton: {
    paddingVertical: 8,
    paddingHorizontal: 16,
    borderRadius: 5,
  },
  buttonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: 'bold',
    textAlign: 'center',
  },
});

export default ReportScreen;
