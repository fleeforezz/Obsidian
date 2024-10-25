```css
@import url("https://fonts.googleapis.com/css2?family=Raleway:wght@700;800&display=swap");
 
#app {
  background-position: right;
}

#app #sortable,
#app main {
  padding: 20px;
}

#config-buttons {
  bottom: 50%;
  transform: translateY(50%);
  border-top-left-radius: 10px;
  border-bottom-left-radius: 10px;
  box-shadow: rgba(255, 255, 255, 0.1) -1px 1px 1px 0, rgba(255, 255, 255, 0.1) 0 -1px 1px 0,
    rgba(0, 0, 0, 0.1) -1px 0 20px 5px;
  background-color: rgba(40, 40, 40, 0.25);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
}

#config-buttons a {
  background: none;
}

#config-buttons a svg {
  transition: all 0.1s ease-in-out;
  color: rgba(255, 255, 255, 0.5);
}

#config-buttons a:hover svg {
  transform: scale(1.1);
  color: rgba(137, 180, 250, 0.95);
}
 
.black {
  color: rgb(186, 194, 222) !important;
}

.tooltip {
  bottom: unset !important;
}

.searchform {
  box-shadow: rgba(0, 0, 0, 0.05) -1px -1px 5px 0, rgba(0, 0, 0, 0.15) 0px 20px 25px -5px,
  rgba(0, 0, 0, 0.04) 0px 10px 10px -5px !important;
  border-radius: 12px;
  background-image: none;
  border: none;
  outline: none;
  background-color: rgba(69, 71, 90, 0.7) !important;
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
}

.searchform button {
  background: rgb(137, 180, 250) !important;
  color: rgb(224, 228, 243) !important;
}

.searchform input {
  background: rgb(108, 112, 134) !important;
  color: rgb(205, 214, 244) !important;
}

.searchform select {
  background: rgb(108, 112, 134) !important;
  border-right: 1px solid rgb(108, 112, 134) !important;
  color: rgb(224, 228, 243) !important;
}
 
.item {
  box-shadow: rgba(0, 0, 0, 0.05) -1px -1px 5px 0, rgba(0, 0, 0, 0.15) 0px 20px 25px -5px,
    rgba(0, 0, 0, 0.04) 0px 10px 10px -5px !important;
  border-radius: 12px;
  background-image: none;
  border: none;
  outline: none;
  height: 100px;
  width: 300px;
  margin: 1.25rem;
  padding: 1rem 55px 1rem 1rem;
  transition: all 0.25s ease-in-out;
  transition-property: transform, box-shadow, background-color;
  background-color: rgba(69, 71, 90, 0.7) !important;
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
}

.item:after {
  height: 100px;
  opacity: 0.2;
}

.item:hover {
  transform: scale(1.1);
  background-color: rgba(69, 71, 90, 0.8) !important;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 60px 40px -7px !important;
}

.item .svg-inline--fa {
  height: 100px;
  vertical-align: middle;
  opacity: 0.2;
}
 
@media only screen and (max-width: 750px) {
  .item {
    padding-top: 2rem;
    padding-bottom: 2rem;
  }
  #config-buttons {
    display: none;
  }
}
 
.details * {
  color: rgb(137, 180, 250) !important;
}
.details {
  padding: 0 0.5rem;
}
 
.app-icon {
  filter: drop-shadow(1px 1px 2px rgba(10, 0, 20, 0.1));
}
 
.livestats-container {
  margin-top: 0.5rem;
}

.livestats-container .livestats .title {
  margin-bottom: 3px;
}

.livestats-container .livestats li {
  padding-right: 1rem;
}
 
.livestats-container strong {
  font-weight: 500 !important;
  padding: 0 2px;
}
 
.details > .title {
  font-weight: 800;
  font-size: 1.3rem !important;
  letter-spacing: 1px;
  font-family: "Raleway", sans-serif;
  text-shadow: rgba(10, 0, 60, 0.25) 1px 0 5px;
  text-shadow: -1px -1px 1px rgba(255, 255, 255, 0.1), 1px 1px 2px rgba(10, 0, 60, 0.25);
  transition: all 0.25s ease-in-out;
}

.item:hover .details > .title {
  text-shadow: -1px -1px 1px rgba(255, 255, 255, 0.1), 1px 1px 5px rgba(10, 0, 60, 0.2);
}
```

## Light theme
```css
@import url("https://fonts.googleapis.com/css2?family=Raleway:wght@700;800&display=swap");

#app {
  background-position: right;
}
#app #sortable,
#app main {
  padding: 20px;
}
#config-buttons {
  bottom: 50%;
  transform: translateY(50%);
  border-top-left-radius: 10px;
  border-bottom-left-radius: 10px;
  box-shadow: rgba(255, 255, 255, 0.1) -1px 1px 1px 0, rgba(255, 255, 255, 0.1) 0 -1px 1px 0,
    rgba(0, 0, 0, 0.1) -1px 0 20px 5px;
  background-color: rgba(40, 40, 40, 0.25);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
}
#config-buttons a {
  background: none;
}
#config-buttons a svg {
  transition: all 0.1s ease-in-out;
  color: rgba(255, 255, 255, 0.5);
}
#config-buttons a:hover svg {
  transform: scale(1.1);
  color: rgba(255, 255, 255, 0.95);
}

.black {
  color: white !important;
}

.item {
  box-shadow: rgba(0, 0, 0, 0.05) -1px -1px 5px 0, rgba(0, 0, 0, 0.15) 0px 20px 25px -5px,
    rgba(0, 0, 0, 0.04) 0px 10px 10px -5px !important;
  border-radius: 12px;
  background-image: none;
  border: none;
  outline: none;
  height: 100px;
  width: 300px;
  margin: 1.25rem;
  padding: 1rem 55px 1rem 1rem;
  transition: all 0.25s ease-in-out;
  transition-property: transform, box-shadow, background-color;
  background-color: rgba(255, 255, 255, 0.4) !important;
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
}
.item:after {
  height: 100px;
  opacity: 0.2;
}
.item:hover {
  transform: scale(1.1);
  background-color: rgba(255, 255, 255, 0.2) !important;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 60px 40px -7px !important;
}
.item .svg-inline--fa {
  height: 100px;
  vertical-align: middle;
  opacity: 0.2;
}

@media only screen and (max-width: 750px) {
  .item {
    padding-top: 2rem;
    padding-bottom: 2rem;
  }
  #config-buttons {
    display: none;
  }
}

.details * {
  color: white !important;
}
.details {
  padding: 0 0.5rem;
}

.app-icon {
  filter: drop-shadow(1px 1px 2px rgba(10, 0, 20, 0.1));
}

.livestats-container {
  margin-top: 0.5rem;
}
.livestats-container .livestats .title {
  margin-bottom: 3px;
}
.livestats-container .livestats li {
  padding-right: 1rem;
}

.livestats-container strong {
  font-weight: 500 !important;
  padding: 0 2px;
}

.details > .title {
  font-weight: 800;
  font-size: 1.3rem !important;
  letter-spacing: 1px;
  font-family: "Raleway", sans-serif;
  text-shadow: rgba(10, 0, 60, 0.25) 1px 0 5px;
  text-shadow: -1px -1px 1px rgba(255, 255, 255, 0.1), 1px 1px 2px rgba(10, 0, 60, 0.25);
  transition: all 0.25s ease-in-out;
}
.item:hover .details > .title {
  text-shadow: -1px -1px 1px rgba(255, 255, 255, 0.1), 1px 1px 5px rgba(10, 0, 60, 0.2);
}
```

## Dark theme
```css
@import url("https://fonts.googleapis.com/css2?family=Raleway:wght@700;800&display=swap");

#app {
  background-position: right;
}
#app #sortable,
#app main {
  padding: 20px;
}
#config-buttons {
  bottom: 50%;
  transform: translateY(50%);
  border-top-left-radius: 10px;
  border-bottom-left-radius: 10px;
  box-shadow: rgba(255, 255, 255, 0.1) -1px 1px 1px 0, rgba(255, 255, 255, 0.1) 0 -1px 1px 0,
    rgba(0, 0, 0, 0.1) -1px 0 20px 5px;
  background-color: rgba(40, 40, 40, 0.25);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
}
#config-buttons a {
  background: none;
}
#config-buttons a svg {
  transition: all 0.1s ease-in-out;
  color: rgba(255, 255, 255, 0.5);
}
#config-buttons a:hover svg {
  transform: scale(1.1);
  color: rgba(255, 255, 255, 0.95);
}

.black {
  color: white !important;
}

.item {
  box-shadow: rgba(0, 0, 0, 0.05) -1px -1px 5px 0, rgba(0, 0, 0, 0.15) 0px 20px 25px -5px,
    rgba(0, 0, 0, 0.04) 0px 10px 10px -5px !important;
  border-radius: 16px;
  background-image: none;
  border: none;
  outline: none;
  height: 100px;
  width: 300px;
  margin: 1.25rem;
  padding: 1rem 55px 1rem 1rem;
  transition: all 0.25s ease-in-out;
  transition-property: transform, box-shadow, background-color;
  background-color: rgba(15, 15, 15, 0.4) !important;
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
}
.item:after {
  height: 100px;
  opacity: 0.2;
}
.item:hover {
  transform: scale(1.1);
  background-color: rgba(255, 255, 255, 0.2) !important;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 60px 40px -7px !important;
}
.item .svg-inline--fa {
  height: 100px;
  vertical-align: middle;
  opacity: 0.2;
}

@media only screen and (max-width: 750px) {
  .item {
    padding-top: 2rem;
    padding-bottom: 2rem;
  }
  #config-buttons {
    display: none;
  }
}

.details * {
  color: white !important;
}
.details {
  padding: 0 0.5rem;
}

.app-icon {
  filter: drop-shadow(1px 1px 2px rgba(10, 0, 20, 0.1));
}

.livestats-container {
  margin-top: 0.5rem;
}
.livestats-container .livestats .title {
  margin-bottom: 3px;
}
.livestats-container .livestats li {
  padding-right: 1rem;
}

.livestats-container strong {
  font-weight: 500 !important;
  padding: 0 2px;
}

.details > .title {
  font-weight: 800;
  font-size: 1.3rem !important;
  letter-spacing: 1px;
  font-family: "Raleway", sans-serif;
  text-shadow: rgba(10, 0, 60, 0.25) 1px 0 5px;
  text-shadow: -1px -1px 1px rgba(255, 255, 255, 0.1), 1px 1px 2px rgba(10, 0, 60, 0.25);
  transition: all 0.25s ease-in-out;
}
.item:hover .details > .title {
  text-shadow: -1px -1px 1px rgba(255, 255, 255, 0.1), 1px 1px 5px rgba(10, 0, 60, 0.2);
}
```
# Theme by selfhosted
```javascript
$(document).ready(function () {
  const base = (document.querySelector("base") || {}).href;
  const container = $("#sortable");
 
  const liveStats = () => {
    let hidden, visibilityChange;
 
    if (typeof document.hidden !== "undefined") {
      // Opera 12.10 and Firefox 18 and later support
      hidden = "hidden";
      visibilityChange = "visibilitychange";
    } else if (typeof document.msHidden !== "undefined") {
      hidden = "msHidden";
      visibilityChange = "msvisibilitychange";
    } else if (typeof document.webkitHidden !== "undefined") {
      hidden = "webkitHidden";
      visibilityChange = "webkitvisibilitychange";
    }
 
    const livestatsRefreshTimeouts = [];
    const livestatsFuncs = [];
    const livestatsContainers = $(".livestats-container");
 
    function stopLivestatsRefresh() {
      for (
        let _i = 0, _livestatsRefreshTime = livestatsRefreshTimeouts;
        _i < _livestatsRefreshTime.length;
        _i++
      ) {
        const timeoutId = _livestatsRefreshTime[_i];
        window.clearTimeout(timeoutId);
      }
    }
 
    function startLivestatsRefresh() {
      for (
        let _i2 = 0, _livestatsFuncs = livestatsFuncs;
        _i2 < _livestatsFuncs.length;
        _i2++
      ) {
        const fun = _livestatsFuncs[_i2];
        fun();
      }
    }
 
    if (livestatsContainers.length > 0) {
      if (
        typeof document.addEventListener === "undefined" ||
        hidden === undefined
      ) {
        console.log("This browser does not support visibilityChange");
      } else {
        document.addEventListener(
          visibilityChange,
          function () {
            if (document[hidden]) {
              stopLivestatsRefresh();
            } else {
              startLivestatsRefresh();
            }
          },
          false
        );
      }
 
      livestatsContainers.each(function (index) {
        const id = $(this).data("id");
        const dataonly = $(this).data("dataonly");
        const increaseby = dataonly == 1 ? 20000 : 1000;
        const container = $(this);
        const max_timer = 30000;
        let timer = 5000;
 
        const fun = function worker() {
          $.ajax({
            url: base + "get_stats/" + id,
            dataType: "json",
            success: function success(data) {
              container.html(data.html);
              if (data.status == "active") timer = increaseby;
              else {
                if (timer < max_timer) timer += 2000;
              }
            },
            complete: function complete() {
              // Schedule the next request when the current one's complete
              livestatsRefreshTimeouts[index] = window.setTimeout(
                worker,
                timer
              );
            },
          });
        };
 
        livestatsFuncs[index] = fun;
        fun();
      });
    }
  };
 
  const customMain = () => {
    if (window.location.pathname !== "/") return;
 
    container.html("");
    container.css("opacity", "1");
    $.get(base + "tags", function (data) {
      const tagArr = Array.from($("tbody tr td a", data));
      tags = tagArr
        .filter((_d, idx) => idx % 2 === 0)
        .map((node) => node.href.split("/").pop());
      const tagPromises = tags.map((tag) => $.get(base + "tag/" + tag));
 
      if (tags.length === 0) return;
      Promise.all(tagPromises)
        .then((tagsHtml) => {
          const tagsNodes = tagsHtml.map((html, idx) => {
            const inner = $("#sortable", html).html();
            const wrapper1 = document.createElement("div");
            const wrapper2 = document.createElement("div");
            wrapper2.classList.add("tags-container");
            wrapper2.innerHTML = inner;
            const tagTitle = document.createElement("h4");
            tagTitle.classList.add("tags-title");
            tagTitle.textContent = tags[idx].replaceAll("-", " ");
            wrapper1.append(tagTitle);
            wrapper1.append(wrapper2);
            return wrapper1;
          });
          container.append(tagsNodes);
        })
        .finally(() => liveStats());
    });
  };
 
  customMain();
});
```

```css
@import url("https://fonts.googleapis.com/css2?family=Raleway:wght@700;800&display=swap");

/* width */
::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #212234; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  border-radius: 16px;
  background: #333752; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #414767; 
}
 

#config-buttons {
  bottom:50%;
  transform: translateY(50%);
  border-top-left-radius: 10px;
  border-bottom-left-radius: 10px;
  box-shadow: rgba(0, 0, 0, 0.1) -1px 1px 1px 0, rgba(32, 32, 32, 0.1) 0 -1px 1px 0,
    rgba(0, 0, 0, 0.1) -1px 0 20px 5px;
  background-color: rgba(40, 40, 40, 0.25);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
}

#config-buttons a {
  background: none;
}

#config-buttons a svg {
  transition: all 0.1s ease-in-out;
  color: rgba(255, 255, 255, 0.5);
}

#config-buttons a:hover svg {
  transform: scale(1.1);
  color: rgba(255, 255, 255, 0.95);
}

#sortable {
  display: flex;
  flex-wrap: wrap;
  align-items: start !important;
  gap: 1rem;
  opacity: 0;
}

.black {
  color: black !important;
}

.item {
  background-image: none;
  border: none;
  border-radius: 15px;
/*  border-top: 2px solid rgba(0,0,0,.2);*/
  outline: none;
  transition: all 0.1s ease-in-out;
  background-color: rgba(0, 0, 0, 0.5) !important;
/*   backdrop-filter: blur(10px); */

}
.item:after {
  height: 90px;
  opacity: 0.3;
}

.item:hover {
/*   transform: scale(1.1); */
  background-color: rgba(255, 255, 255, 0.2) !important;
  box-shadow: rgba(0, 0, 0, 0.3) 0px 60px 40px -7px !important;
  border: none;
}

.item .svg-inline--fa {
  /*height: 100px;*/
  /*vertical-align: middle;*/
  opacity: 0.2;
  color: white !important;
}
 
.details * {
  color: white !important;
}

.details {
  padding: 0 0.5rem;
}
 
.app-icon {
  filter: drop-shadow(1px 1px 2px rgba(10, 0, 20, 0.1));
}
 
.livestats-container {
  margin-top: 0.5rem;
}

.livestats-container .livestats .title {
  margin-bottom: 3px;
}

.livestats-container .livestats li {
  padding-right: 1rem;
}

.livestats-container strong {
  font-weight: 500 !important;
  padding: 0 2px;
}
 
.details > .title {
  font-weight: 800;
  font-size: 1.1rem !important;
  letter-spacing: 1px;
  font-family: "Raleway", sans-serif;
  text-shadow: rgba(10, 0, 60, 0.25) 1px 0 5px;
  text-shadow: -1px -1px 1px rgba(255, 255, 255, 0.1), 1px 1px 2px rgba(10, 0, 60, 0.25);
  transition: all 0.25s ease-in-out;
}

.item:hover .details > .title {
  font-size: 1.3rem !important;
  text-shadow: -1px -1px 1px rgba(255, 255, 255, 0.1), 1px 1px 5px rgba(10, 0, 60, 0.2);
}

.tags-title {
    color: #fff;
    text-transform: capitalize;
    margin: 20px
}

.tags-container {
  flex: 1;
  background-color: rgba(32,32,32,0.35);
  border-radius: 15px;
/*  border-bottom: 3px solid hsla(0,0%,100%,.15);
  border-top: 3px solid rgba(0,0,0,.2);*/
  border: none;
  border-shadow: inset 0 1px 6px 0 rgba(0,0,0,.3);
  display: grid;
  grid-template-columns: repeat(2, 50%);
  backdrop-filter: blur(10px);
  transition: all 0.25s ease-in-out;
}

.tags-container:hover {
  backdrop-filter: blur(20px);
/*  border-top: 3px solid hsla(0,0%,100%,.15);
  border-bottom: 3px solid rgba(0,0,0,.3);*/
  box-shadow: rgba(0, 0, 0, 0.3) 0px 60px 40px -7px !important;
  transition: all 0.25s ease-in-out;
}

.module-container {
  width: 70%
  height: 70%
}

.searchform {
  background-color: rgba(32,32,32,0.5);
  backdrop-filter: blur(10px);
  border-radius: 15px;
/*  border-bottom: 2px solid hsla(0,0%,100%,.35);
  border-top: 2px solid rgba(0,0,0,.5);*/
  border: none;
  border-shadow: inset 0 1px 6px 0 rgba(0,0,0,.3);
}

.searchform:hover {
  backdrop-filter: blur(20px);
/*  border-top: 2px solid hsla(0,0%,100%,.15);
  border-bottom: 2px solid rgba(0,0,0,.3);*/
  border-shadow: inset 0 1px 6px 0 rgba(0,0,0,.5);
  transition: all 0.25s ease-in-out;
}

@media only screen and (max-width: 750px) {
  .item {
    padding-top: 2rem;
    padding-bottom: 2rem;
  }
  #config-buttons {
    display: none;
  }
}

@media (max-width: 680px) {
    #sortable {
         justify-content: center !important;
    }
   .tags-container {
        display: flex;
        flex-direction: column;
    }
}
```