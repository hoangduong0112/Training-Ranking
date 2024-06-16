import { createContext, useContext, useEffect, useReducer } from 'react';
import { authAPI, endpoints } from '../../configs/APIs';
import { statusCode } from '../../configs/Constants';
import { getTokens, refreshAccessToken } from '../../utils/utils';
import { SignInAction, SignOutAction } from '../actions/UserAction';
import { userReducer } from '../reducers/UserReducer';

export const UserContext = createContext(null);
export const UserDispatchContext = createContext(null);

const initialState = {
   data: null,
   loading: true,
   isLoggedIn: false,
};

export const UserProvider = ({ children }) => {
   const [user, dispatch] = useReducer(userReducer, initialState);

   const checkLogged = async (retryCount = 0) => {
      const { accessToken, refreshToken } = await getTokens();

      if (!accessToken || !refreshToken) {
         dispatch(SignOutAction());
         return;
      }

      try {
         const user = await authAPI(accessToken).get(endpoints['me']);
         dispatch(SignInAction(user.data));
      } catch (error) {
         if (error.response) {
            errorStatus = error.response.status;
            if (
               (errorStatus !== statusCode.HTTP_401_UNAUTHORIZED && errorStatus !== statusCode.HTTP_403_FORBIDDEN) ||
               retryCount > 3
            ) {
               dispatch(SignOutAction());
               return;
            }

            const newAccessToken = await refreshAccessToken(refreshToken, dispatch);
            if (newAccessToken) checkLogged(retryCount + 1);
         } else console.error(error);
      }
   };

   useEffect(() => {
      checkLogged();
   }, []);

   return (
      <UserContext.Provider value={user}>
         <UserDispatchContext.Provider value={dispatch}>{children}</UserDispatchContext.Provider>
      </UserContext.Provider>
   );
};

export const useUser = () => {
   return useContext(UserContext);
};

export const useUserDispatch = () => {
   return useContext(UserDispatchContext);
};