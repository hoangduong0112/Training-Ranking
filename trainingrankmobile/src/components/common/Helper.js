import { StyleSheet } from 'react-native';
import { HelperText } from 'react-native-paper';
import Theme from '../../styles/MyTheme';

const Helper = ({ type, visible, message }) => {
   return (
      <HelperText type={type} visible={visible} style={HelperStyle.HelpText}>
         {message}
      </HelperText>
   );
};

const HelperStyle = StyleSheet.create({
   HelpText: {
      marginBottom: 12,
      marginTop: -16,
      fontSize: 14,
      fontFamily: Theme.Bold,
      textAlign: 'center',
   },
});

export default Helper;