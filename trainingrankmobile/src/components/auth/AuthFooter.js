import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import MyStyles from '../../styles/MyStyles';
import Theme from '../../styles/MyTheme';

const AuthFooter = ({ navigation, content, screen, linkText }) => {
   const handleNavigate = () => {
      if (screen === 'SignIn') navigation.goBack();
      else navigation.navigate(screen);
   };

   return (
      <View style={FooterStyle.FooterContainer}>
         <Text style={MyStyles.Bold}>{content}</Text>
         <TouchableOpacity onPress={handleNavigate}>
            <Text style={FooterStyle.FooterText}>{linkText}</Text>
         </TouchableOpacity>
      </View>
   );
};

const FooterStyle = StyleSheet.create({
   FooterContainer: {
      flexDirection: 'row',
      justifyContent: 'center',
      backgroundColor: 'white',
   },
   FooterText: {
      color: Theme.PrimaryColor,
      marginLeft: 5,
      fontFamily: Theme.Bold,
   },
});

export default AuthFooter;