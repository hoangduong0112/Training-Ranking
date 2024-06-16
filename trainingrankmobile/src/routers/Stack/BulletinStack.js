// src/routers/Stack/HomeStack.js
import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import BulletinListScreen from '../../screens/bulletins/BulletinListScreen';

const Stack = createStackNavigator();

const BulletinStack = () => {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen name="BulletinList" component={BulletinListScreen} />
    </Stack.Navigator>
  );
};

export default BulletinStack;
