# https://gitlab.com/rycee/nur-expressions/-/blob/master/pkgs/firefox-addons/addons.json
{ lib, pkgs, ... }:
{
  enable = true;
  profiles = {
    default.settings = {
      "browser.newtab.extensionControlled" = true;
      "browser.download.dir" = "/home/maff9n/downloads";
      "browser.startup.homepage" = "https://github.com/maff9n";
      "browser.toolbars.bookmarks.visibility" = "always";
      "browser.engagement.home-button.has-removed" = true;
      "browser.search.suggest.enabled" = false;
      "browser.sessionstore.warnOnQuit" = false;
      "browser.aboutConfig.showWarning" = false;
      "browser.ctrlTab.recentlyUsedOrder" = false;
      "browser.download.panel.shown" = true;
      "browser.newtab.privateAllowed" = true;
      "findbar.highlightAll" = true;
    };
    default.extensions.packages = (with pkgs.nur.repos.rycee.firefox-addons; [
      darkreader
      privacy-badger
      #shortkeys
      reddit-enhancement-suite
      ublock-origin
      multi-account-containers
      keepassxc-browser
      bitwarden
      vimium
      octotree
      refined-github
    ]);
  };
}
