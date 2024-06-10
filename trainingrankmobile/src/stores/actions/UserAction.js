const SIGN_IN = 'LOGIN';
const SIGN_OUT = 'LOGOUT';

export { SIGN_IN, SIGN_OUT };

const SignInAction = (payload) => {
    return {
        type: SIGN_IN,
        payload: payload,
    };
};

const SignOutAction = () => {
    return {
        type: SIGN_OUT,
    };
};


export { SignInAction, SignOutAction };