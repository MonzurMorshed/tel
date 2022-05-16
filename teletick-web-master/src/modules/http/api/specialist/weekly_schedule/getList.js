import factory from '@/modules/http/api/requestFactory';

export default async (specialist_id) => {
    let url = '/specialist/'+ specialist_id +'/weekly_schedule';

    return factory().get(url);
    // .get(url +`?name=${ name }&address=${ address }&page=${ page }${ type.join('&type[]=') }`);
}
