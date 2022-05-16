import axios  from "axios";
import store  from "@/modules/app/modules/auth/store";
import router from "@/modules/http/router";


export default ({ data }) => {
    let axiosObject = axios.create({
        baseURL: `${ process.env.VUE_APP_BASE_URL }/api/v1`,
        headers: {
            'X-Requested-With': 'XMLHttpRequest',
            'Content-Type': 'application/json',
        },

    });

    return axiosObject.post(`/user/${ data.user_id }/update`, {
        data
    })
};
