# see
#  - http://stackoverflow.com/questions/33764630/cannot-run-google-app-engine-custom-managed-vm-custom-entrypoint-must-be-set/33814096#33814096
#  - https://cloud.google.com/appengine/docs/flexible/custom-runtimes/build#developing_code_for_custom_runtimes

FROM gcr.io/google_appengine/python-compat
RUN apt-get update
RUN apt-get install -y gwhois

ADD . /app
