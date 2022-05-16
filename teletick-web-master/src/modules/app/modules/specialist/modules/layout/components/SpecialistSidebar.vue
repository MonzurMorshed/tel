<template>
  <div class="sidebar__wrapper">
    <ul class="navbar-nav theme-brand flex-row text-center m-0" style="min-height: 45px">
      <li class="nav-item theme-logo" style="margin-left: 15px; cursor: pointer">
        <a @click="$router.push({ name: 'home' })">
          <img src="@/assets/logos/logo.png" class="navbar-logo" alt="logo">
        </a>
      </li>

      <li class="nav-item toggle-sidebar">
        <div class="custom-collapse-div">
          <i class="fa fa-bars sidebarCollapse bar-icon" aria-hidden="true"></i>
        </div>
      </li>
    </ul>
    <ul class="list-unstyled menu-categories ps" style="margin-top: 50px; padding: 10px">
      <router-link
          v-for="menuItem in menu"
          :to="{ name: menuItem.name }"
          custom
          :key="menuItem.name"
          v-slot="{ href, route, navigate, isActive, isExactActive }">
        <li class='menu' :class="[isActive && 'router-link-active', isExactActive && 'active']">
          <a @click="() => $router.push({ name: menuItem.name })" class="dropdown-toggle">
            <div>
              <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                    d="M0 15.1691C0.000817809 15.8626 0.562654 16.4244 1.25616 16.4253H15.7438C16.4373 16.4244 16.9992 15.8626 17 15.1691V4.7793H0V15.1691ZM10.4541 8.80015C10.289 8.63806 10.2864 8.37292 10.4484 8.20789C10.6104 8.04285 10.8756 8.0404 11.0406 8.20233L12.8887 10.0157C12.969 10.0946 13.0142 10.2022 13.0142 10.3147C13.0142 10.4271 12.969 10.5349 12.8887 10.6136L11.0406 12.427C10.8756 12.5889 10.6104 12.5864 10.4484 12.4214C10.2864 12.2564 10.289 11.9912 10.4541 11.8292L11.9974 10.3147L10.4541 8.80015ZM7.06654 13.3851L8.66847 7.0834C8.70445 6.93734 8.81584 6.8217 8.96043 6.78064C9.10518 6.73943 9.26073 6.77901 9.36819 6.88418C9.47548 6.98951 9.51834 7.14424 9.48006 7.28965L7.87814 13.5914C7.81974 13.8138 7.59288 13.9476 7.37011 13.8909C7.14718 13.8343 7.01175 13.6084 7.06654 13.3851ZM3.8393 10.0159L5.68738 8.20233C5.85258 8.0404 6.11772 8.04285 6.27964 8.20789C6.44157 8.37309 6.43912 8.63822 6.27408 8.80015L4.73055 10.3147L6.27408 11.8293C6.43912 11.9912 6.44157 12.2564 6.27964 12.4214C6.11772 12.5864 5.85258 12.5891 5.68738 12.427L3.8393 10.6136C3.75915 10.5349 3.71384 10.4271 3.71384 10.3147C3.71384 10.2022 3.75915 10.0946 3.8393 10.0159Z"
                    fill=""></path>
                <path
                    d="M15.7438 0.544922H1.25616C0.562654 0.54574 0.000817809 1.10758 0 1.80108V3.94309H17V1.80108C16.9992 1.10758 16.4373 0.54574 15.7438 0.544922Z"
                    fill=""></path>
              </svg>
              <span>{{ menuItem.text }}</span>
            </div>
          </a>
        </li>
      </router-link>
    </ul>
  </div>
</template>

<script>
export default {
  name: "SpecialistSidebar",

  data() {
    return {
      menu: [
        { name: 'specialist.dashboard', text: 'Statistic' },
        { name: 'specialist.calendar', text: 'Calendar' },
        { name: 'specialist.appointments', text: 'Appointments' },
        { name: 'specialist.consultation', text: 'Consultations' },
        { name: 'specialist.invoices', text: 'Invoices' },
        { name: 'specialist.notifications', text: 'Notifications' },
      ],
    }
  }
}
</script>

<style scoped>
.sidebar__wrapper {
  min-width: 264px;

  box-shadow: 0 0 0 0;
  background-color: #FFFFFF;
}
</style>
