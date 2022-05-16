import loginRequest from '@/modules/http/api/auth/login'
import infoRequest from '@/modules/http/api/auth/info'
import register    from "@/modules/http/api/auth/register";

const API_URL = 'http://localhost:8080/api/auth/';

class AuthService {
    login(user) {
        return axios
            .post(API_URL + 'signin', {
                username: user.username,
                password: user.password
            })
            .then(response => {
                if (response.data.accessToken) {
                    localStorage.setItem('user', JSON.stringify(response.data));
                }
                return response.data;
            });
    }
    logout() {
        localStorage.removeItem('user');
    }
    register(user) {
        return register(user).then((response) => {
            console.log('REGISTER RESPONSE');
        });
    }
}
export default new AuthService();
