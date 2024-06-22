// src/routers/Stack/HomeStack.js
import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import ProfileScreen from '../../screens/profile/ProfileScreen';
import MyPoints from '../../screens/profile/MyPoints';
import MyActivities from '../../screens/profile/MyActivities';
const Stack = createStackNavigator();

const ProfileStack = () => {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen name="Profile" component={ProfileScreen} />

      <Stack.Screen name="MyActivities" component={MyActivities} />
      
      <Stack.Screen name="MyPoints" component={MyPoints} />
    </Stack.Navigator>
  );
};

export default ProfileStack;
