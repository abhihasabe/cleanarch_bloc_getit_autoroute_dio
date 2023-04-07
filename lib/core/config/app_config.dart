/* (c) Walt Disney. All rights reserved. */

const baseConfigUrl = "baseUrl";

enum Environment { latest, stage, prod }

Map<String, String>? config;

void setEnvironment(Environment env) {
  switch (env) {
    case Environment.latest:
      config = latestConstants;
      break;
    case Environment.stage:
      config = stageConstants;
      break;
    case Environment.prod:
      config = prodConstants;
      break;
  }
}

get apiBaseUrl {
  return config?[baseConfigUrl];
}

Map<String, String> latestConstants = {
  baseConfigUrl: "https://latest.guestdclm.dcl.wdpr.disney.com",
};

Map<String, String> stageConstants = {
  baseConfigUrl: "https://stage.guestdclm.dcl.wdpr.disney.com",
};

Map<String, String> prodConstants = {
  baseConfigUrl: "https://api.dcl.disney.go.com",
};
