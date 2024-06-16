import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { Icon } from 'react-native-paper';
import Theme from '../styles/MyTheme';
import ActivityListScreen from '../screens/activities/ActivityListScreen';
import BulletinListScreen from '../screens/bulletins/BulletinListScreen';
const Tab = createBottomTabNavigator();

const BottomTab = () => {
   return (
      <Tab.Navigator
         screenOptions={({ route }) => ({
            tabBarActiveTintColor: Theme.PrimaryColor,
            tabBarInactiveTintColor: 'black',
            tabBarHideOnKeyboard: true,
            headerShown: false,
            tabBarIcon: ({ focused }) => {
               let iconName, iconColor;

               switch (route.name) {
                  case 'Home':
                     iconName = focused ? 'home' : 'home-outline';
                     break;
                  case 'Notification':
                     iconName = focused ? 'bell' : 'bell-outline';
                     break;
                  case 'Profile':
                     iconName = focused ? 'account' : 'account-outline';
                     break;
                  case 'Forum':
                     iconName = focused ? 'forum' : 'forum-outline'
                  default:
                     iconName = '';
               }

               iconColor = focused ? Theme.PrimaryColor : 'gray';

               return <Icon color={iconColor} size={36} source={iconName} />;
            },
         })}
      >
         <Tab.Screen name="Home" component={ActivityListScreen} options={{ tabBarLabel: 'Hoạt động' }}></Tab.Screen>
         
         <Tab.Screen name="Bulletin" component={BulletinListScreen} options={{ tabBarLabel: 'Diễn đàn' }}></Tab.Screen>
      </Tab.Navigator>
   );
};

export default BottomTab;
