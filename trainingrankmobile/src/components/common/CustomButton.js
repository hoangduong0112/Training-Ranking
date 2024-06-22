import React from 'react';
import { TouchableOpacity, Text, StyleSheet, View } from 'react-native';
import { IconButton } from 'react-native-paper';

const CustomButton = ({ 
  onPress, 
  title, 
  backgroundColor = '#007BFF', 
  textColor = '#fff', 
  fontSize = 16, 
  paddingVertical = 12, 
  paddingHorizontal = 24,
  borderRadius = 8,
  marginVertical = 8, 
  icon, 
  iconSize = 20, 
  iconColor = '#fff', 
  style
}) => {
  return (
    <TouchableOpacity 
      style={[
        styles.button, 
        { 
          backgroundColor, 
          paddingVertical, 
          paddingHorizontal, 
          borderRadius,
          marginVertical 
        },
        style
      ]}
      onPress={onPress}
    >
      <View style={styles.content}>
        {icon && (
          <IconButton 
            icon={icon} 
            size={iconSize} 
            color={iconColor} 
            style={styles.icon} 
          />
        )}
        <Text style={[styles.buttonText, { color: textColor, fontSize }]}>{title}</Text>
      </View>
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  button: {
    alignItems: 'center',
    flexDirection: 'row',
  },
  buttonText: {
    fontWeight: 'bold',
  },
  content: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  icon: {
    marginRight: 8,
  },
});

export default CustomButton;
