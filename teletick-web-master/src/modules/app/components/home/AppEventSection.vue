<template>
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-4">
        <div class="blog-center-div">
          <div class="">
            <h3 class="blog-text">
              Événement </h3>
          </div>
          <div class="">
            <p class="blog-second-line">
              Participez aux évènements proposés par les membres Docare. </p>
          </div>
          <div class="view-more-btn-div">
            <router-link to="/events">
              <button type="button" class="btn btn-primary top-button custom-mt-0 h-50"> Voir tout</button>
            </router-link>
          </div>
        </div>
      </div>
      <div class="col-md-8">
        <div class="row">
          <div class="col-md-6">
            <div class="events-grid">
              <div class="events-grid-item">
                <div class="events-grid-img">
                  <div class="row">
                    <div class="col-4 d-flex align-items-center">
                      <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M3.96027 0C4.37448 0 4.71027 0.335786 4.71027 0.75V2.41763C7.538 2.1658 10.3825 2.1658 13.2103 2.41763V0.75C13.2103 0.335786 13.5461 0 13.9603 0C14.3745 0 14.7103 0.335786 14.7103 0.75V2.56644C16.2033 2.77754 17.3828 3.95847 17.5825 5.46484L17.6691 6.11779C18.0331 8.86412 18.0017 11.6484 17.5757 14.3859C17.3647 15.7419 16.263 16.7835 14.8973 16.9181L13.7043 17.0358C10.5492 17.3469 7.37124 17.3469 4.21619 17.0358L3.02319 16.9181C1.65745 16.7835 0.555787 15.7419 0.344778 14.3859C-0.0811805 11.6484 -0.112621 8.86412 0.251414 6.11779L0.337966 5.46484C0.537643 3.95845 1.71719 2.77751 3.21027 2.56643V0.75C3.21027 0.335786 3.54605 0 3.96027 0ZM4.40543 3.9528C7.43462 3.65408 10.4859 3.65408 13.515 3.9528L14.4205 4.0421C15.2872 4.12757 15.9811 4.79854 16.0955 5.66194L16.1821 6.31489C16.2123 6.543 16.2397 6.77139 16.2641 7H1.65633C1.68081 6.77139 1.70817 6.54301 1.73841 6.3149L1.82496 5.66194C1.93941 4.79854 2.63323 4.12757 3.49998 4.0421L4.40543 3.9528ZM1.5371 8.5C1.43892 10.3881 1.53565 12.2832 1.82694 14.1552C1.93278 14.8354 2.48536 15.3578 3.1704 15.4254L4.3634 15.543C7.42054 15.8445 10.4999 15.8445 13.5571 15.543L14.7501 15.4254C15.4351 15.3578 15.9877 14.8354 16.0935 14.1552C16.3848 12.2832 16.4816 10.3881 16.3834 8.5H1.5371Z"
                              fill="#A7D08E"></path>
                      </svg>
                      <h5 class="events-date">
                        17 Feb 2020
                        <span></span>
                      </h5>
                    </div>
                    <div class="col-4 d-flex align-items-center">
                      <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M9.5 3.75C9.5 3.33579 9.16421 3 8.75 3C8.33579 3 8 3.33579 8 3.75V8.75C8 9.00859 8.13321 9.24895 8.3525 9.386L11.3525 11.261C11.7038 11.4805 12.1665 11.3738 12.386 11.0225C12.6055 10.6712 12.4988 10.2085 12.1475 9.989L9.5 8.33431V3.75Z"
                            fill="#A7D08E"></path>
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M8.75 0C3.91751 0 0 3.91751 0 8.75C0 13.5825 3.91751 17.5 8.75 17.5C13.5825 17.5 17.5 13.5825 17.5 8.75C17.5 3.91751 13.5825 0 8.75 0ZM1.5 8.75C1.5 4.74594 4.74594 1.5 8.75 1.5C12.7541 1.5 16 4.74594 16 8.75C16 12.7541 12.7541 16 8.75 16C4.74594 16 1.5 12.7541 1.5 8.75Z"
                              fill="#A7D08E"></path>
                      </svg>
                      <h5 class="events-time">
                        5:00
                        <span> PM</span>
                      </h5>
                    </div>
                    <div class="col-4 d-flex align-items-center">
                      <svg width="16" height="18" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M3.6129 4.50555C3.6129 2.0172 5.57707 0 8 0C10.4229 0 12.3871 2.0172 12.3871 4.50555C12.3871 6.9939 10.4229 9.0111 8 9.0111C5.57707 9.0111 3.6129 6.9939 3.6129 4.50555ZM8 1.59019C6.43222 1.59019 5.16129 2.89544 5.16129 4.50555C5.16129 6.11566 6.43222 7.42091 8 7.42091C9.56778 7.42091 10.8387 6.11566 10.8387 4.50555C10.8387 2.89544 9.56778 1.59019 8 1.59019Z"
                              fill="#A7D08E"></path>
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M3.87097 12.1915C2.58824 12.1915 1.54839 13.2594 1.54839 14.5768V15.8365C1.54839 15.8557 1.56192 15.8721 1.58036 15.8751C5.83197 16.588 10.168 16.588 14.4196 15.8751C14.4381 15.8721 14.4516 15.8557 14.4516 15.8365V14.5768C14.4516 13.2594 13.4118 12.1915 12.129 12.1915H11.7772C11.75 12.1915 11.7229 12.1959 11.6971 12.2046L10.8036 12.5042C8.98187 13.1151 7.01813 13.1151 5.19637 12.5042L4.30294 12.2046C4.27707 12.1959 4.25004 12.1915 4.22283 12.1915H3.87097ZM0 14.5768C0 12.3812 1.73309 10.6013 3.87097 10.6013H4.22283C4.41328 10.6013 4.60252 10.6322 4.78356 10.6929L5.67699 10.9925C7.18645 11.4987 8.81355 11.4987 10.323 10.9925L11.2164 10.6929C11.3975 10.6322 11.5867 10.6013 11.7772 10.6013H12.129C14.2669 10.6013 16 12.3812 16 14.5768V15.8365C16 16.635 15.4365 17.3159 14.6691 17.4446C10.2523 18.1851 5.74771 18.1851 1.33086 17.4446C0.563493 17.3159 0 16.635 0 15.8365V14.5768Z"
                              fill="#A7D08E"></path>
                      </svg>

                      <h5 class="events-person">
                        27
                        <span> personnes</span>
                      </h5>
                    </div>
                  </div>
                  <h4 class="events-header-custom">
                                            <span class="events-header" href="#">
                                                <a href="" class="events-img-custom">
                                                     Comment s’épanouir pleinement en couple ?
                                                </a>
                                            </span>
                  </h4>

                </div>
              </div>

              <div class="events-grid-text sm-padding-20px-all border-color-medium-gray">
                <div class="events-writer-main-div d-flex align-items-center justify-content-between">
                  <div class="d-flex align-items-center">
                    <img class="events-writer-image" alt="img" src="">
                    <h4 class="events-writer-name">Maren Baptista</h4>
                  </div>
                  <div class="">
                    <a class="events-writer-post" href="#">Participer </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="events-grid">
              <div class="events-grid-item">
                <div class="events-grid-img">
                  <div class="row">
                    <div class="col-4 d-flex align-items-center">
                      <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M3.96027 0C4.37448 0 4.71027 0.335786 4.71027 0.75V2.41763C7.538 2.1658 10.3825 2.1658 13.2103 2.41763V0.75C13.2103 0.335786 13.5461 0 13.9603 0C14.3745 0 14.7103 0.335786 14.7103 0.75V2.56644C16.2033 2.77754 17.3828 3.95847 17.5825 5.46484L17.6691 6.11779C18.0331 8.86412 18.0017 11.6484 17.5757 14.3859C17.3647 15.7419 16.263 16.7835 14.8973 16.9181L13.7043 17.0358C10.5492 17.3469 7.37124 17.3469 4.21619 17.0358L3.02319 16.9181C1.65745 16.7835 0.555787 15.7419 0.344778 14.3859C-0.0811805 11.6484 -0.112621 8.86412 0.251414 6.11779L0.337966 5.46484C0.537643 3.95845 1.71719 2.77751 3.21027 2.56643V0.75C3.21027 0.335786 3.54605 0 3.96027 0ZM4.40543 3.9528C7.43462 3.65408 10.4859 3.65408 13.515 3.9528L14.4205 4.0421C15.2872 4.12757 15.9811 4.79854 16.0955 5.66194L16.1821 6.31489C16.2123 6.543 16.2397 6.77139 16.2641 7H1.65633C1.68081 6.77139 1.70817 6.54301 1.73841 6.3149L1.82496 5.66194C1.93941 4.79854 2.63323 4.12757 3.49998 4.0421L4.40543 3.9528ZM1.5371 8.5C1.43892 10.3881 1.53565 12.2832 1.82694 14.1552C1.93278 14.8354 2.48536 15.3578 3.1704 15.4254L4.3634 15.543C7.42054 15.8445 10.4999 15.8445 13.5571 15.543L14.7501 15.4254C15.4351 15.3578 15.9877 14.8354 16.0935 14.1552C16.3848 12.2832 16.4816 10.3881 16.3834 8.5H1.5371Z"
                              fill="#A7D08E"></path>
                      </svg>
                      <h5 class="events-date">
                        17 Feb 2020
                        <span></span>
                      </h5>
                    </div>
                    <div class="col-4 d-flex align-items-center">
                      <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M9.5 3.75C9.5 3.33579 9.16421 3 8.75 3C8.33579 3 8 3.33579 8 3.75V8.75C8 9.00859 8.13321 9.24895 8.3525 9.386L11.3525 11.261C11.7038 11.4805 12.1665 11.3738 12.386 11.0225C12.6055 10.6712 12.4988 10.2085 12.1475 9.989L9.5 8.33431V3.75Z"
                            fill="#A7D08E"></path>
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M8.75 0C3.91751 0 0 3.91751 0 8.75C0 13.5825 3.91751 17.5 8.75 17.5C13.5825 17.5 17.5 13.5825 17.5 8.75C17.5 3.91751 13.5825 0 8.75 0ZM1.5 8.75C1.5 4.74594 4.74594 1.5 8.75 1.5C12.7541 1.5 16 4.74594 16 8.75C16 12.7541 12.7541 16 8.75 16C4.74594 16 1.5 12.7541 1.5 8.75Z"
                              fill="#A7D08E"></path>
                      </svg>
                      <h5 class="events-time">
                        5:00
                        <span> PM</span>
                      </h5>
                    </div>
                    <div class="col-4 d-flex align-items-center">
                      <svg width="16" height="18" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M3.6129 4.50555C3.6129 2.0172 5.57707 0 8 0C10.4229 0 12.3871 2.0172 12.3871 4.50555C12.3871 6.9939 10.4229 9.0111 8 9.0111C5.57707 9.0111 3.6129 6.9939 3.6129 4.50555ZM8 1.59019C6.43222 1.59019 5.16129 2.89544 5.16129 4.50555C5.16129 6.11566 6.43222 7.42091 8 7.42091C9.56778 7.42091 10.8387 6.11566 10.8387 4.50555C10.8387 2.89544 9.56778 1.59019 8 1.59019Z"
                              fill="#A7D08E"></path>
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M3.87097 12.1915C2.58824 12.1915 1.54839 13.2594 1.54839 14.5768V15.8365C1.54839 15.8557 1.56192 15.8721 1.58036 15.8751C5.83197 16.588 10.168 16.588 14.4196 15.8751C14.4381 15.8721 14.4516 15.8557 14.4516 15.8365V14.5768C14.4516 13.2594 13.4118 12.1915 12.129 12.1915H11.7772C11.75 12.1915 11.7229 12.1959 11.6971 12.2046L10.8036 12.5042C8.98187 13.1151 7.01813 13.1151 5.19637 12.5042L4.30294 12.2046C4.27707 12.1959 4.25004 12.1915 4.22283 12.1915H3.87097ZM0 14.5768C0 12.3812 1.73309 10.6013 3.87097 10.6013H4.22283C4.41328 10.6013 4.60252 10.6322 4.78356 10.6929L5.67699 10.9925C7.18645 11.4987 8.81355 11.4987 10.323 10.9925L11.2164 10.6929C11.3975 10.6322 11.5867 10.6013 11.7772 10.6013H12.129C14.2669 10.6013 16 12.3812 16 14.5768V15.8365C16 16.635 15.4365 17.3159 14.6691 17.4446C10.2523 18.1851 5.74771 18.1851 1.33086 17.4446C0.563493 17.3159 0 16.635 0 15.8365V14.5768Z"
                              fill="#A7D08E"></path>
                      </svg>

                      <h5 class="events-person">
                        27
                        <span> personnes</span>
                      </h5>
                    </div>
                  </div>
                  <h4 class="events-header-custom">
                                            <span class="events-header" href="#">
                                                <a href="" class="events-img-custom">
                                                     Comment s’épanouir pleinement en couple ?
                                                </a>
                                            </span>
                  </h4>

                </div>
              </div>

              <div class="events-grid-text sm-padding-20px-all border-color-medium-gray">
                <div class="events-writer-main-div d-flex align-items-center justify-content-between">
                  <div class="d-flex align-items-center">
                    <img class="events-writer-image" alt="img" src="">
                    <h4 class="events-writer-name">Maren Baptista</h4>
                  </div>
                  <div class="">
                    <a class="events-writer-post" href="#">Participer </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="events-grid">
              <div class="events-grid-item"
                   style="">
                <div class="events-grid-img">
                  <div class="row">
                    <div class="col-4 d-flex align-items-center">
                      <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M3.96027 0C4.37448 0 4.71027 0.335786 4.71027 0.75V2.41763C7.538 2.1658 10.3825 2.1658 13.2103 2.41763V0.75C13.2103 0.335786 13.5461 0 13.9603 0C14.3745 0 14.7103 0.335786 14.7103 0.75V2.56644C16.2033 2.77754 17.3828 3.95847 17.5825 5.46484L17.6691 6.11779C18.0331 8.86412 18.0017 11.6484 17.5757 14.3859C17.3647 15.7419 16.263 16.7835 14.8973 16.9181L13.7043 17.0358C10.5492 17.3469 7.37124 17.3469 4.21619 17.0358L3.02319 16.9181C1.65745 16.7835 0.555787 15.7419 0.344778 14.3859C-0.0811805 11.6484 -0.112621 8.86412 0.251414 6.11779L0.337966 5.46484C0.537643 3.95845 1.71719 2.77751 3.21027 2.56643V0.75C3.21027 0.335786 3.54605 0 3.96027 0ZM4.40543 3.9528C7.43462 3.65408 10.4859 3.65408 13.515 3.9528L14.4205 4.0421C15.2872 4.12757 15.9811 4.79854 16.0955 5.66194L16.1821 6.31489C16.2123 6.543 16.2397 6.77139 16.2641 7H1.65633C1.68081 6.77139 1.70817 6.54301 1.73841 6.3149L1.82496 5.66194C1.93941 4.79854 2.63323 4.12757 3.49998 4.0421L4.40543 3.9528ZM1.5371 8.5C1.43892 10.3881 1.53565 12.2832 1.82694 14.1552C1.93278 14.8354 2.48536 15.3578 3.1704 15.4254L4.3634 15.543C7.42054 15.8445 10.4999 15.8445 13.5571 15.543L14.7501 15.4254C15.4351 15.3578 15.9877 14.8354 16.0935 14.1552C16.3848 12.2832 16.4816 10.3881 16.3834 8.5H1.5371Z"
                              fill="#A7D08E"></path>
                      </svg>
                      <h5 class="events-date">
                        17 Feb 2020
                        <span></span>
                      </h5>
                    </div>
                    <div class="col-4 d-flex align-items-center">
                      <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M9.5 3.75C9.5 3.33579 9.16421 3 8.75 3C8.33579 3 8 3.33579 8 3.75V8.75C8 9.00859 8.13321 9.24895 8.3525 9.386L11.3525 11.261C11.7038 11.4805 12.1665 11.3738 12.386 11.0225C12.6055 10.6712 12.4988 10.2085 12.1475 9.989L9.5 8.33431V3.75Z"
                            fill="#A7D08E"></path>
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M8.75 0C3.91751 0 0 3.91751 0 8.75C0 13.5825 3.91751 17.5 8.75 17.5C13.5825 17.5 17.5 13.5825 17.5 8.75C17.5 3.91751 13.5825 0 8.75 0ZM1.5 8.75C1.5 4.74594 4.74594 1.5 8.75 1.5C12.7541 1.5 16 4.74594 16 8.75C16 12.7541 12.7541 16 8.75 16C4.74594 16 1.5 12.7541 1.5 8.75Z"
                              fill="#A7D08E"></path>
                      </svg>
                      <h5 class="events-time">
                        5:00
                        <span> PM</span>
                      </h5>
                    </div>
                    <div class="col-4 d-flex align-items-center">
                      <svg width="16" height="18" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M3.6129 4.50555C3.6129 2.0172 5.57707 0 8 0C10.4229 0 12.3871 2.0172 12.3871 4.50555C12.3871 6.9939 10.4229 9.0111 8 9.0111C5.57707 9.0111 3.6129 6.9939 3.6129 4.50555ZM8 1.59019C6.43222 1.59019 5.16129 2.89544 5.16129 4.50555C5.16129 6.11566 6.43222 7.42091 8 7.42091C9.56778 7.42091 10.8387 6.11566 10.8387 4.50555C10.8387 2.89544 9.56778 1.59019 8 1.59019Z"
                              fill="#A7D08E"></path>
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M3.87097 12.1915C2.58824 12.1915 1.54839 13.2594 1.54839 14.5768V15.8365C1.54839 15.8557 1.56192 15.8721 1.58036 15.8751C5.83197 16.588 10.168 16.588 14.4196 15.8751C14.4381 15.8721 14.4516 15.8557 14.4516 15.8365V14.5768C14.4516 13.2594 13.4118 12.1915 12.129 12.1915H11.7772C11.75 12.1915 11.7229 12.1959 11.6971 12.2046L10.8036 12.5042C8.98187 13.1151 7.01813 13.1151 5.19637 12.5042L4.30294 12.2046C4.27707 12.1959 4.25004 12.1915 4.22283 12.1915H3.87097ZM0 14.5768C0 12.3812 1.73309 10.6013 3.87097 10.6013H4.22283C4.41328 10.6013 4.60252 10.6322 4.78356 10.6929L5.67699 10.9925C7.18645 11.4987 8.81355 11.4987 10.323 10.9925L11.2164 10.6929C11.3975 10.6322 11.5867 10.6013 11.7772 10.6013H12.129C14.2669 10.6013 16 12.3812 16 14.5768V15.8365C16 16.635 15.4365 17.3159 14.6691 17.4446C10.2523 18.1851 5.74771 18.1851 1.33086 17.4446C0.563493 17.3159 0 16.635 0 15.8365V14.5768Z"
                              fill="#A7D08E"></path>
                      </svg>

                      <h5 class="events-person">
                        27
                        <span> personnes</span>
                      </h5>
                    </div>
                  </div>
                  <h4 class="events-header-custom">
                                            <span class="events-header" href="#">
                                                <a href="" class="events-img-custom">
                                                     Comment s’épanouir pleinement en couple ?
                                                </a>
                                            </span>
                  </h4>

                </div>
              </div>

              <div class="events-grid-text sm-padding-20px-all border-color-medium-gray">
                <div class="events-writer-main-div d-flex align-items-center justify-content-between">
                  <div class="d-flex align-items-center">
                    <img class="events-writer-image" alt="img" src="">
                    <h4 class="events-writer-name">Maren Baptista</h4>
                  </div>
                  <div class="">
                    <a class="events-writer-post" href="#">Participer </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="events-grid">
              <div class="events-grid-item">
                <div class="events-grid-img">
                  <div class="row">
                    <div class="col-4 d-flex align-items-center">
                      <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M3.96027 0C4.37448 0 4.71027 0.335786 4.71027 0.75V2.41763C7.538 2.1658 10.3825 2.1658 13.2103 2.41763V0.75C13.2103 0.335786 13.5461 0 13.9603 0C14.3745 0 14.7103 0.335786 14.7103 0.75V2.56644C16.2033 2.77754 17.3828 3.95847 17.5825 5.46484L17.6691 6.11779C18.0331 8.86412 18.0017 11.6484 17.5757 14.3859C17.3647 15.7419 16.263 16.7835 14.8973 16.9181L13.7043 17.0358C10.5492 17.3469 7.37124 17.3469 4.21619 17.0358L3.02319 16.9181C1.65745 16.7835 0.555787 15.7419 0.344778 14.3859C-0.0811805 11.6484 -0.112621 8.86412 0.251414 6.11779L0.337966 5.46484C0.537643 3.95845 1.71719 2.77751 3.21027 2.56643V0.75C3.21027 0.335786 3.54605 0 3.96027 0ZM4.40543 3.9528C7.43462 3.65408 10.4859 3.65408 13.515 3.9528L14.4205 4.0421C15.2872 4.12757 15.9811 4.79854 16.0955 5.66194L16.1821 6.31489C16.2123 6.543 16.2397 6.77139 16.2641 7H1.65633C1.68081 6.77139 1.70817 6.54301 1.73841 6.3149L1.82496 5.66194C1.93941 4.79854 2.63323 4.12757 3.49998 4.0421L4.40543 3.9528ZM1.5371 8.5C1.43892 10.3881 1.53565 12.2832 1.82694 14.1552C1.93278 14.8354 2.48536 15.3578 3.1704 15.4254L4.3634 15.543C7.42054 15.8445 10.4999 15.8445 13.5571 15.543L14.7501 15.4254C15.4351 15.3578 15.9877 14.8354 16.0935 14.1552C16.3848 12.2832 16.4816 10.3881 16.3834 8.5H1.5371Z"
                              fill="#A7D08E"></path>
                      </svg>
                      <h5 class="events-date">
                        17 Feb 2020
                        <span></span>
                      </h5>
                    </div>
                    <div class="col-4 d-flex align-items-center">
                      <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M9.5 3.75C9.5 3.33579 9.16421 3 8.75 3C8.33579 3 8 3.33579 8 3.75V8.75C8 9.00859 8.13321 9.24895 8.3525 9.386L11.3525 11.261C11.7038 11.4805 12.1665 11.3738 12.386 11.0225C12.6055 10.6712 12.4988 10.2085 12.1475 9.989L9.5 8.33431V3.75Z"
                            fill="#A7D08E"></path>
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M8.75 0C3.91751 0 0 3.91751 0 8.75C0 13.5825 3.91751 17.5 8.75 17.5C13.5825 17.5 17.5 13.5825 17.5 8.75C17.5 3.91751 13.5825 0 8.75 0ZM1.5 8.75C1.5 4.74594 4.74594 1.5 8.75 1.5C12.7541 1.5 16 4.74594 16 8.75C16 12.7541 12.7541 16 8.75 16C4.74594 16 1.5 12.7541 1.5 8.75Z"
                              fill="#A7D08E"></path>
                      </svg>
                      <h5 class="events-time">
                        5:00
                        <span> PM</span>
                      </h5>
                    </div>
                    <div class="col-4 d-flex align-items-center">
                      <svg width="16" height="18" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M3.6129 4.50555C3.6129 2.0172 5.57707 0 8 0C10.4229 0 12.3871 2.0172 12.3871 4.50555C12.3871 6.9939 10.4229 9.0111 8 9.0111C5.57707 9.0111 3.6129 6.9939 3.6129 4.50555ZM8 1.59019C6.43222 1.59019 5.16129 2.89544 5.16129 4.50555C5.16129 6.11566 6.43222 7.42091 8 7.42091C9.56778 7.42091 10.8387 6.11566 10.8387 4.50555C10.8387 2.89544 9.56778 1.59019 8 1.59019Z"
                              fill="#A7D08E"></path>
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M3.87097 12.1915C2.58824 12.1915 1.54839 13.2594 1.54839 14.5768V15.8365C1.54839 15.8557 1.56192 15.8721 1.58036 15.8751C5.83197 16.588 10.168 16.588 14.4196 15.8751C14.4381 15.8721 14.4516 15.8557 14.4516 15.8365V14.5768C14.4516 13.2594 13.4118 12.1915 12.129 12.1915H11.7772C11.75 12.1915 11.7229 12.1959 11.6971 12.2046L10.8036 12.5042C8.98187 13.1151 7.01813 13.1151 5.19637 12.5042L4.30294 12.2046C4.27707 12.1959 4.25004 12.1915 4.22283 12.1915H3.87097ZM0 14.5768C0 12.3812 1.73309 10.6013 3.87097 10.6013H4.22283C4.41328 10.6013 4.60252 10.6322 4.78356 10.6929L5.67699 10.9925C7.18645 11.4987 8.81355 11.4987 10.323 10.9925L11.2164 10.6929C11.3975 10.6322 11.5867 10.6013 11.7772 10.6013H12.129C14.2669 10.6013 16 12.3812 16 14.5768V15.8365C16 16.635 15.4365 17.3159 14.6691 17.4446C10.2523 18.1851 5.74771 18.1851 1.33086 17.4446C0.563493 17.3159 0 16.635 0 15.8365V14.5768Z"
                              fill="#A7D08E"></path>
                      </svg>

                      <h5 class="events-person">
                        27
                        <span> personnes</span>
                      </h5>
                    </div>
                  </div>
                  <h4 class="events-header-custom">
                                            <span class="events-header" href="#">
                                                <a href="" class="events-img-custom">
                                                     Comment s’épanouir pleinement en couple ?
                                                </a>
                                            </span>
                  </h4>

                </div>
              </div>

              <div class="events-grid-text sm-padding-20px-all border-color-medium-gray">
                <div class="events-writer-main-div d-flex align-items-center justify-content-between">
                  <div class="d-flex align-items-center">
                    <img class="events-writer-image" alt="img" src="">
                    <h4 class="events-writer-name">Maren Baptista</h4>
                  </div>
                  <div class="">
                    <a class="events-writer-post" href="#">Participer </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "AppEventSection"
}
</script>

<style scoped>
.blog-text {
  font-style: normal;
  font-weight: 600;
  font-size: 36px;
  line-height: 50px;
  display: flex;
  align-items: center;
  color: #2C3F34;
}

.blog-second-line {
  font-style: normal;
  font-weight: normal;
  font-size: 20px;
  line-height: 32px;
  display: flex;
  align-items: center;
  color: #2C3F34;
  opacity: 0.8;
}

.events-grid {
  background-color: #F9F9F9;
  border-radius: 10px;
  margin-bottom: 35px;
}

.events-grid-item {
  height: 200px;
  border-radius: 10px 10px 0 0;
  background-color: grey;
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  background-image: url('~@/assets/content/contact-image.png')
}

.events-grid-img {
  border-radius: 10px 10px 0 0;
  padding: 25px 30px 40px;
  display: flex;
  height: 100%;
  flex-direction: column;
  justify-content: space-between;
  background: linear-gradient(
      0deg, rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), rgba(44, 63, 52, 0.1);
}

.events-grid h5 {
  font-weight: 500;
  font-size: 14px;
  line-height: 28px;
  color: #FFFFFF;
  margin-bottom: 0;
  margin-left: 10px;
}

.events-grid h5 span {
  opacity: 0.7;
  font-weight: 400;
}

.events-grid h4 {
  margin-bottom: 0;
  max-width: 85%;
}

.events-header-custom {
  position: relative;
}

.events-header-custom:before {
  content: '';
  display: block;
  background-color: #A7D08E;
  height: 100%;
  width: 4px;
  position: absolute;
  left: -30px;
}

.events-header a {
  font-weight: 600;
  font-size: 22px;
  line-height: 30px;
  color: #FFFFFF;
  display: inline-block;
}

.events-grid-text {
  padding: 20px;
}

.border-color-medium-gray {
  border-color: #e4e4e4 !important;
}

.events-writer-image {
  background-color: grey;
  height: 40px;
  width: 40px;
  border-radius: 50px;
}

.events-writer-name {
  font-weight: 600;
  font-size: 14px;
  line-height: 28px;
  color: #2C3F34;
  margin-left: 14px;
}

.events-writer-post {
  color: #FFFFFF !important;
  font-weight: 500;
  font-size: 14px;
  line-height: 14px;
  text-transform: uppercase;
  padding: 12px 61px;
  background-color: #A7D08E;
  border-radius: 30px;
}
.blog-center-div button {
  font-size: 14px;
  line-height: 44px;
  width: 200px;
  padding: 0 20px!important;
}
.top-button {
  background: linear-gradient(
      90deg
      , #A7D08E 0%, #537E36 100%);
  font-weight: 600;
  color: #fff;
  border-radius: 30px;
  text-transform: uppercase;
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  position: relative;
  -webkit-transition: all linear 400ms;
  transition: all linear 400ms;
  border: none;
  box-shadow: unset!important;
}
</style>
