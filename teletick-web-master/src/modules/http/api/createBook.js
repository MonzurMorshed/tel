import factory from '@/modules/http/api/requestFactory';

export default (user_id, payload) => {
    return factory()
        .post(`api/v1/specialist/${ user_id }/book/create`, payload);
}
