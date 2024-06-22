import React, { useState } from 'react';
import { View, TextInput, Button, StyleSheet, Alert } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { authAPI, endpoints } from '../../configs/APIs'; // Import your API configuration
import { Picker } from '@react-native-picker/picker';
const SignUp = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const [role, setRole] = useState('');
  const navigation = useNavigation();

  const handleSignUp = async () => {
    // Implement your signup logic here
    try {
      const response = await authAPI.post(endpoints['sign-up'], {
        email,
        password,
        first_name: firstName,
        last_name: lastName,
        role,
      });

      if (role === 'SV') {
        navigation.navigate('StudentForm');
      } else {
        navigation.navigate('MainApp');
      }
    } catch (error) {
      Alert.alert('Error', 'Something went wrong during signup.');
    }
  };

  const roles = [
    { label: 'Sinh Viên', value: 'SV' },
    { label: 'CV', value: 'CV' },
    { label: 'TLSV', value: 'TLSV' },
  ];

  return (
    <View style={styles.container}>
      <TextInput
        style={styles.input}
        placeholder="Email"
        value={email}
        onChangeText={setEmail}
      />
      <TextInput
        style={styles.input}
        placeholder="Password"
        value={password}
        onChangeText={setPassword}
        secureTextEntry
      />
      <TextInput
        style={styles.input}
        placeholder="First Name"
        value={firstName}
        onChangeText={setFirstName}
      />
      <TextInput
        style={styles.input}
        placeholder="Last Name"
        value={lastName}
        onChangeText={setLastName}
      />
      <Picker
        selectedValue={role}
        style={styles.picker}
        onValueChange={(itemValue, itemIndex) => setRole(itemValue)}
      >
        {roles.map((role) => (
          <Picker.Item key={role.value} label={role.label} value={role.value} />
        ))}
      </Picker>
      <Button
        title="Sign Up"
        onPress={handleSignUp}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
    justifyContent: 'center',
    backgroundColor: '#fff',
  },
  input: {
    height: 40,
    borderColor: '#ccc',
    borderWidth: 1,
    marginBottom: 8,
    paddingHorizontal: 8,
  },
  picker: {
    height: 50,
    width: '100%',
    marginBottom: 8,
  },
});

export default SignUp;
