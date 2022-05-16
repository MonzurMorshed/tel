export default [
    {
        path     : '/appointment/search/',
        layout   : 'HeaderWithProfileLayout',
        name     : 'appointment.search',
        title    : 'Appointment specialist specialist',
        component: () => import('@/modules/app/modules/bookappointment/view/SearchSpecialist'),
    },
    {
        path     : '/appointment/specialist/book/:specialistId',
        layout   : 'HeaderWithProfileLayout',
        name     : 'appointment.specialist.book',
        title    : 'Book specialist',
        props: true,
        component: () => import('@/modules/app/modules/bookappointment/view/BookSpecialist'),
    },
    {
        path     : '/appointment/:specialistId/client/auth',
        layout   : 'HeaderWithProfileLayout',
        name     : 'appointment.client.auth',
        title    : 'Log in for continue',
        props: true,
        component: () => import('@/modules/app/modules/bookappointment/view/ClientAuthenticate'),
    },
    {
        path     : '/appointment/succeed',
        layout   : 'HeaderWithProfileLayout',
        name     : 'appointment.success',
        title    : 'Booking succeed',
        component: () => import('@/modules/app/modules/bookappointment/view/BookSuccess'),
    },
]
