
import LeftSidebar from './left-sidebar';
import RightSidebar from './right-sidebar';
import Topbar from './topbar';

class LayoutThemeApp {


    constructor() {
        this.SIDEBAR_THEME_DEFAULT = 'default';
        this.SIDEBAR_THEME_LIGHT = 'light';
        this.SIDEBAR_THEME_DARK = 'dark';

        this.DEFAULT_CONFIG = {
            sideBarTheme: "default",
            isBoxed: false,
            isCondensed: false,
            isScrollable: false,
            isDarkModeEnabled: false
        };
        this.body = document.getElementsByTagName("body")[0];
        this.window = window;
        this._config = {};
        this.defaultSelectedStyle = null;
        this.leftSidebar = new LeftSidebar();
    }

    _saveConfig = (newConfig) => {
        Object.assign(this._config, newConfig);
        // sessionStorage.setItem('_HYPER_CONFIG_', JSON.stringify(this._config));
    }

    _getStoredConfig = () => {
        var bodyConfig = this.body.getAttribute('data-layout-config');
        var config = this.DEFAULT_CONFIG;
        if (bodyConfig) {
            config['sideBarTheme'] = bodyConfig['leftSideBarTheme'];
            config['isBoxed'] = bodyConfig['layoutBoxed'];
            config['isCondensed'] = bodyConfig['leftSidebarCondensed'];
            config['isScrollable'] = bodyConfig['leftSidebarScrollable'];
            config['isDarkModeEnabled'] = bodyConfig['darkMode'];
        }
        return config;
    }

    /**
     * Apply the given config and sets the layout and theme
     */
    _applyConfig = () => {
        var self = this;

        // getting the saved config if available
        this._config = this._getStoredConfig();

        // activate menus

        this.leftSidebar.init();

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
        if (self._config.isDarkModeEnabled)
            self.activateDarkMode();
        else
            self.deactivateDarkMode();

        // sets the boxed
        if (self._config.isBoxed) self.activateBoxed();

        // sets condensed view
        if (self._config.isCondensed) self.activateCondensedSidebar();

        // sets scrollable navbar
        if (self._config.isScrollable) self.activateScrollableSidebar();
    }

    /**
     * Initilizes the layout
     */
    _adjustLayout = () => {
        // in case of small size, add class enlarge to have minimal menu
        if (this.window.width >= 750 && this.window.width <= 1028) {
            this.activateCondensedSidebar(true);
        } else {
            var config = this._getStoredConfig();
            if (!config.isCondensed && !config.isScrollable)
                this.deactivateCondensedSidebar();
        }
    }




    /**
     * Activate fluid mode
     */
    activateFluid = () => {
        this._saveConfig({ isBoxed: false });
        this.body.attr('data-layout-mode', 'fluid');
    }

    /**
     * Activate boxed mode
     */
    activateBoxed = () => {
        this._saveConfig({ isBoxed: true });
        this.body.attr('data-layout-mode', 'boxed');
    }

    /**
     * Activates the condensed side bar
     */
    activateCondensedSidebar = (ignoreToStore) => {
        if (!ignoreToStore) {
            this._saveConfig({
                isCondensed: true,
                isScrollable: false
            });
        }
        this.leftSidebar.activateCondensedSidebar();
    }

    /**
     * Deactivates the condensed side bar
     */
    deactivateCondensedSidebar = () => {
        this._saveConfig({ isCondensed: false });
        this.leftSidebar.deactivateCondensedSidebar();
    }

    /**
     * Activates the scrollable sidebar
     */
    activateScrollableSidebar = () => {
        this._saveConfig({ isScrollable: true, isCondensed: false });
        this.leftSidebar.activateScrollableSidebar();
    }

    /**
     * Deactivates the scrollable sidenar
     */
    deactivateScrollableSidebar = () => {
        this._saveConfig({ isScrollable: false });
        this.leftSidebar.deactivateScrollableSidebar();
    }

    /**
     * Activates the default theme
     */
    activateDefaultSidebarTheme = () => {
        //TODO: $.LeftSidebar.activateDefaultTheme();
        this._saveConfig({ sideBarTheme: this.SIDEBAR_THEME_DEFAULT });
    }

    /**
     * Activates the light theme
     */
    activateLightSidebarTheme = () => {
        //this._resetLayout();
        this.leftSidebar.activateLightTheme();
        this._saveConfig({ sideBarTheme: this.SIDEBAR_THEME_LIGHT });
    }

    /**
     * Activates the dark theme
     */
    activateDarkSidebarTheme = () => {
        // this._resetLayout();
        this.leftSidebar.activateDarkTheme();
        this._saveConfig({ sideBarTheme: this.SIDEBAR_THEME_DARK });
    }

    /**
     * toggle the dark mode
     */
    activateDarkMode = () => {
        document.getElementById('light-style').disabled = true;
        document.getElementById("dark-style").disabled = false;
        this.leftSidebar.activateDarkTheme();
        this._saveConfig({ isDarkModeEnabled: true, sideBarTheme: SIDEBAR_THEME_DARK });
    }

    /**
     * Deactivate the dark mode
     */
    deactivateDarkMode = () => {
        document.getElementById('light-style').disabled = false;
        document.getElementById("dark-style").disabled = true;

        this._saveConfig({ isDarkModeEnabled: false });
    }

    /**
     * Clear out the saved config
     */
    clearSavedConfig = () => {
        this._config = DEFAULT_CONFIG;
    }

    /**
     * Gets the config
     */
    getConfig = () => {
        return this._config;
    }

    /**
     * Reset to default
     */
    reset = (callback) => {
        this.clearSavedConfig();

        var self = this;
        const mainContainer = document.getElementById("main-style-container");
        if (mainContainer.length) {
            self.defaultSelectedStyle = mainContainer.attr('href');
        }
        self.deactivateCondensedSidebar();
        self.deactivateDarkMode();
        self.activateDefaultSidebarTheme();
        self.activateFluid();
        // calling the call back to let the caller know that it's done
        callback();
    }
    /**
     *
     */
    init = () => {

        // topbar
        this.topBar = new Topbar();
        this.topBar.init();
        this.rightBar = new RightSidebar();
        this.rightBar.init();
        this.leftSidebar = new LeftSidebar();
        this.leftSidebar.init();
    }
}

// window.addEventListener('load', function () {
//     new LayoutThemeApp().init();
// })
export default LayoutThemeApp;
