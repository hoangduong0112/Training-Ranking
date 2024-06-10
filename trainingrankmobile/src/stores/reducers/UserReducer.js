import { SIGN_IN, SIGN_OUT } from '../actions/UserAction';

export const userReducer = (state, action) => {
    switch (action.type) {
        case SIGN_IN:
            return {
                ...state,
                loading: false,
                isLoggedIn: true,
                data: action.payload,
            };
        case SIGN_OUT:
            return {
                ...state,
                data: null,
                loading: false,
                isLoggedIn: false,
            };
        default:
            return state;
    }
};