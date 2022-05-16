export default {
    active: 'CommonLayout',
    footer: {
        componentName: 'AppMainFooter',
        data: {
            title: '',
            buttonTitle: '',
            imageUrl: false,
            class: 'footer--without-nav',
            showNav: true,
            showDelivery: true,
            display: true,
            href: '',
        },
    },
    header: {
        componentName: 'AppHeader',
        data: {
            showCarts: null,
        },
    },
    error: {
        code: null,
        level: null,
        message: '',
    },
}
