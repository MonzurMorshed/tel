<template>
  <div style="background-color: #fff; padding: 0">
    <div class="container page__container">
      <div class="row align-items-center">

        <div class="col-lg-7">
          <img src="@/assets/content/speciality-page-bg.png" alt="Speciality page background">
        </div>

        <div class="col-lg-5">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <h1 class="first__section__header">Are you a practitioner?</h1>

              <p class="xs-margin-10px-bottom first__section__content__text">

                Join us, benefit from a free month and increase your turnover thanks to a complete and innovative
                solution.
              </p>

              <button @click="() => this.$router.push({ name: 'specialist.register' })"
                      class="btn btn-primary top-button new-btn join__button mt-4">
                Join Teletick
              </button>
            </div>
          </div>
        </div>

      </div>
    </div>

    <section class="specialist-page-padding whyteletick">


      <div class="container" id="custom_box_panel_desk">
        <div class="text-center section-heading">
          <h2 class="fourth-section-header pt-4">
            Pourquoi utiliser TeleTick ? </h2>
        </div>
        <div class="row">
          <div class="col-lg-3 col-md-12 sm-margin-20px-bottom">
            <div class="service-block2 text-center specialist-service-block">
              <div class="item-icon margin-20px-bottom">
                <img class="front-icon" src="http://docare.fr/webassets/img/content/specialist-icon-01.png" alt="">
              </div>
              <div class="item-text">
                <p class="fourth-section-p2 line-height-28 service-block-text">
                  Gagnez du temps en optimisant votre agenda
                </p>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-12 sm-margin-20px-bottom">
            <div class="service-block2 text-center specialist-service-block">
              <div class="item-icon margin-20px-bottom">
                <img class="front-icon" src="http://docare.fr/webassets/img/content/specialist-icon-02.png" alt="">
              </div>
              <div class="item-text">
                <p class="fourth-section-p2 line-height-28 service-block-text">
                  Rentabilisez vos rendez-vous physiques non honorés
                </p>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-12 sm-margin-20px-bottom">
            <div class="service-block2 text-center specialist-service-block">
              <div class="item-icon margin-20px-bottom">
                <img class="front-icon" src="http://docare.fr/webassets/img/content/specialist-icon-03.png" alt="">
              </div>
              <div class="item-text">
                <p class="fourth-section-p2 line-height-28 service-block-text">
                  Augmentez votre clientèle
                </p>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-12 sm-margin-20px-bottom">
            <div class="service-block2 text-center specialist-service-block">
              <div class="item-icon margin-20px-bottom">
                <img class="front-icon" src="http://docare.fr/webassets/img/content/specialist-icon-04.png" alt="">
              </div>
              <div class="item-text">
                <p class="fourth-section-p2 line-height-28 service-block-text">
                  Fidélisez vos clients actuels grâce à notre innovation d’usage
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="specialist_service">
      <div class="container">
        <div class="row align-items-center">

          <div class="col-md-6">
            <div class="row">
              <div class="col-md-8">
                <h2 class="about-us-title text-left">Une solution complète pour gérer votre activité en un seul
                  outil </h2>
              </div>
            </div>

          </div>
          <div class="col-md-6">
            <div class="row align-items-center">
              <div class="col-md-6 ">
                <div class="specialist_service-item">
                  <div class="service-svg">
                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path
                          d="M19.4558 24.2568C18.8022 24.2568 18.181 24.0949 17.5991 23.7703C15.9988 22.8787 14.9873 20.8663 14.2821 18.7935C12.9154 21.428 10.3202 25.1939 7.08107 24.0144C6.31809 23.7371 5.05725 22.884 5.19725 20.2993C5.25237 19.2861 5.52274 18.1556 5.94098 17.1258C3.97054 15.5534 0.547644 12.3091 0.0611597 9.08915C-0.159333 7.6262 0.216905 6.32161 1.18112 5.21215C2.21622 3.96794 3.62405 3.4972 5.24187 3.86469C8.40665 4.58392 12.0203 8.66391 13.8332 11.8339C15.5517 9.37614 19.5774 5.07828 23.1036 4.32667C24.6864 3.98894 26.0601 4.3923 27.0707 5.49564C27.6779 6.15887 28.3044 7.36283 27.8363 9.33327C27.1704 12.1314 24.5683 15.3968 22.7291 17.1581C23.1246 18.244 23.3311 19.4296 23.2803 20.4314C23.1884 22.275 22.3257 23.5525 20.854 24.0249C20.3737 24.1798 19.9073 24.2568 19.4558 24.2568ZM14.7493 13.765C14.8106 13.9409 14.8631 14.1089 14.9024 14.2637L15.0451 14.8368C15.6313 17.2001 16.613 21.1576 18.4767 22.1945C19.0122 22.4946 19.6098 22.5305 20.3019 22.3082C21.0299 22.0746 21.4254 21.4131 21.4796 20.3387C21.5129 19.6754 21.4131 18.9868 21.2346 18.349C21.1882 18.3726 21.1454 18.3927 21.1069 18.4059C20.0674 18.7987 18.3603 18.4382 17.6289 17.3681C17.3532 16.9639 16.8449 15.8789 18.0751 14.5096C18.7252 13.8411 19.5424 13.6723 20.3387 14.0196C20.9196 14.2725 21.4446 14.7887 21.8856 15.4502C23.4483 13.8236 25.7162 10.9625 26.1353 8.65866C26.2911 7.80557 26.1625 7.16859 25.7416 6.70923C25.1624 6.07837 24.4458 5.88063 23.4789 6.08537C19.8915 6.85535 15.1859 12.6914 14.7493 13.765ZM7.45818 18.2029C7.27356 18.7235 7.12394 19.2957 7.04344 19.8986C6.97782 20.3877 6.83082 22.0046 7.69705 22.3205C10.0778 23.1858 12.6476 18.2904 13.5165 16.1581C13.4386 15.8501 13.3651 15.5561 13.2951 15.2717L13.1534 14.7056C12.5374 12.2583 8.20803 6.38724 4.84114 5.62251C3.89092 5.40552 3.16381 5.64701 2.55396 6.38024C1.93185 7.09684 1.70348 7.89044 1.84348 8.82053C2.22059 11.3151 5.038 14.0441 6.79232 15.4913C7.35843 14.6435 8.03304 14.0222 8.74526 13.8464C9.146 13.7484 10.1548 13.6521 10.8968 14.8946C10.9091 14.9138 10.9196 14.9366 10.9309 14.9576C11.6257 16.3672 11.1759 17.4583 10.5232 18.0086C9.71648 18.692 8.4819 18.7558 7.45818 18.2029ZM8.2369 16.5719C8.66389 16.8397 9.1425 16.816 9.36125 16.6314C9.59486 16.4345 9.43037 15.9979 9.33062 15.7871C9.24487 15.6497 9.17838 15.5954 9.15913 15.5867C8.97363 15.6077 8.61314 15.9726 8.2369 16.5719ZM19.5337 15.6488C19.4969 15.6488 19.4602 15.6733 19.3911 15.7442C19.3456 15.7958 19.0061 16.1887 19.1181 16.3523C19.3272 16.6603 20.1365 16.844 20.4699 16.7207C20.4883 16.7093 20.5119 16.6988 20.5355 16.6822C20.231 16.1659 19.8994 15.7967 19.6177 15.6742C19.5844 15.6602 19.5591 15.6488 19.5337 15.6488Z"
                          fill="#537E36"></path>
                    </svg>
                  </div>
                  <h3>Simplicité</h3>
                  <p>L'outil a été pensé pour vous permettre de piloter votre calendrier. Sans aucune compétence
                    technique.</p>
                </div>
                <div class="specialist_service-item">
                  <div class="service-svg">
                    <svg width="22" height="18" viewBox="0 0 22 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd" clip-rule="evenodd"
                            d="M0 5.93354C0 2.5812 2.97835 0 6.47429 0C8.27637 0 9.86209 0.834379 11 1.914C12.1379 0.834379 13.7236 0 15.5257 0C19.0216 0 22 2.5812 22 5.93354C22 8.22993 21.0083 10.2494 19.6343 11.9564C18.2627 13.6605 16.4685 15.1067 14.7506 16.2819C14.0945 16.7308 13.4307 17.1448 12.8232 17.4503C12.2528 17.7372 11.5968 18 11 18C10.4032 18 9.74725 17.7372 9.1768 17.4503C8.56929 17.1448 7.9055 16.7308 7.24935 16.2819C5.53149 15.1067 3.73733 13.6605 2.36572 11.9564C0.991736 10.2494 0 8.22993 0 5.93354ZM6.47429 1.86207C3.86037 1.86207 1.88571 3.76026 1.88571 5.93354C1.88571 7.67581 2.6347 9.29793 3.84194 10.7978C5.05156 12.3006 6.67911 13.6265 8.32322 14.7513C8.94535 15.1769 9.53133 15.539 10.0326 15.7911C10.5709 16.0618 10.8827 16.1379 11 16.1379C11.1173 16.1379 11.4291 16.0618 11.9674 15.7911C12.4687 15.539 13.0547 15.1769 13.6768 14.7513C15.3209 13.6265 16.9484 12.3006 18.1581 10.7978C19.3653 9.29793 20.1143 7.67581 20.1143 5.93354C20.1143 3.76026 18.1396 1.86207 15.5257 1.86207C14.0245 1.86207 12.6227 2.7477 11.7475 3.87176C11.569 4.10097 11.2928 4.23529 11 4.23529C10.7072 4.23529 10.431 4.10097 10.2525 3.87176C9.37729 2.7477 7.9755 1.86207 6.47429 1.86207Z"
                            fill="#537E36"></path>
                    </svg>
                  </div>
                  <h3>Soutien</h3>
                  <p>Votre succès, c'est notre succès.
                    C'est pourquoi notre support chat répond en moins de 3mn en moyenne et reçoit 98% d'avis
                    positifs.</p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="specialist_service-item">
                  <div class="service-svg">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_145_767)">
                        <path
                            d="M23.9719 1.79165C23.9199 0.838307 23.1617 0.0801974 22.2084 0.0281661C20.2847 -0.0769276 16.5204 0.0253068 12.921 1.88704C11.0861 2.83617 9.14546 4.44534 7.59676 6.30196C7.57768 6.32484 7.55912 6.34785 7.54018 6.37078L4.0255 6.64228C3.44696 6.68699 2.93167 6.99023 2.6117 7.47417L0.213855 11.101C-0.0288164 11.468 -0.0673945 11.9273 0.11059 12.3297C0.288621 12.732 0.654434 13.0124 1.0892 13.0798L4.05034 13.5384C4.03989 13.596 4.02939 13.6535 4.01978 13.7111C3.9212 14.3008 4.11657 14.907 4.54248 15.3329L8.6671 19.4576C9.02021 19.8107 9.49735 20.0054 9.98626 20.0054C10.0869 20.0054 10.1882 19.9971 10.289 19.9802C10.3465 19.9706 10.4041 19.9601 10.4616 19.9497L10.9202 22.9109C10.9876 23.3456 11.268 23.7115 11.6703 23.8895C11.8377 23.9635 12.0148 24.0001 12.1912 24.0001C12.4388 24 12.6847 23.9279 12.899 23.7862L16.5258 21.3884C17.0098 21.0683 17.313 20.553 17.3576 19.9746L17.6291 16.4599C17.6521 16.441 17.6751 16.4224 17.698 16.4033C19.5547 14.8546 21.1639 12.914 22.113 11.079C23.9748 7.47946 24.0768 3.71517 23.9719 1.79165ZM15.7503 20.2153L12.281 22.509L11.834 19.6231C13.3003 19.192 14.7507 18.5016 16.1326 17.5766L15.9557 19.8662C15.9447 20.009 15.8698 20.1363 15.7503 20.2153ZM9.66146 18.4632L5.53679 14.3385C5.43156 14.2333 5.3829 14.0854 5.40676 13.9429C5.52939 13.2097 5.71993 12.5116 5.95581 11.8541L12.1446 18.0429C11.3549 18.3258 10.6475 18.4945 10.0571 18.5932C9.9144 18.617 9.7667 18.5684 9.66146 18.4632ZM4.13382 8.04435L6.42339 7.86749C5.49835 9.24932 4.80789 10.6998 4.37678 12.166L1.49096 11.7191L3.78475 8.24976C3.86378 8.13023 3.99104 8.05537 4.13382 8.04435ZM16.7973 15.3234C15.6614 16.2709 14.5588 16.9562 13.5424 17.4521L6.5477 10.4573C7.19729 9.13059 7.99009 8.02579 8.67662 7.20276C10.1098 5.48456 11.8923 4.00232 13.5671 3.13607C16.8706 1.42734 20.3511 1.33532 22.1318 1.43226C22.3675 1.4451 22.5549 1.63256 22.5678 1.86829C22.6649 3.64898 22.5727 7.12945 20.8639 10.433C19.9977 12.1077 18.5155 13.8902 16.7973 15.3234Z"
                            fill="#537E36"></path>
                        <path
                            d="M16.4413 11.0736C17.3414 11.0735 18.2419 10.7309 18.9271 10.0456C19.5912 9.38161 19.9568 8.49876 19.9568 7.55977C19.9568 6.62077 19.5911 5.73792 18.9271 5.07394C17.5564 3.70317 15.3261 3.70327 13.9555 5.07394C13.2915 5.73792 12.9258 6.62077 12.9258 7.55977C12.9258 8.49876 13.2915 9.38161 13.9555 10.0456C14.6409 10.731 15.5409 11.0737 16.4413 11.0736ZM14.9497 6.06825C15.3609 5.65702 15.9011 5.45142 16.4412 5.45142C16.9814 5.45142 17.5215 5.65702 17.9327 6.06825C18.3311 6.46664 18.5505 6.99633 18.5505 7.55972C18.5505 8.12311 18.3311 8.65284 17.9327 9.05123C17.1104 9.87365 15.7721 9.87361 14.9497 9.05123C14.5513 8.65284 14.3319 8.12316 14.3319 7.55977C14.3319 6.99637 14.5514 6.46664 14.9497 6.06825Z"
                            fill="#537E36"></path>
                        <path
                            d="M0.718727 19.779C0.89868 19.779 1.07863 19.7104 1.21588 19.5731L3.51149 17.2775C3.78609 17.0029 3.78609 16.5577 3.51149 16.2831C3.23695 16.0085 2.79173 16.0085 2.51713 16.2831L0.22157 18.5787C-0.0530234 18.8533 -0.0530234 19.2985 0.22157 19.5731C0.35882 19.7104 0.538773 19.779 0.718727 19.779Z"
                            fill="#537E36"></path>
                        <path
                            d="M5.61377 18.3856C5.33923 18.111 4.89401 18.111 4.61941 18.3856L0.205945 22.7991C-0.0686484 23.0737 -0.0686484 23.5189 0.205945 23.7935C0.343242 23.9308 0.523148 23.9994 0.703102 23.9994C0.883055 23.9994 1.06301 23.9308 1.20026 23.7934L5.61373 19.38C5.88837 19.1054 5.88837 18.6602 5.61377 18.3856Z"
                            fill="#537E36"></path>
                        <path
                            d="M6.72421 20.4901L4.4286 22.7857C4.15401 23.0603 4.15401 23.5055 4.4286 23.7801C4.5659 23.9174 4.74585 23.9861 4.92576 23.9861C5.10566 23.9861 5.28566 23.9174 5.42291 23.7801L7.71852 21.4845C7.99312 21.2099 7.99312 20.7647 7.71852 20.4901C7.44398 20.2155 6.99876 20.2155 6.72421 20.4901Z"
                            fill="#537E36"></path>
                      </g>
                      <defs>
                        <clipPath id="clip0_145_767">
                          <rect width="24" height="24" fill="white"></rect>
                        </clipPath>
                      </defs>
                    </svg>
                  </div>
                  <h3>Efficacité</h3>
                  <p>Avec Docare, reprenez le contrôle sur votre communication grâce aux campagnes marketing par SMS
                    (codes promo, demandes
                    d’avis, etc…)</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="specialist-page-padding pricing-plans-container">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <h2 class="plan_title">Des formules qui s’adaptent à vos besoins.</h2>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-8">
            <div class="row">
              <div class="col-md-6 p-2">
                <div class="pricing-plan recommended">
                  <div>
                    <div class="pricing-plan-label">
                      <strong>Offre premium</strong>
                      (15 jours gratuits et sans engagement)
                    </div>
                    <h3>
                      Pilotage de tous vos activités (Cabinet + marketing)
                    </h3>

                    <p>Référencement, visibilité, assistance au paramétrage, formation à distance, support client par
                      vidéo. </p>

                    <div class="pricing-plan-features">
                      <ul>
                        <li>Agenda en ligne (planning, prestations, horaires)</li>
                        <li>Statistiques de votre chiffre d'affaires</li>
                        <li>Visibilité en ligne sur Docare.fr</li>
                        <li>Programme de Formations</li>
                        <li>Multi prestations et adresses</li>
                        <li>Evénements / Formations / Ateliers</li>
                        <li>Campagnes marketing : SMS (Promo, etc...)</li>
                        <li>Shooting photo annuel</li>
                      </ul>
                    </div>
                  </div>
                  <div>
                    <strong class="pricing-plan_price">49.99 €</strong>
                    <button>Démarrer ma période d’essaie </button>
                  </div>
                </div>
              </div>
              <div class="col-md-6 p-2">
                <div class="pricing-plan recommended-badge">
                  <div>
                    <div class="pricing-plan-label">
                      <strong>Offre classique</strong>
                      (15 jours gratuits et sans engagement)
                    </div>
                    <h3>
                      Gestion efficace votre cabinet
                    </h3>

                    <p>Référencement, visibilité, calendrier en ligne, Rappel des rdv, support client </p>

                    <div class="pricing-plan-features">
                      <ul>
                        <li>Agenda en ligne (planning, prestations, horaires)</li>
                        <li>Statistiques de votre chiffre d'affaires</li>
                        <li>Visibilité en ligne sur Docare.fr</li>
                        <li>Multi prestations et adresses</li>
                        <li>Service client 5j/7</li>
                      </ul>


                    </div>
                  </div>
                  <div>
                    <strong class="pricing-plan_price">29.99 €</strong>
                    <button>Démarrer ma période d’essaie </button>
                  </div>
                </div>
              </div>
            </div>
          </div>


        </div>

      </div>
    </section>
    <section>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-10">
            <table class="price-table">
              <tbody>
              <tr class="price-table-head">
                <td></td>
                <td>
                  <span>Offre premium</span>
                </td>
                <td>
                  <span>Offre solo</span>
                </td>
              </tr>
              <tr class="price">
                <td>
                  RÉFÉRENCEMENT
                </td>
                <td></td>
                <td></td>
              </tr>

              <tr>
                <td>Visibilité en ligne sur uala.fr
                </td>
                <td><i class="fas fa-check"></i></td>
                <td><i class="fas fa-check"></i></td>
              </tr>
              <tr>
                <td>Collecte des avis clients</td>
                <td><i class="fas fa-check"></i></td>
                <td><i class="fas fa-check"></i></td>
              </tr>
              <tr class="price">
                <td>
                  AGENDA
                </td>
                <td></td>
                <td></td>
              </tr>

              <tr>
                <td> Agenda en ligne (planning, prestations, horaires)</td>
                <td><i class="fas fa-check"></i></td>
                <td><i class="fas fa-check"></i></td>
              </tr>
              <tr>
                <td>Rappel des rendez-vous (SMS &amp; email)</td>
                <td><i class="fas fa-check"></i></td>
                <td><i class="fas fa-check"></i></td>
              </tr>
              <tr>
                <td>Synchronization of appointments</td>
                <td><i class="fas fa-check"></i></td>
                <td><i class="fas fa-check"></i></td>
              </tr>

              <tr class="price">
                <td>
                  TABLEAU DE BORD
                </td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td>Bilan des rendez-vous</td>
                <td><i class="fas fa-check"></i></td>
                <td><i class="fas fa-check"></i></td>
              </tr>
              <tr>
                <td>Statistiques chiffre d'affaires</td>
                <td><i class="fas fa-check"></i></td>
                <td><i class="fas fa-check"></i></td>
              </tr>
              <tr>
                <td>Echange de fichiers</td>
                <td><i class="fas fa-check"></i></td>
                <td><i class="fas fa-check"></i></td>
              </tr>
              <tr class="price">
                <td>
                  MODULE DE CONSULTATION
                </td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td>Paiement en ligne</td>
                <td><i class="fas fa-check"></i></td>
                <td><i class="fas fa-check"></i></td>
              </tr>
              <tr>
                <td>Rendez-vous physique &amp; vidéo</td>
                <td><i class="fas fa-check"></i></td>
                <td><i class="fas fa-check"></i></td>
              </tr>
              <tr>
                <td>Evénements / Formations / Ateliers</td>
                <td><i class="fas fa-check"></i></td>
                <td></td>
              </tr>
              <tr class="price">
                <td>
                  OUTILS MARKETING
                </td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td>Campagne SMS</td>
                <td><i class="fas fa-check"></i></td>
                <td></td>
              </tr>
              <tr>
                <td>Code promo</td>
                <td><i class="fas fa-check"></i></td>
                <td></td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>

      </div>
    </section>
    <section class="specialist-page-padding" style="background: #F9F9F9!important;">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-sm-12 col-lg-8">
            <h3 class="nous-summens-text"> Nous sommes constamment à la recherche de spécialistes qualifiés, prêts à
              relever les défis du numérique.
              En faites vous partie ?
            </h3>
          </div>
        </div>
        <div class="row py-3">
          <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 text-center">
            <router-link :to="{ name: 'specialist.register' }">
              <button type="button" class="btn btn-primary top-button rejoi-button btn-rejoin">Rejoignez TeleTick
              </button>
            </router-link>
          </div>
        </div>
      </div>
    </section>

  </div>
</template>

<script>
export default {
  name: "SpecialistRegisterLanding"
}
</script>

<style scoped>
.page__container {
  padding: 165px 0px 85px;
}

.first__section__header {
  font-style: normal;
  font-weight: 600;
  font-size: 42px;
  line-height: 54px;
  color: #2C3F34;
  margin-bottom: 25px;
}

.first__section__content__text {
  font-style: normal;
  font-weight: 300;
  font-size: 20px;
  line-height: 38px;
  color: #2C3F34;
  opacity: 0.8;
}

.join__button {
  background: linear-gradient(
      90deg, #A7D08E 0%, #537E36 100%);
  font-weight: 500;
  color: #fff;
  letter-spacing: 1px;
  font-size: 14px;
  line-height: 21px;
  border-radius: 30px;
  text-transform: uppercase;
  transform: perspective(1px) translateZ(0);
  position: relative;
  transition: all linear 400ms;
  border: none;
  height: 49px;
  width: 255px;
}

.second__section {
  background: #F9F9F9;
  padding: 90px 0 10px;
}

.second__section__title {
  font-style: normal;
  font-size: 36px;
  align-items: center;
  text-align: center;
  color: #2C3F34;
  margin-bottom: 0;
  font-weight: 600;
  position: relative;
  line-height: 140%;
}

.whyteletick {
  background: #F9F9F9;
  padding: 90px 0 120px;
}

.section-heading {
  margin-bottom: 60px;
  text-align: center;
}

.fourth-section-header {
  font-style: normal;
  font-size: 36px;
  align-items: center;
  text-align: center;
  color: #2C3F34;
}

.service-block2 {
  position: relative;
  padding: 50px 20px;
  background: #fff;
  border-radius: 5px;
  margin-bottom: 10px;
}

.specialist-service-block {
  padding: 40px 5px 30px 5px;
  height: 100%;
}

.specialist-service-block .item-icon {
  margin-bottom: 30px;
}

.service-block-text {
  font-style: normal;
  font-weight: 600;
  font-size: 18px;
  line-height: 26px;
  text-align: center;
  color: #2C3F34;
  opacity: 0.8;
}

.service-block2 p {
  max-width: 70%;
  margin: 0 auto;
}

.whyteletick .service-block2 p {
  max-width: 92%;
}

.about-us-title {
  font-style: normal;
  font-weight: 600;
  font-size: 36px;
  line-height: 50px;
  text-align: center;
  color: #2C3F34;
}

.text-left {
  text-align: left !important;
}

.specialist_service-item {
  background-color: #F9F9F9;
  border-radius: 10px;
  padding: 50px 35px 45px 50px;
  margin: 20px 0;
}

.specialist_service-item .service-svg {
  background: rgba(167, 208, 142, 0.4);
  border-radius: 50%;
  width: 50px;
  height: 50px;
  position: relative;
}

.specialist_service-item svg {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.specialist_service-item h3 {
  font-weight: 600;
  font-size: 20px;
  line-height: 26px;
  color: #2C3F34;
  margin-top: 10px;
  margin-bottom: 14px;
}

.specialist_service-item p {
  font-weight: normal;
  font-size: 14px;
  line-height: 24px;
  color: #2C3F34;
  opacity: 0.8;
}

.pricing-plans-container {
  padding: 145px 0px 130px;
  background-color: #F9F9F9;
}

.plan_title {
  font-weight: 600;
  font-size: 36px;
  line-height: 50px;
  margin-bottom: 30px;
  text-align: center;
  color: #2C3F34;
}

.pricing-plan:last-of-type {
  border-left: none;
  border-top-right-radius: 6px;
  border-bottom-right-radius: 6px;
}

.pricing-plan:first-of-type {
  border-right: none;
  border-top-left-radius: 6px;
  border-bottom-left-radius: 6px;
}

.pricing-plan {
  padding: 50px 40px 50px 50px;
  position: relative;
  background-color: #fff;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.pricing-plan.recommended:before {
  top: 0;
  right: 40px;
  content: '';
  height: 50px;
  width: 50px;
  display: block;
  position: absolute;
  background-repeat: no-repeat;
  background-position: center;
  background-size: inherit;
  background-image: url("data:image/svg+xml,%3Csvg width='49' height='49' viewBox='0 0 49 49' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M49 0L49 39C49 43.7141 49 46.0711 47.5355 47.5355C46.0711 49 43.714 49 39 49L10 49C5.28596 49 2.92893 49 1.46447 47.5355C1.80087e-06 46.0711 1.9039e-06 43.714 2.10995e-06 39L3.8147e-06 -2.14186e-06L49 0Z' fill='url(%23paint0_linear_222_2)'/%3E%3Cpath d='M24.8308 15.497C24.4606 14.8343 23.5394 14.8343 23.1692 15.497L20.5624 20.1642C20.3796 20.4916 20.0635 20.715 19.7033 20.7715L14.818 21.5381C13.9975 21.6668 13.7097 22.7431 14.3487 23.2931L17.988 26.4255C18.3249 26.7155 18.4833 27.1729 18.4015 27.6193L17.4495 32.8132C17.299 33.6342 18.1286 34.2722 18.8405 33.8828L23.4406 31.3664C23.7908 31.1749 24.2092 31.1749 24.5594 31.3664L29.1595 33.8828C29.8714 34.2722 30.701 33.6342 30.5505 32.8132L29.5985 27.6193C29.5167 27.1729 29.6751 26.7155 30.012 26.4255L33.6513 23.2931C34.2903 22.7431 34.0025 21.6668 33.182 21.5381L28.2967 20.7715C27.9365 20.715 27.6204 20.4916 27.4376 20.1642L24.8308 15.497Z' fill='white'/%3E%3Cdefs%3E%3ClinearGradient id='paint0_linear_222_2' x1='17.15' y1='3.99737' x2='17.7943' y2='31.3758' gradientUnits='userSpaceOnUse'%3E%3Cstop stop-color='%23EEA647'/%3E%3Cstop offset='1' stop-color='%23EE8C5D'/%3E%3C/linearGradient%3E%3C/defs%3E%3C/svg%3E");
}

.pricing-plan-label {
  font-weight: 500;
  font-size: 12px;
  line-height: 18px;
  color: #2C3F34;
}

.pricing-plan-label strong {
  font-weight: 600;
  font-size: 21px;
  line-height: 31px;
  color: #2C3F34;
  margin-right: 5px;
}

.pricing-plan h3 {
  font-weight: 600;
  font-size: 14px;
  line-height: 24px;
  color: #2C3F34;
  margin-top: 20px;
  margin-bottom: 15px;
}

.pricing-plan p {
  font-weight: normal;
  font-size: 12px;
  line-height: 22px;
  color: rgba(44, 63, 52, 0.5);
  max-width: 70%;
  min-height: 66px;
}

.pricing-plan-features ul {
  padding: 0;
  margin: 0;
}

.pricing-plan-features ul li {
  font-weight: normal;
  font-size: 14px;
  line-height: 32px;
  color: rgba(44, 63, 52, 0.5);
  background-position: left center;
  background-repeat: no-repeat;
  padding-left: 30px;
  background-size: inherit;
  background-image: url("data:image/svg+xml,%3Csvg width='18' height='18' viewBox='0 0 18 18' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M9 0C4.03746 0 0 4.03746 0 9C0 13.9625 4.03746 18 9 18C13.9625 18 18 13.9625 18 9C18 4.03746 13.9625 0 9 0ZM7.87501 13.4034L4.26709 9.79544L5.8579 8.20463L7.87501 10.2217L12.1421 5.95465L13.7329 7.54546L7.87501 13.4034Z' fill='url(%23paint0_linear_145_854)'/%3E%3Cdefs%3E%3ClinearGradient id='paint0_linear_145_854' x1='1.46842' y1='11.7' x2='11.5258' y2='11.4633' gradientUnits='userSpaceOnUse'%3E%3Cstop stop-color='%23EEA647'/%3E%3Cstop offset='1' stop-color='%23EE8C5D'/%3E%3C/linearGradient%3E%3C/defs%3E%3C/svg%3E%0A");
}

.pricing-plan_price {
  font-weight: bold;
  font-size: 32px;
  line-height: 26px;
  align-items: center;
  color: #2C3F34;
  display: block;
  text-align: center;
  margin-top: 20px;
  margin-bottom: 22px;
}

.pricing-plan button {
  background: #A7D08E;
  border: unset;
  border-radius: 30px;
  font-weight: 600;
  font-size: 16px;
  line-height: 24px;
  text-transform: uppercase;
  color: #FFFFFF;
  margin: 0 auto;
  display: block;
  min-height: 45px;
  width: 85%;
}

.recommended-badge .pricing-plan-features ul li {
  background-image: url("data:image/svg+xml,%3Csvg width='18' height='18' viewBox='0 0 18 18' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M9 0C4.03746 0 0 4.03746 0 9C0 13.9625 4.03746 18 9 18C13.9625 18 18 13.9625 18 9C18 4.03746 13.9625 0 9 0ZM7.87501 13.4034L4.26709 9.79544L5.8579 8.20463L7.87501 10.2217L12.1421 5.95465L13.7329 7.54546L7.87501 13.4034Z' fill='%23A7D08E'/%3E%3C/svg%3E");
}

.price-table {
  width: 90%;
  border-collapse: collapse;
  border: 0 none;
}

.price-table-head {
  border-bottom: unset !important;
}

.price-table tr.price-table-head {
  color: #FFFFFF;
}

.price-table tr td:first-child {
  border-left: 0 none;
  width: 40%;
}
.price-table tr td:nth-child(2) {
  padding: 8px 48px;
  width: 30%;
}
.price-table tr td:nth-child(3) {
  padding: 8px 48px;
  width: 30%;
}
.price-table tr.price-table-head td:not(:first-child) {
  font-weight: 600;
  font-size: 18px;
  line-height: 27px;
  padding: 10px 20px;
  text-align: center;
  color: #2C3F34;
}
.price-table tr.price-table-head td:not(:first-child) span {
  display: block;
  margin: 0 auto;
  border-bottom: 4px solid #FF9739;
  padding-bottom: 10px;
}

@media(min-width: 1024px) {
  .price-table tr.price-table-head td:not(:first-child) span {
    width: 75%;
  }
}
.price-table tr.price {
  font-weight: 600;
  font-size: 16px;
  line-height: 24px;
  color: #2C3F34;
  border-bottom: unset;
}

.price-table tr td {
  padding: 10px 52px;
  font-weight: normal;
  font-size: 14px;
  line-height: 24px;
}

.price-table tr.price td {
  padding-top: 30px;
  font-weight: 600;
  font-size: 16px;
  line-height: 24px;
}

.price-table tr {
  color: rgba(44, 63, 52, 0.5);
  border-bottom: 1px solid #EFEFEF;
}

.price-table .fa-check {
  color: transparent;
  height: 18px;
  width: 18px;
  display: block;
  margin: 0 auto;
  background-image: url("data:image/svg+xml,%3Csvg width='18' height='18' viewBox='0 0 18 18' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M9 0C4.03746 0 0 4.03746 0 9C0 13.9625 4.03746 18 9 18C13.9625 18 18 13.9625 18 9C18 4.03746 13.9625 0 9 0ZM7.87501 13.4034L4.26709 9.79544L5.8579 8.20463L7.87501 10.2217L12.1421 5.95465L13.7329 7.54546L7.87501 13.4034Z' fill='url(%23paint0_linear_145_869)'/%3E%3Cdefs%3E%3ClinearGradient id='paint0_linear_145_869' x1='1.46842' y1='11.7' x2='11.5258' y2='11.4633' gradientUnits='userSpaceOnUse'%3E%3Cstop stop-color='%23EEA647'/%3E%3Cstop offset='1' stop-color='%23EE8C5D'/%3E%3C/linearGradient%3E%3C/defs%3E%3C/svg%3E%0A");
}

.price-table tr td:nth-child(3) .fa-check {
  background-image: url("data:image/svg+xml,%3Csvg width='18' height='18' viewBox='0 0 18 18' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M9 0C4.03746 0 0 4.03746 0 9C0 13.9625 4.03746 18 9 18C13.9625 18 18 13.9625 18 9C18 4.03746 13.9625 0 9 0ZM7.87501 13.4034L4.26709 9.79544L5.8579 8.20463L7.87501 10.2217L12.1421 5.95465L13.7329 7.54546L7.87501 13.4034Z' fill='%23A7D08E'/%3E%3C/svg%3E");
}

.nous-summens-text {
  font-style: normal;
  font-weight: 600;
  font-size: 30px;
  line-height: 40px;
  text-align: center;
  color: #2C3F34;
  margin: 0 auto;
  align-items: center;
}

.top-button:before {
  background: #537E36;
  content: "";
  position: absolute;
  z-index: -1;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  display: inline-block;
  -ms-transform: scaleX(0);
  transform: scaleX(0);
  -webkit-transform-origin: 51%;
  transform-origin: 51%;
  -webkit-transition-property: -webkit-transform;
  transition-property: transform;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  border-radius: 22px;
  border: none;
}

.rejoi-button {
  height: 49px;
  width: 255px;
  margin-top: 35px;
  margin-bottom: 30px;
}

.top-button {
  background: linear-gradient(90deg, #A7D08E 0%, #537E36 100%);
  border-radius: 30px;
  cursor: pointer;
  font-weight: 600;
  color: #fff;
  font-size: 16px;
  line-height: 21px;
  padding: 8px 24px!important;
  border-radius: 30px;
  text-transform: uppercase;
  display: inline-block;
  vertical-align: middle;
  transform: perspective(1px) translateZ(0);
  position: relative;
  -webkit-transition: all linear 400ms;
  transition: all linear 400ms;
  border: none;
  margin-top: 15px;
  box-shadow: unset!important;
}
</style>
