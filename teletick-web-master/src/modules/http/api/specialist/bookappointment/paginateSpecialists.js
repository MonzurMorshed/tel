import factory from '@/modules/http/api/requestFactory';

export default async (name, address, page = 1, type = '', perPage = 5) => {
    let url = '/appointment/specialist/paginate?page=' + page + '&perPage=' + perPage;

    if (name.length > 0) {
        url += '&name=' + name;
    }
    if (address.length > 0) {
        url += '&address=' + address
    }

    if (type.length > 0) {
        url += '&type=' + type
    }
    console.log('API::PAGE', page, type, name, address)
    console.log('API::PAGE::URL', url)


    return factory().get(url);

    // .get(url +`?name=${ name }&address=${ address }&page=${ page }${ type.join('&type[]=') }`);
}
