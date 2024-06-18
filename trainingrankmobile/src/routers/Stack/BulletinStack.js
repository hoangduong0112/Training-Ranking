// src/routers/Stack/HomeStack.js
import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import BulletinListScreen from '../../screens/bulletins/BulletinListScreen';
import BulletinDetailScreen from './../../screens/bulletins/BulletinDetailScreen';
import CreateBulletinScreen from '../../screens/bulletins/CreateBulletinScreen';
const Stack = createStackNavigator();

const BulletinStack = () => {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen name="BulletinDetailScreen" component={BulletinDetailScreen} />
      
      <Stack.Screen name="BulletinListScreen" component={BulletinListScreen} />
      
      <Stack.Screen name="CreateBulletinScreen" component={CreateBulletinScreen} />
    </Stack.Navigator>
  );
};

export default BulletinStack;
