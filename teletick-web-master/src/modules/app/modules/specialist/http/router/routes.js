export default [
    {
        path     : '/specialist',
        layout   : 'CommonLayout',
        name     : 'specialist',
        title    : 'Specialist Register',
        component: () => import('@/modules/app/modules/specialist/views/SpecialistRegisterLanding'),
    },
    {
        path     : '/specialist/register',
        layout   : 'LoginRegisterLayout',
        name     : 'specialist.register',
        title    : 'Specialist Register',
        meta: { requiresAuth: true },
        component: () => import('@/modules/app/modules/specialist/views/SpecialistRegister'),
    },
    {
        path     : '/specialist/dashboard',
        layout   : 'SpecialistPanelLayout',
        name     : 'specialist.dashboard',
        title    : 'Specialist Dashboard',
        meta: { requiresAuth: true },
        component: () => import('@/modules/app/modules/specialist/views/dashboard/SpecialistDashboard'),
    },
    {
        path     : '/specialist/calendar',
        name     : 'specialist.calendar',
        layout   : 'SpecialistPanelLayout',
        meta: { requiresAuth: true },
        component: () => import('@/modules/app/modules/specialist/views/dashboard/SpecialistCalendar')
    },
    {
        path     : '/specialist/appointments',
        name     : 'specialist.appointments',
        layout   : 'SpecialistPanelLayout',
        meta: { requiresAuth: true },
        component: () => import('@/modules/app/modules/specialist/views/dashboard/SpecialistAppointments')
    },
    {
        path     : '/specialist/consultation',
        name     : 'specialist.consultation',
        layout   : 'SpecialistPanelLayout',
        meta: { requiresAuth: true },
        component: () => import('@/modules/app/modules/specialist/views/dashboard/SpecialistConsultations')
    },
    {
        path     : '/specialist/invoices',
        name     : 'specialist.invoices',
        layout   : 'SpecialistPanelLayout',
        meta: { requiresAuth: true },
        component: () => import('@/modules/app/modules/specialist/views/dashboard/SpecialistInvoices')
    },
    {
        path     : '/specialist/notifications',
        name     : 'specialist.notifications',
        layout   : 'SpecialistPanelLayout',
        meta: { requiresAuth: true },
        component: () => import('@/modules/app/modules/specialist/views/dashboard/SpecialistNotifications')
    },
    {
        path     : '/specialist/profile',
        name     : 'specialist.profile',
        layout   : 'SpecialistPanelLayout',
        meta: { requiresAuth: true },
        component: () => import('@/modules/app/modules/specialist/views/dashboard/SpecialistProfile')
    },
    {
        path     : '/specialist/add_calendar',
        name     : 'specialist.add_calendar',
        layout   : 'SpecialistPanelLayout',
        meta: { requiresAuth: true },
        component: () => import('@/modules/app/modules/specialist/views/dashboard/SpecialistAddCalendar')
    },
]
