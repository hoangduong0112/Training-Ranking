// src/routers/Stack/HomeStack.js
import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import ProfileScreen from '../../screens/profile/ProfileScreen';

import MyActivities from '../../screens/profile/MyActivities';
const Stack = createStackNavigator();

const ProfileStack = () => {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen name="Profile" component={ProfileScreen} />
      
      <Stack.Screen name="MyActivities" component={MyActivities} />
    </Stack.Navigator>
  );
};

export default ProfileStack;
