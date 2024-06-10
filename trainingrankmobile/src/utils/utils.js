import { CLIENT_ID, CLIENT_SECRET } from '@env';
import AsyncStorage from '@react-native-async-storage/async-storage';
import APIs, { endpoints } from '../configs/APIs';
import { SignOutAction } from '../stores/actions/UserAction';

export const getTokens = async () => {
    const [[, accessToken], [, refreshToken]] = await AsyncStorage.multiGet(['access-token', 'refresh-token']);
 
    return { accessToken, refreshToken };
};
 
export const setTokens = async (tokens) => {
    let [accessToken, refreshToken] = [tokens.data.access_token, tokens.data.refresh_token];
    await AsyncStorage.multiSet([
       ['access-token', accessToken],
       ['refresh-token', refreshToken],
    ]);
 
    return { accessToken, refreshToken };
};
 
export const removeTokens = async () => {
    return await AsyncStorage.multiRemove(['access-token', 'refresh-token']);
};
 
export const refreshAccessToken = async (refreshToken, dispatch) => {
    try {
       const tokens = await APIs.post(endpoints['token'], {
          refresh_token: refreshToken,
          grant_type: 'refresh_token',
          client_id: CLIENT_ID,
          client_secret: CLIENT_SECRET,
       });
 
       const { accessToken } = await setTokens(tokens);
       return accessToken;
    } catch (error) {
       console.log(error);
       dispatch(SignOutAction());
       return null;
    }
}; 