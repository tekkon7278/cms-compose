FROM fluentd
COPY ./files/fluent.conf /fluentd/etc/
USER root
RUN fluent-gem install fluent-plugin-forest
USER fluent
