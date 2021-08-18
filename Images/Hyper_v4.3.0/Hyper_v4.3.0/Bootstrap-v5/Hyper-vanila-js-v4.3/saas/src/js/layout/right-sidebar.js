import {Offcanvas} from 'bootstrap';

class RightSidebar {

  constructor() {
    this.body = document.body;
    this.window = window;

    this.SIDEBAR_THEME_DEFAULT = 'default';
    this.SIDEBAR_THEME_LIGHT = 'light';
    this.SIDEBAR_THEME_DARK = 'dark';

    this.DEFAULT_CONFIG = {
      sideBarTheme: 'dark',
      isBoxed: false,
      isCondensed: false,
      isScrollable: false,
      isDarkModeEnabled: false
    };

    this._config = this._getStoredConfig();
    this.defaultSelectedStyle = null;

  }

  _saveConfig = (newConfig) => {
    Object.assign(this._config, newConfig);
    // sessionStorage.setItem('_HYPER_CONFIG_', JSON.stringify(this._config));
    this.body.setAttribute('data-layout-config', JSON.stringify(this._config));
    this._selectOptionsFromConfig();
    if (this._config.isCondensed) {
      this.body.setAttribute('data-leftbar-compact-mode', 'condensed');
    } else if (this._config.isScrollable) {
      this.body.setAttribute('data-leftbar-compact-mode', 'scrollable');
    } else {
      this.body.setAttribute('data-leftbar-compact-mode', 'fixed');
    }

    this.body.setAttribute('data-leftbar-theme', this._config.sideBarTheme);

    if (this._config.isBoxed) {
      this.body.setAttribute('data-layout-mode', 'boxed');
    } else {
      this.body.setAttribute('data-layout-mode', 'fluid');
    }

  };

  _changeBody() {

  }

  _getStoredConfig = () => {
    var bodyConfig = this.body.getAttribute('data-layout-config');
    var config = this.DEFAULT_CONFIG;
    if (bodyConfig) {
      config['sideBarTheme'] = bodyConfig['leftSideBarTheme'] ?? config['sideBarTheme'];
      config['isBoxed'] = bodyConfig['layoutBoxed'] ?? config['isBoxed'];
      config['isCondensed'] = bodyConfig['leftSidebarCondensed'] ?? config['isCondensed'];
      config['isScrollable'] = bodyConfig['leftSidebarScrollable'] ?? config['isScrollable'];
      config['isDarkModeEnabled'] = bodyConfig['darkMode'] ?? config['isDarkModeEnabled'];
    }
    return config;
  };

  _applyConfig = () => {
    var self = this;

    // getting the saved config if available
    this._config = this._getStoredConfig();

    // activate menus

    // sets the theme
    switch (self._config.sideBarTheme) {
      case self.SIDEBAR_THEME_DARK: {
        self.activateDarkSidebarTheme();
        break;
      }
      case self.SIDEBAR_THEME_LIGHT: {
        self.activateLightSidebarTheme();
        break;
      }
    }

    // enable or disable the dark mode
    if (self._config.isDarkModeEnabled) {
      self.activateDarkMode();
    } else {
      self.deactivateDarkMode();
    }

    // sets the boxed
    if (self._config.isBoxed) self.activateBoxed();

    // sets condensed view
    if (self._config.isCondensed) self.activateCondensedSidebar();

    // sets scrollable navbar
    if (self._config.isScrollable) self.activateScrollableSidebar();
  };

  /**
   * Initilizes the layout
   */
  _adjustLayout(){


    // in case of small size, add class enlarge to have minimal menu
    if (this.window.innerWidth <= 1024) {
      this.activateCondensedSidebar();
    } else {
      var config = this._getStoredConfig();
      // if (!config.isCondensed && !config.isScrollable) {
        this.deactivateCondensedSidebar();

    }
  };

  /**
   * Activate fluid mode
   */
  activateFluid = () => {
    this._saveConfig({ isBoxed: false });
    window.dispatchEvent(new Event('hyper.setFluid'));
  };

  /**
   * Activate boxed mode
   */
  activateBoxed = () => {
    this._saveConfig({ isBoxed: true });
    window.dispatchEvent(new Event('hyper.setBoxed'));
  };

  /**
   * Activates the condensed side bar
   */
  activateCondensedSidebar = (ignoreToStore) => {
    if (!ignoreToStore) {
      this._saveConfig({
        isCondensed: true,
        isScrollable: false
      });
      this._changeBody();
    }
  };

  /**
   * Deactivates the condensed side bar
   */
  deactivateCondensedSidebar = () => {
    this._saveConfig({ isCondensed: false });
    this._changeBody();
  };

  reset = () => {
    this.deactivateCondensedSidebar();
    //this.deactivateDarkMode();
    this.activateDarkSidebarTheme();
    this.activateFluid();
    this._changeBody();
  };



  /**
   * Activates the scrollable sidebar
   */
  activateScrollableSidebar = () => {
    this._saveConfig({
      isScrollable: true,
      isCondensed: false
    });
    this._changeBody();
  };

  /**
   * Deactivates the scrollable sidenar
   */
  deactivateScrollableSidebar = () => {
    this._saveConfig({ isScrollable: false });
  };

  /**
   * Activates the default theme
   */
  activateDefaultSidebarTheme = () => {
    this._saveConfig({ sideBarTheme: this.SIDEBAR_THEME_DEFAULT });
  };

  /**
   * Activates the light theme
   */
  activateLightSidebarTheme = () => {
    //this._resetLayout();
    this._saveConfig({ sideBarTheme: this.SIDEBAR_THEME_LIGHT });
  };

  /**
   * Activates the dark theme
   */
  activateDarkSidebarTheme = () => {
    // this._resetLayout();
    this._saveConfig({ sideBarTheme: this.SIDEBAR_THEME_DARK });
  };

  /**
   * toggle the dark mode
   */
  activateDarkMode = () => {

    this._saveConfig({
      isDarkModeEnabled: true,
      sideBarTheme: this.SIDEBAR_THEME_DARK
    });
    this._changeBody();
  };

  /**
   * Deactivate the dark mode
   */
  deactivateDarkMode = () => {

    this._saveConfig({ isDarkModeEnabled: false });
  };

  /**
   * Clear out the saved config
   */
  clearSavedConfig = () => {
    this._config = this.DEFAULT_CONFIG;
  };

  /**
   * Gets the config
   */
  getConfig = () => {
    return this._config;
  };

  /**
   * Reset to default
   */
  reset = () => {
    this.clearSavedConfig();

    var self = this;
    const mainContainer = document.getElementById('main-style-container');
    if (mainContainer?.length) {
      self.defaultSelectedStyle = mainContainer.attr('href');
    }
    self.deactivateCondensedSidebar();
    self.deactivateDarkMode();
    self.activateDarkSidebarTheme();
    self.activateFluid();
    // calling the call back to let the caller know that it's done
  };

  /**
   * Select the option based on saved config
   */
  _selectOptionsFromConfig = () => {
    var config = this._config;

    const allInputs = document.querySelectorAll('.end-bar input');



    if (config && allInputs.length>0) {
      allInputs.forEach(function (element) {
              element.checked = false;
            });
      switch (config.sideBarTheme) {
        case 'default':
          document.getElementById('default-check').checked = true;
          break;
        case 'light':
          document.getElementById('light-check').checked = true;
          break;
        case 'dark':
          document.getElementById('dark-check').checked = true;
          break;
      }

      if (config.isBoxed) {
        document.getElementById('boxed-check').checked = true;
      } else {
        document.getElementById('fluid-check').checked = true;
      }
      if (config.isCondensed) {
        document.getElementById('condensed-check').checked = true;
      }
      if (config.isScrollable) {
        document.getElementById('scrollable-check').checked = true;
      }
      if (!config.isScrollable && !config.isCondensed) {
        document.getElementById('fixed-check').checked = true;
      }
    }
  };

  findAncestor (el, cls) {
    while ((el = el.parentElement) && !el.classList.contains(cls));
    return el;
  }

  toggleRightSideBar = () => {
    var self = this;
    self.body.classList.toggle('end-bar-enabled');
    self._selectOptionsFromConfig();
  };


  init() {

    const self = this;

    const mainContainer = document.getElementById('main-style-container');

    // showing the sidebar on load if user is visiting the page first time only
    var bodyConfig = this.body.getAttribute('data-layout-config');
    if (window.sessionStorage && bodyConfig && bodyConfig.hasOwnProperty('showRightSidebarOnStart') && bodyConfig['showRightSidebarOnStart']) {
      var alreadyVisited = sessionStorage.getItem('_HYPER_VISITED_');
      if (!alreadyVisited) {
        //this.toggleRightSideBar();
        sessionStorage.setItem('_HYPER_VISITED_', true);
      }
    }

    if (mainContainer) {
      self.defaultSelectedStyle = mainContainer.href;
    }

    // initialize the menu
    this._applyConfig();


    // adjust layout based on width
    this._adjustLayout();

    // on window resize, make menu flipped automatically
    window.addEventListener('resize', function (e) {
      //e.preventDefault();
      self._adjustLayout();
    });

    if (document.querySelector('.button-menu-mobile')) {

      document.querySelector('.button-menu-mobile')
        .addEventListener('click', function (e) {
          e.preventDefault();

          self.body.classList.toggle('sidebar-enable');

          if (self.window.innerWidth >= 768) {
            if (self._config.isCondensed) {
              self.deactivateCondensedSidebar();
            } else {
              self.activateCondensedSidebar();
            }
          }

        });
    }

    // document.querySelectorAll('.end-bar-toggle').forEach(function (element){
    //   element.addEventListener('click', function () {
    //     self.toggleRightSideBar();
    //   });
    // });



    // this.body.addEventListener('click', function (e) {

    //   if(e.target.classList.contains('end-bar-toggle') || e.target.classList.contains('dripicons-gear')){
    //     return;
    //   }
    //   if(self.findAncestor(e.target,'end-bar')){
    //     return;
    //   }

    //   self.body.classList.remove('end-bar-enabled');
    //   self.body.classList.remove('sidebar-enable');
    // });

    document.querySelectorAll('input[type=checkbox][name=width]')
      .forEach(element => {
        element.addEventListener('change', function (e) {
          switch (e.target.value) {
            case 'fluid':
              self.activateFluid();
              break;
            case 'boxed':
              self.activateBoxed();
              break;
          }
        });
      });

    document.querySelectorAll('input[type=checkbox][name=theme]')
      .forEach(element => {
        element.addEventListener('change', function (e) {

          switch (e.target.value) {
            case 'default':
              self.activateDefaultSidebarTheme();
              break;
            case 'light':
              self.activateLightSidebarTheme();
              break;
            case 'dark':
              self.activateDarkSidebarTheme();
              break;
          }
        });
      });

    document.querySelectorAll('input[type=checkbox][name=compact]')
      .forEach(element => {
        element.addEventListener('change', function (e) {
          switch (e.target.value) {
            case 'fixed':
              self.deactivateCondensedSidebar();
              self.deactivateScrollableSidebar();
              break;
            case 'scrollable':
              self.activateScrollableSidebar();
              break;
            case 'condensed':
              self.activateCondensedSidebar();
              break;
          }
        });
      });

    // overall color scheme

    document.querySelectorAll('input[type=checkbox][name=color-scheme-mode]')
      .forEach(element => {

        element.addEventListener('change', function (e) {
          switch (e.target.value) {
            case 'light':
              self.deactivateDarkMode();
              self.activateDefaultSidebarTheme();
              document.getElementById('default-check').checked = true;
              document.querySelectorAll('input[type=checkbox][name=theme]')
                .forEach(element => {
                  element.disabled = false;
                });
              break;
            case 'dark':
              self.activateDarkMode();
              document.getElementById('dark-check').checked = true;
              // $('input[type=radio][name=theme]').prop('disabled', true);
              break;
          }
        });
      });

    // reset
    document.getElementById('resetBtn')
      ?.addEventListener('click', function (e) {
        e.preventDefault();
        // reset to default
        self.reset();
         self._selectOptionsFromConfig();
        
      });

    document.querySelector('.end-bar-toggle')?.addEventListener('click',function (){
      Offcanvas.getInstance(document.getElementById('endbar-offcanvas')).hide();
    })

  }
}

export default RightSidebar;
