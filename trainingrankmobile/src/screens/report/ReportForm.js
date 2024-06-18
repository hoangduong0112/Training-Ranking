import React, { useState } from 'react';
import { View, Text, TextInput, Button, StyleSheet, Image, TouchableOpacity, Alert } from 'react-native';
import * as ImagePicker from 'expo-image-picker';
import { getTokens } from '../../utils/utils';
import { authAPI, endpoints } from '../../configs/APIs';

const ReportForm = ({ route, navigation }) => {
  const { id } = route.params;
  const [reason, setReason] = useState('');
  const [proof, setProof] = useState(null);

  const pickImage = async () => {
    try {
      const result = await ImagePicker.launchImageLibraryAsync({
        mediaTypes: ImagePicker.MediaTypeOptions.Images,
        allowsEditing: true,
        aspect: [4, 3],
        quality: 1,
      });

      if (!result.cancelled) {
        setProof(result.uri); // Lưu URI của ảnh được chọn vào state proof
      }
    } catch (error) {
      console.error('Error picking image:', error);
    }
  };

  const handleSubmit = async () => {
    try {
      const { accessToken } = await getTokens();
      const reportData = {
        reason,
        proof, // Đưa URI của ảnh vào reportData
      };

      const response = await authAPI(accessToken).post(endpoints['activity-report'](id), reportData);

      Alert.alert('Success', 'Report submitted successfully!', [
        {
          text: 'OK',
          onPress: () => navigation.goBack(),
        },
      ]);
    } catch (error) {
      console.error('Error submitting report:', error);
      Alert.alert('Error', 'Failed to submit report. Please try again later.');

      if (error.response) {
        console.error('Response data:', error.response.data);
        console.error('Response status:', error.response.status);
        console.error('Response headers:', error.response.headers);
      } else if (error.request) {
        console.error('Request data:', error.request);
      } else {
        console.error('Error message:', error.message);
      }
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.label}>Lý do:</Text>
      <TextInput
        style={styles.input}
        value={reason}
        onChangeText={setReason}
        placeholder="Nhập lý do"
      />
      
      <Text style={styles.label}>Bằng chứng:</Text>
      <TouchableOpacity style={styles.imagePicker} onPress={pickImage}>
        {proof ? (
          <Image source={{ uri: proof }} style={styles.image} />
        ) : (
          <View style={styles.imagePlaceholder}>
            <Text>Chọn hình ảnh</Text>
          </View>
        )}
      </TouchableOpacity>
      
      <Button title="Gửi báo cáo" onPress={handleSubmit} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
    backgroundColor: '#fff',
  },
  label: {
    fontSize: 16,
    marginBottom: 8,
  },
  input: {
    height: 40,
    borderColor: '#ccc',
    borderWidth: 1,
    marginBottom: 16,
    paddingHorizontal: 8,
  },
  imagePicker: {
    alignItems: 'center',
    marginBottom: 16,
  },
  image: {
    width: 200,
    height: 200,
    resizeMode: 'contain',
    marginBottom: 8,
  },
  imagePlaceholder: {
    width: 200,
    height: 200,
    backgroundColor: '#ccc',
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 8,
  },
});

export default ReportForm;
