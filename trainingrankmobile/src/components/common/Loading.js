import { ActivityIndicator, View } from 'react-native';
import MyStyles from '../../styles/MyStyles';
import Theme from '../../styles/MyTheme';

const Loading = ({ children, ...options }) => {
   return (
      <View style={{ ...MyStyles.Container, ...{ marginBottom: 16 }, ...options.style }}>
         {children}
         <ActivityIndicator size={options?.size ?? 'large'} color={Theme.PrimaryColor} />
      </View>
   );
};

export default Loading;