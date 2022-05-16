import state from './state';

const defaults = { ...state }

export default {
    SearchSpecialist(state) {
        return state.SearchSpecialist || { ...defaults };
    },

    paginatedSpecialists(state) {
        const pagination = state.SearchSpecialist.pagination;
        // const [ from, to ] = [
        //     pagination.current_page === 1 ? 1 : pagination.current_page * pagination.per_page - 1,
        //     pagination.current_page === 1 ? pagination.per_page - 1
        //                                   : pagination.current_page * pagination.per_page + pagination.per_page - 1
        // ];
        //
        // console.log('paginatedSpecialistsGeter', [ ...state.SearchSpecialist.list ].splice(from, to))
        // console.log('from,to    ', from, to)
        // return [ ...state.SearchSpecialist.list ].splice(from, to)

        console.log('state.SearchSpecialist.list', state.SearchSpecialist.list)
        return state.SearchSpecialist.list
    },

    pagination(state) {
        const pagination = state.SearchSpecialist.pagination;
        let res = [];
        let page = 0;

        if (pagination.current_page < 4) {
            return [
                ...((function* () {
                    while (++page <= 4) {
                        yield { title: page, value: page, isActive: page === +pagination.current_page }
                    }
                })()),
                { title: '...', value: null },
            ];
        }
        return [
            { title: '...', value: null },
            { title: pagination.current_page - 1, value: pagination.current_page - 1 },
            { title: pagination.current_page, value: pagination.current_page, isActive: true },
            { title: pagination.current_page + 1, value: pagination.current_page + 1 },
            { title: '...', value: null },
        ];
    },

    paginateSending(state) {
        return state.SearchSpecialist.paginateRequestSending;
    }
}
