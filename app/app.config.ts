export default defineAppConfig({
  global: {
    picture: {
      dark: '/avatar.png',
      light: '/avatar.png',
      alt: 'Brice Jordan Tchuengwe Ndengwe'
    },
    meetingLink: 'https://cal.com/',
    email: 'ndengbrice@gmail.com',
    available: true
  },
  ui: {
    colors: {
      primary: 'blue',
      neutral: 'neutral'
    },
    pageHero: {
      slots: {
        container: 'py-18 sm:py-24 lg:py-32',
        title: 'mx-auto max-w-xl text-pretty text-3xl sm:text-4xl lg:text-5xl',
        description: 'mt-2 text-md mx-auto max-w-2xl text-pretty sm:text-md text-muted'
      }
    }
  },
  footer: {
    credits: `Built with Nuxt UI • © ${new Date().getFullYear()}`,
    colorMode: false,
    links: [{
      'icon': 'i-simple-icons-github',
      'to': 'https://github.com/eulgen',
      'target': '_blank',
      'aria-label': 'GitHub'
    }, {
      'icon': 'i-simple-icons-linkedin',
      'to': 'https://www.linkedin.com/in/brice-tchuengwe-b55150215',
      'target': '_blank',
      'aria-label': 'LinkedIn'
    }]
  }
})
