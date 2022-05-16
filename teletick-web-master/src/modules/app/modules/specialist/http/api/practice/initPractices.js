import factory from '@/modules/http/api/requestFactory';

export default async(search = '') => {
    return factory()
        .get(!!search ? `/api/v1/practice?search=${ search }` : `/api/v1/practice`);
}
