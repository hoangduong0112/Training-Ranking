import React from 'react';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { MaterialCommunityIcons } from '@expo/vector-icons';
import Theme from '../styles/MyTheme';
import ActivityListScreen from '../screens/activities/ActivityListScreen';
import BulletinListScreen from '../screens/bulletins/BulletinListScreen';
import ProfileScreen from '../screens/profile/ProfileScreen';
import CreatedActivitiesScreen from '../screens/profile/CreatedActivities';
import { useUser } from '../stores/contexts/UserContext';
const Tab = createBottomTabNavigator();

const BottomTab = () => {
  const { data: userData } = useUser();

  return (
    <Tab.Navigator
      screenOptions={({ route }) => ({
        tabBarActiveTintColor: Theme.PrimaryColor,
        tabBarInactiveTintColor: 'black',
        tabBarHideOnKeyboard: true,
        headerShown: false,
        tabBarIcon: ({ focused }) => {
          let iconName;

          switch (route.name) {
            case 'Home':
              iconName = focused ? 'home' : 'home-outline';
              break;
            case 'Management':
              iconName = focused ? 'briefcase-eye' : 'briefcase-eye-outline';
              break;
            case 'Profile':
              iconName = focused ? 'account' : 'account-outline';
              break;
            case 'Bulletin':
              iconName = focused ? 'forum' : 'forum-outline';
              break;
            default:
              iconName = '';
          }

          return <MaterialCommunityIcons name={iconName} size={36} color={focused ? Theme.PrimaryColor : 'gray'} />;
        },
      })}
    >
      <Tab.Screen
        name="Home"
        component={ActivityListScreen}
        options={{ tabBarLabel: 'Hoạt động' }}
      />
      <Tab.Screen
        name="Bulletin"
        component={BulletinListScreen}
        options={{ tabBarLabel: 'Diễn đàn' }}
      />
      <Tab.Screen
        name="Profile"
        component={ProfileScreen}
        options={{ tabBarLabel: 'Thông tin' }}
      />
      {userData.user_role === 'TLSV' || userData.user_role === 'CV' ? (
        <Tab.Screen
          name="Management"
          component={CreatedActivitiesScreen}
          options={{ tabBarLabel: 'Quản trị' }}
        />
      ) : null}
    </Tab.Navigator>
  );
};

export default BottomTab;
