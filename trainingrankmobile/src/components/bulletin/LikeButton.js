import React, { useState } from 'react';
import { IconButton } from 'react-native-paper'
import { authAPI, endpoints } from '../../configs/APIs';

const LikeButton = ({ bulletinID, initialLiked }) => {
  const [liked, setLiked] = useState(initialLiked);

  const handleLike = async () => {
    try {
      await authAPI(accessToken).post(endpoints['bulletins-like'])
      setLiked(!liked);
    } catch (error) {
      console.error('Error liking the bulletin:', error);
    }
  };

  return (
    <IconButton
      icon={liked ? 'heart' : 'heart-outline'}
      color={liked ? 'red' : 'gray'}
      size={24}
      onPress={handleLike}
    />
  );
};

export default LikeButton;
