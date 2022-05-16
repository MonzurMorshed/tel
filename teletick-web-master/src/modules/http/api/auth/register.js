import axios  from "axios";
import store  from "@/modules/app/modules/auth/store";
import router from "@/modules/http/router";


export default (payload) => {
    let axiosObject = axios.create({
        baseURL: `${process.env.VUE_APP_BASE_URL}`,
        headers: {
            'X-Requested-With': 'XMLHttpRequest',
            'Content-Type': 'application/json',
        },

    });

    return axiosObject.post('/api/v1/register', payload)

};
