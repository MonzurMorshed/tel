import factory from '@/modules/http/api/requestFactory';

export default async(payload) => {
    return factory()
        .post(`api/v1/specialist/reason/add`, payload);
}
