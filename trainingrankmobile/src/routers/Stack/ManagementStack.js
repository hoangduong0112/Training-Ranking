// src/routers/Stack/HomeStack.js
import React from 'react';
import { createStackNavigator } from '@react-navigation/stack'
const Stack = createStackNavigator();

const ManagementStack = () => {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      {/* <Stack.Screen name="MyActivities" component={MyActivities} /> */}
    </Stack.Navigator>
  );
};

export default ManagementStack;
