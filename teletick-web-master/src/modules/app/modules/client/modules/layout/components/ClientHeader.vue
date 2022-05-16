<template>
  <div class="header__container fixed-top">
    <header class="header navbar navbar-expand-sm" style="padding-left: 0;margin-left: 255px;">

      <ul class="navbar-item flex-row" style="margin-left: 0">
        <li class="nav-item align-self-center page-heading">
          <div class="page-header">
            <div class="page-title" style="margin-left: 0">
              <router-link :to="{ name: 'appointment.search' }" class="button-btn">
                <h3>Prendre un rendez-vous</h3>
              </router-link>
            </div>
          </div>
        </li>
      </ul>
      <ul class="navbar-item flex-row search-ul"></ul>
      <ul class="navbar-item flex-row navbar-dropdown">
        <li class="nav-item dropdown notification-dropdown">
          <a href="javascript:void(0);" class="nav-link dropdown-toggle" id="notificationDropdown"
             data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <img src="http://docare.fr/portalassets/img/bell1.png" class="notification_icon" alt="notification">
          </a>
          <div class="dropdown-menu position-absolute" aria-labelledby="notificationDropdown">
            <div class="notification-scroll">
            </div>
          </div>
        </li>


        <li class="nav-item dropdown language-dropdown more-dropdown">
          <div class="dropdown custom-dropdown-icon">
            <a class="dropdown-toggle btn custom-border-0" href="#" role="button" id="customDropdown"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding: 9px 35px 10px 15px;"><img
                src="http://docare.fr/portalassets/img/fr.png" class="flag-width" alt="flag"><span>Français</span>
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                   stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                   class="feather feather-chevron-down" style="top: 11px;">
                <polyline points="6 9 12 15 18 9"></polyline>
              </svg>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="customDropdown">
              <a class="dropdown-item" data-img-value="fr" data-value="French"
                 href="http://docare.fr/languageswitcher/webchange/french"><img
                  src="http://docare.fr/portalassets/img/fr.png" class="flag-width" alt="flag">
                Français </a>
              <a class="dropdown-item" data-img-value="ca" data-value="English"
                 href="http://docare.fr/languageswitcher/webchange/english"><img
                  src="http://docare.fr/portalassets/img/ca.png" class="flag-width" alt="flag"> Anglais</a>
            </div>
          </div>
        </li>
        <li class="nav-item dropdown user-profile-dropdown  order-lg-0 order-1">
          <a href="javascript:void(0);" class="nav-link dropdown-toggle user" id="userProfileDropdown"
             data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <img class="avatar-icon" src="http://docare.fr/uploadimages/default.jpg" alt=""> <span
              class="login-user-name"> jules Test </span>
          </a>
          <div class="dropdown-menu position-absolute" aria-labelledby="userProfileDropdown">
            <div class="dropdown-item">
              <router-link :to="{ name: 'client.profile' }" href=""><i class="fa fa-user fa-lg" aria-hidden="true"></i>&nbsp;&nbsp;Voir
                le profil</router-link>
            </div>
            <div class="dropdown-item">
              <a href="/"><i class="fa fa-sign-out fa-lg" aria-hidden="true"></i><img
                  src="http://docare.fr/portalassets/img/logout.png" class="dash_icon" alt="">&nbsp;&nbsp;Se déconnecter</a>
            </div>
          </div>
        </li>
      </ul>
    </header>
  </div>
</template>

<script>
export default {
  name: "ClientHeader"
}
</script>

<style scoped>
.header__container {
  z-index: 1030;
}

.button-btn {
  background: #4e54c8;
  background: linear-gradient(90deg, #A7D08E 0%, #537E36 100%);
  border-radius: 30px;
  cursor: pointer;
  font-weight: 500;
  color: #fff;
  letter-spacing: 1px;
  font-size: 14px;
  line-height: 21px;
  padding: 8px 25px;
  text-transform: uppercase;
  display: inline-block;
  vertical-align: middle;
  transform: perspective(1px) translateZ(0);
  position: relative;
  -webkit-transition: all linear 400ms;
  transition: all linear 400ms;
  border: none;
}

.button-btn h3 {
  color: #FFF;
  font-size: 14px;
}
.page-title {
  margin-left: 40px;
}
</style>
