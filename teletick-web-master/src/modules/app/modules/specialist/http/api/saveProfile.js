import factory from '@/modules/http/api/requestFactory';

export default async(id, payload) => {
    return factory()
        .post(`/specialist/${ id }/update_profile`, payload);
}
