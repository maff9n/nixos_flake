{ lib, osConfig, ... }:
{
  services.redshift = {
    enable = true;
    latitude = 51.05;
    longitude = 13.73;
    temperature = {
      day = 4000;
      night = 3500;
    };
  };

}
