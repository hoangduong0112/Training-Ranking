import React, { useState, useEffect } from 'react';
import { View, FlatList, StyleSheet, Text, Alert } from 'react-native';
import * as DocumentPicker from 'expo-document-picker';
import { getTokens } from '../../utils/utils';
import { authAPI, endpoints } from '../../configs/APIs';
import CustomButton from '../../components/common/CustomButton';

const RegisteredStudentsScreen = ({ route }) => {
  const [registeredStudents, setRegisteredStudents] = useState([]);
  const { activityId } = route.params;

  useEffect(() => {
    const fetchData = async () => {
      try {
        const { accessToken } = await getTokens();
        const rs = await authAPI(accessToken).get(endpoints['activity-student'](activityId));
        setRegisteredStudents(rs.data);
      } catch (error) {
        console.error('Error fetching registered students:', error);
      }
    };

    fetchData();
  }, [activityId]);

  const handleUploadCSV = async () => {
    try {
      const { accessToken } = await getTokens();
      const file = await DocumentPicker.getDocumentAsync({
        type: 'text/csv',
        multiple: false
      });

      if (file.type === 'success') {
        const formData = new FormData();
        formData.append('file', {
          uri: file.uri,
          type: 'text/csv',
          name: file.name,
        });

        const response = await authAPI(accessToken).post(
          endpoints['activity-upload-attendance'](activityId),
          formData,
        );

        if (response.status === 200) {
          Alert.alert('Success', 'CSV file uploaded successfully');
        } else {
          Alert.alert('Error', 'Failed to upload CSV file');
        }
      }
    } catch (err) {
      console.error('Error uploading CSV file:', err);
      Alert.alert('Error', 'An error occurred while uploading the file');
    }
  };

  const renderItem = ({ item }) => (
    <View style={styles.item}>
      <Text style={styles.student}>{item.registered_students}</Text>
      <Text style={styles.status}>{item.status}</Text>
    </View>
  );

  if (registeredStudents.length === 0) {
    return (
      <View style={styles.container}>
        <Text>Chưa có sinh viên đăng ký</Text>
        <CustomButton onPress={handleUploadCSV} title="Upload CSV" />
      </View>
    );
  }

  const renderHeader = () => (
    <View style={styles.header}>
      <Text style={[styles.headerText, styles.student]}>Student</Text>
      <Text style={[styles.headerText, styles.status]}>Status</Text>
    </View>
  );

  return (
    <View style={styles.container}>
      <FlatList
        data={registeredStudents}
        renderItem={renderItem}
        keyExtractor={(item, index) => index.toString()}
        ListHeaderComponent={renderHeader}
      />
      <CustomButton onPress={handleUploadCSV} title="Upload CSV" />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    padding: 16,
  },
  item: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    backgroundColor: '#f9f9f9',
    padding: 20,
    marginBottom: 10,
    borderRadius: 5,
  },
  student: {
    fontSize: 16,
    fontWeight: 'bold',
  },
  status: {
    fontSize: 16,
    color: '#888',
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    backgroundColor: '#e0e0e0',
    paddingVertical: 10,
    paddingHorizontal: 20,
    marginBottom: 10,
    borderRadius: 5,
  },
  headerText: {
    fontSize: 16,
    fontWeight: 'bold',
  },
});

export default RegisteredStudentsScreen;
