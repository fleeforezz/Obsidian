### SoftX

```text
https://raw.githubusercontent.com/DiscordStyles/SoftX/deploy/SoftX.theme.css
```

### Catppuccin/mocha

```text
https://raw.githubusercontent.com/catppuccin/discord/main/themes/mocha.theme.css
```

### Amoled-color

```text
https://luckfire.github.io/amoled-cord/src/amoled-cord.css
```

### Github

```text
https://raw.githubusercontent.com/moistp1ckle/GitHub_Dark/main/source.css
```

# CSS Themes

### Chillax

```css
/*chillax*/
@import url('https://warrayquipsome.github.io/Chillax/chillax.css');

/*removable addons*/
@import url("https://mwittrien.github.io/BetterDiscordAddons/Themes/EmojiReplace/base/Microsoft.css");
@import url('https://mwittrien.github.io/BetterDiscordAddons/Themes/_res/SettingsIcons.css');

@import url('https://nyri4.github.io/Discolored/main.css');
@import url("https://warrayquipsome.github.io/Chillax/Addons/IconPackEdited.css");
@import url("https://warrayquipsome.github.io/Chillax/Addons/AvatarOnlyMemberList.css");
@import url("https://warrayquipsome.github.io/Chillax/Addons/FolderRedesign.css");

/*additional addons*/ /*(remove the both * to use)*/
/* @import url("https://warrayquipsome.github.io/Chillax/Addons/SimpleLessLag.css"); */

/*Chillax Roots*/
:root{
/*background image*/ /*(replace the link to use)*/
  --background-image:var(--wallpaper);
/*bg dev suggestions*/
  --wallpaper: url('https://images.unsplash.com/photo-1509023464722-18d996393ca8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');

}

/*window*/ /*dark mode*/
:root.theme-dark {
  --window-margin: 20px; /*must be above 20px*/
  --window-colour: #0009;
  --window-blur: 50px;
  --window-border-radius: 16px;
  --sidebar-colour: rgb(36, 36, 36);
}

/*window*/ /*light mode*/
:root.theme-light {
  --window-margin: 20px; /*must be above 20px*/
  --window-colour: rgba(255, 255, 255, 0.6);
  --window-blur: 15px;
  --window-border-radius: 20px;
  --sidebar-colour: rgb(209, 209, 209);
}

/*roots*/ /*both dark and light*/
:root {
  --user-name: "Jso";
  --font-name: Poppins;
  --font-size: 13px;
  
/*glow radial status*/ /*must end in px*/
  --rs-small-spacing:0px;
  --rs-large-spacing:0px;
  --rs-medium-spacing:0px;
  --rs-small-width: 2.5px;
  --rs-medium-width: 3.5px;
  --rs-large-width: 4.5px;
  --rs-avatar-shape:50%;
  --rs-online-color:#1df594;
  --rs-idle-color:#faa61a;
  --rs-dnd-color:#f04747;
  --rs-offline-color:#636b75;
  --rs-streaming-color:#643da7;
  --rs-invisible-color:#636b75;
  --rs-phone-visible:block;
  --rs-phone-color:var(--rs-online-color);
  

/*chillax colours rgb*/ /* Google RGB Picker: https://g.co/kgs/NoY83h */
  --accentcolor:    251, 84, 84;  
/*chillax colours hex*/ /* Google RGB Picker: https://g.co/kgs/NoY83h */
  --accentcolorV2:     #fb5454;
/*settings modal root*/
  --themelightsettingsmodalbackground: rgb(223, 223, 223);
  --themedarksettingsmodalbackground: rgb(51, 49, 53);
  --settingsmodalwidth: 960px;
  --settingsmodalheight: 80vh;
}

/*discord transparency*//*roots*/ /*theme dark*/
  .theme-dark {
  --background-message-hover: rgba(255, 255, 255, 0.055);
  --header-primary: #fff;
  --header-secondary: #b9bbbe;
  --text-normal: #dcddde;
  --text-muted: #9d9d9d;
  --channels-default: #8e9297;
  --interactive-normal: #b9bbbe;
  --interactive-hover: #dcddde;
  --interactive-active: #fff;
  --interactive-muted: #4f545c;
  --background-primary: transparent;
  --background-secondary: transparent;
  --background-tertiary: transparent;
  --background-accent: rgb(36, 36, 36);
  --activity-card-background: transparent;
  --deprecated-panel-background: transparent;
}

/*discord transparency*//*roots*/ /*theme light*/
  .theme-light {
  --background-message-hover: rgba(255, 255, 255, 0.055);
  --header-primary: rgb(0, 0, 0);
  --header-secondary: #3f3f3f;
  --text-normal: #303030;
  --text-muted: #333333;
  --channels-default: #585b5e;
  --interactive-normal: #3a3a3a;
  --interactive-hover: #333333;
  --interactive-active: rgb(0, 0, 0);
  --interactive-muted: #4f545c;
  --background-primary: transparent;
  --background-secondary: transparent;
  --background-tertiary: transparent;
  --background-accent: rgb(27, 27, 27);
  --activity-card-background: transparent;
  --deprecated-panel-background: transparent;
}

/*friends grid banner colour*/
.theme-dark{
--FG-cards-banner-background: transparent!important;
}
.theme-light{
--FG-cards-banner-background: transparent!important;
}
```

### Ultra Dark

```css
/**
 * @name Ultra
 * @version 1.0.7
 * @author TheCommieAxolotl#0001
 * @authorId 538487970408300544
 * @description A Smooth, Black theme
 * @source https://github.com/TheCommieAxolotl/BetterDiscord-Stuff/tree/main/Ultra
 * @website https://thecommieaxolotl.netlify.app/
 * @donate https://github.com/sponsors/thecommieaxolotl
 * @invite g2KnUw7u7N
*/

/* Imports */
@import url("https://discord-custom-covers.github.io/usrbg/dist/usrbg.css");
@import url("https://thecommieaxolotl.github.io/BetterDiscord-Stuff/Imports/Touchup.css");
@import url("https://thecommieaxolotl.github.io/BetterDiscord-Stuff/Imports/UserBadges.css");
@import url("https://maendisease.github.io/BetterDiscordStuff/css/bettterInvites.css");
@import url("https://fonts.googleapis.com/css2?family=Lato:wght@100;200;400;500;600;700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Source Code Pro:wght@550&display=swap");

/* Source */
@import url("https://thecommieaxolotl.github.io/BetterDiscord-Stuff/Ultra/Clients/betterdiscord.css");

:root,
.theme-dark {
    --text-normal: #dcddde;
    --text-muted: #4a4a52;
    --text-link: #6e6af6;
    --text-positive: #50dc7d;
    --text-warning: #8d4949;
    --text-danger: #8d4949;
    --text-brand: #6e6af6;
    --interactive-normal: #b9bbbe;
    --interactive-hover: #dcddde;
    --interactive-active: #c9ced0;
    --interactive-muted: #4f545c;
    --background-primary: #101014;
    --background-secondary: #17161b;
    --background-secondary-alt: #17161b;
    --background-tertiary: #101014;
    --background-accent: #4f545c;
    --background-floating: #17161b;
    --modal-background: #101014;
    --channeltextarea-background: #17161b;
    --info-positive-text: #fff;
    --info-warning-text: #fff;
    --info-warning-foreground: #6e6af6;
    --info-danger-text: #fff;
    --info-help-text: #fff;
    --status-warning-text: #000;
    --background-mentioned: #6f6af62c;
    --background-mentioned-hover: #6f6af615;
    --background-message-hover: rgba(4, 4, 5, 0.07);
    --scrollbar-auto-thumb: #6e6af6;
    --brand-experiment: #6e6af6;
    --brand-experiment-hover: #6f6af64d;
    --brand-experiment-560: #6e6af6;
    --channels-default: #4a4a52;
    --selected-indicator: #97ffa5;
    --hover-indicator: #ffffff;
    --font: "Lato";
    --code-font: "Source Code Pro";
    --boost-bar: none;
}

/* Made By The Commie Axolotl */
```

# Midnight discord

```css
/**
 * @name midnight (biscuit)
 * @description A darkened discord theme. Based on Biscuit theme (https://github.com/Biscuit-Colorscheme/biscuit).
 * @author refact0r, anubis
 * @version 1.6.2
 * @source https://github.com/refact0r/midnight-discord
 * @authorId 508863359777505290
*/
/* IMPORTANT: make sure to enable dark mode in discord settings for the theme to apply properly!!! */

@import url('https://refact0r.github.io/midnight-discord/midnight.css');

/* customize things here */
:root {
	/* font, change to 'gg sans' for default discord font*/
	--font: 'figtree';

	/* color of status indicators and window controls */
	--online-indicator: #d0d694; /* change to #23a55a for default green */
	--dnd-indicator: #cf223e; /* change to #f13f43 for default red */
	--idle-indicator: #e39c45; /* change to #f0b232 for default yellow */
	--streaming-indicator: #614f76; /* change to #593695 for default purple */

	/* top left corner text */
	--corner-text: 'Biscuit';

	/* accent colors */
	--accent-1: hsl(268, 20%, 65%); /* links */
	--accent-2: hsl(268, 20%, 60%); /* general unread/mention elements */
	--accent-3: hsl(268, 20%, 50%); /* accent buttons */
	--accent-4: hsl(268, 20%, 39%); /* accent buttons when hovered */
	--accent-5: hsl(268, 20%, 34%); /* accent buttons when clicked */
	--mention: hsla(268, 20%, 39%, 0.1); /* mentions & mention messages */
	--mention-hover: hsla(268, 20%, 39%, 0.05); /* mentions & mention messages when hovered */

	/* text colors */
	--text-0: var(--text-2); /* text on colored elements */
	--text-1: hsl(24, 31%, 80%); /* other normally white text */
	--text-2: hsl(30, 100%, 89%); /* headings and important text */
	--text-3: hsl(24, 31%, 80%); /* normal text */
	--text-4: hsl(0, 12%, 66%); /* icon buttons and channels */
	--text-5: hsl(0, 12%, 56%); /* muted channels/chats and timestamps */

	/* background and dark colors */
	--bg-1: hsl(0, 12%, 40%); /* dark buttons when clicked */
	--bg-2: hsl(0, 12%, 24%); /* dark buttons */
	--bg-3: hsl(0, 11%, 16%); /* spacing, secondary elements */
	--bg-4: hsl(0, 11%, 9%); /* main background color */
	--hover: hsla(345, 27%, 29%, 0.1); /* channels and buttons when hovered */
	--active: hsla(345, 27%, 29%, 0.2); /* channels and buttons when clicked or selected */
	--message-hover: hsla(345, 0%, 0%, 0.1); /* messages when hovered */

	/* amount of spacing and padding */
	--spacing: 12px;

	/* animations */
	/* ALL ANIMATIONS CAN BE DISABLED WITH REDUCED MOTION IN DISCORD SETTINGS */
	--list-item-transition: 0.2s ease; /* channels/members/settings hover transition */
	--unread-bar-transition: 0.2s ease; /* unread bar moving into view transition */
	--moon-spin-transition: 0.4s ease; /* moon icon spin */
	--icon-spin-transition: 1s ease; /* round icon button spin (settings, emoji, etc.) */

	/* corner roundness (border-radius) */
	--roundness-xl: 22px; /* roundness of big panel outer corners */
	--roundness-l: 20px; /* popout panels */
	--roundness-m: 16px; /* smaller panels, images, embeds */
	--roundness-s: 12px; /* members, settings inputs */
	--roundness-xs: 10px; /* channels, buttons */
	--roundness-xxs: 8px; /* searchbar, small elements */

	/* direct messages moon icon */
	/* change to block to show, none to hide */
	--discord-icon: none; /* discord icon */
	--moon-icon: none; /* moon icon */
	--moon-icon-url: none;
	--moon-icon-size: auto;

	/* filter uncolorable elements to fit theme */
	/* (just set to none, they're too much work to configure) */
	--login-bg-filter: none; /* login background artwork */
	--green-to-accent-3-filter: none; /* add friend page explore icon */
	--blurple-to-accent-3-filter: none; /* add friend page school icon */
}
.childWrapper__01b9c:has(> svg:not(.favoriteIcon_adf80e)) {
	background-image: url('https://raw.githubusercontent.com/Biscuit-Colorscheme/.github/main/assets/icon-dark-nobg.png');
	background-color: transparent !important;
	background-size: contain;
	background-position: center;
	background-repeat: no-repeat;
}
```

# Catpuchin

```CSS
/**
 * @name midnight (catppuccin macchiato)
 * @description A dark, rounded discord theme. Based on catppuccin macchiato theme (https://github.com/catppuccin/catppuccin).
 * @author refact0r, esme, anubis
 * @version 1.6.2
 * @invite nz87hXyvcy
 * @website https://github.com/refact0r/midnight-discord
 * @source https://github.com/refact0r/midnight-discord/blob/master/flavors/midnight-catppuccin-macchiato.theme.css
 * @authorId 508863359777505290
 * @authorLink https://www.refact0r.dev
*/

/* IMPORTANT: make sure to enable dark mode in discord settings for the theme to apply properly!!! */

@import url('https://refact0r.github.io/midnight-discord/midnight.css');

/* customize things here */
:root {
	/* font, change to 'gg sans' for default discord font*/
	--font: 'figtree';

	/* top left corner text */
	--corner-text: 'Catppuccin';

	/* color of status indicators and window controls */
	--online-indicator: #a6da95; /* change to #23a55a for default green */
	--dnd-indicator: #ed8796; /* change to #f13f43 for default red */
	--idle-indicator: #eed49f; /* change to #f0b232 for default yellow */
	--streaming-indicator: #c6a0f6; /* change to #593695 for default purple */

	/* accent colors */
	--accent-1: hsl(234, 82%, 85%); /* links */
	--accent-2: hsl(234, 82%, 85%); /* general unread/mention elements */
	--accent-3: hsl(234, 82%, 85%); /* accent buttons */
	--accent-4: hsl(234, 68%, 77%); /* accent buttons when hovered */
	--accent-5: hsl(234, 52%, 69%); /* accent buttons when clicked */
	--mention: hsla(234, 67%, 77%, 0.1); /* mentions & mention messages */
	--mention-hover: hsla(234, 67%, 77%, 0.05); /* mentions & mention messages when hovered */

	/* text colors */
	--text-0: var(--bg-4); /* text on colored elements */
	--text-1: hsl(221, 44%, 95%); /* bright text on colored elements */
	--text-2: hsl(227, 68%, 88%); /* headings and important text */
	--text-3: hsl(227, 27%, 72%); /* normal text */
	--text-4: hsl(228, 15%, 57%); /* icon buttons and channels */
	--text-5: hsl(230, 14%, 41%); /* muted channels/chats and timestamps */

	/* background and dark colors */
	--bg-1: hsl(231, 16%, 34%); /* dark buttons when clicked */
	--bg-2: hsl(230, 19%, 26%); /* dark buttons */
	--bg-3: hsl(233, 23%, 15%); /* spacing, secondary elements */
	--bg-4: hsl(232, 23%, 18%); /* main background color */
	--hover: hsla(229, 15%, 53%, 0.1); /* channels and buttons when hovered */
	--active: hsla(235, 15%, 53%, 0.2); /* channels and buttons when clicked or selected */
	--message-hover: hsla(232, 0%, 0%, 0.1); /* messages when hovered */

	/* amount of spacing and padding */
	--spacing: 12px;

	/* animations */
	/* ALL ANIMATIONS CAN BE DISABLED WITH REDUCED MOTION IN DISCORD SETTINGS */
	--list-item-transition: 0.2s ease; /* channels/members/settings hover transition */
	--unread-bar-transition: 0.2s ease; /* unread bar moving into view transition */
	--moon-spin-transition: 0.4s ease; /* moon icon spin */
	--icon-spin-transition: 1s ease; /* round icon button spin (settings, emoji, etc.) */

	/* corner roundness (border-radius) */
	--roundness-xl: 22px; /* roundness of big panel outer corners */
	--roundness-l: 20px; /* popout panels */
	--roundness-m: 16px; /* smaller panels, images, embeds */
	--roundness-s: 12px; /* members, settings inputs */
	--roundness-xs: 10px; /* channels, buttons */
	--roundness-xxs: 8px; /* searchbar, small elements */

	/* direct messages moon icon */
	/* change to block to show, none to hide */
	--discord-icon: none; /* discord icon */
	--moon-icon: none; /* moon icon */
	--moon-icon-url: none; /* custom icon url */
	--moon-icon-size: auto;

	/* filter uncolorable elements to fit theme */
	/* (just set to none, they're too much work to configure) */
	--login-bg-filter: none; /* login background artwork */
	--green-to-accent-3-filter: none; /* add friend page explore icon */
	--blurple-to-accent-3-filter: none; /* add friend page school icon */
}

/* catppuccin icon */
.childWrapper_a6ce15:has(> svg:not(.favoriteIcon_adf80e)) {
	background: url('https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png');
	background-color: transparent !important;
	background-size: cover;
}
```