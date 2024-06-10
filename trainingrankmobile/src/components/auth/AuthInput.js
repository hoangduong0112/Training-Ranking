import { useState } from 'react';
import { StyleSheet } from 'react-native';
import { TextInput } from 'react-native-paper';
import Theme from '../../styles/MyTheme';

const AuthInput = ({ field, account, setAccount }) => {
   const [passwordVisible, setPasswordVisible] = useState(false);
   const [icon, setIcon] = useState(field.icon);

   const updateAccount = (field, value) => setAccount({ ...account, [field]: value });

   const handlePress = () => {
      setPasswordVisible(!passwordVisible);
      setIcon(!passwordVisible ? 'eye-off' : 'eye');
   };

   const isPassowrd = field.name === 'password' || field.name === 'confirm';

   return (
      <TextInput
         key={field.name}
         value={account[field.name]}
         style={InputStyle.Input}
         placeholder={field.label}
         keyboardType={field.keyboardType}
         cursorColor={Theme.PrimaryColor}
         underlineColor="transparent"
         activeUnderlineColor="transparent"
         onChangeText={(value) => updateAccount(field.name, value)}
         secureTextEntry={isPassowrd ? !passwordVisible : false}
         right={
            <TextInput.Icon
               icon={icon}
               onPress={isPassowrd ? handlePress : null}
               pointerEvents={isPassowrd ? 'auto' : 'none'}
            />
         }
      />
   );
};

const InputStyle = StyleSheet.create({
   Input: {
      backgroundColor: '#f1f4ff',
      borderWidth: 2,
      marginBottom: 20,
      borderColor: Theme.PrimaryColor,
   },
});

export default AuthInput;