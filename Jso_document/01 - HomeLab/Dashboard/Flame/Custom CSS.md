```CSS
/* Hide Application URLs */
.AppCard_AppCardDetails__tbAhY {
    height: 50%;
}

.AppCard_AppCardDetails__tbAhY span {
    display: none !important;
}


/* Settings button style */
.Home_SettingsButton__Qvn8C {
    border-radius: 0.5rem !important;
    background-color: #DFD9D6 !important;
}


/* Wide Application tiles */
.AppCard_AppCard__1V2_0 {
    padding: 15px !important;
    margin-bottom: 0 !important;
    border-radius: 0.7rem !important;
}


/* Application tile hover color */
.AppCard_AppCard__1V2_0:hover {
    background-color: rgba(0, 0, 0, 0.3) !important;
}

@supports (-webkit-backdrop-filter: none) or (backdrop-filter: none) {
    .AppCard_AppCard__1V2_0:hover {
        backdrop-filter: blur(15px);
        background-color: rgba(0, 0, 0, 0.3) !important;
    }
}


/* Background image */
body {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    height: 100%;
}

body:before {
    content: "";
    position: fixed;
    overflow: hidden;
    background-image: url("https://wallpaperaccess.com/full/1286235.jpg");
    background-size: cover;
    z-index: -999;
    height: 100%;
    width: 100%;
    transform: scale(1.1);

    /* Change the following only: */
    filter: blur(0.2rem);
    opacity: 0.6;
}


/* Truncate Title and URL */
.AppCard_AppCardIcon__8ZZTq {
    min-width: 35px;
}

.AppCard_AppCard__1V2_0 {
    min-width: 0
}

.AppCard_AppCardDetails__tbAhY {
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}
```