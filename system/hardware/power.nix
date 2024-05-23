{ ... }:

{
  services.thermald.enable = true;
  services.auto-cpufreq.settings = {
    enable = true;
    battery = {
      governor = "powersave";
      turbo = "never";
      enable_thresholds = true;
      start_threshold = 70;
      stop_threshold = 80;
      energy_performance_preference = "balance_power";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
      energy_performance_preference = "performance";
    };
  };

  # services.tlp = {
  #   enable = true;
  #   settings = {
  #     CPU_SCALING_GOVERNOR_ON_AC = "powersave"; 
  #     CPU_SCALING_GOVERNOR_ON_BAT = "powersave"; #performance
  #
  #     CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
  #     CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
  #
  #     CPU_MIN_PERF_ON_AC = 0;
  #     CPU_MAX_PERF_ON_AC = 100;
  #     CPU_MIN_PERF_ON_BAT = 0;
  #     CPU_MAX_PERF_ON_BAT = 50;
  #
  #     CPU_BOOST_ON_AC = 1;
  #     CPU_BOOST_ON_BAT = 0;
  #
  #     START_CHARGE_THRESH_BAT0 = 75;
  #     STOP_CHARGE_THRESH_BAT0 = 80;
  #
  #     PLATFORM_PROFILE_ON_AC = "balanced";
  #     PLATFORM_PROFILE_ON_BAT = "balanced";
  #
  #     # TODO: create separate power profiles for t480s and legion5p
  #     # TLP_DEAFAULT_MODE = "BAT";
  #     # TLP_PERSISTENT_DEFAULT = 1;
  #   };
  # };
}
