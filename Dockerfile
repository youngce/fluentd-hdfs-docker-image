FROM fluent/fluentd:latest
MAINTAINER  markyang<youngce0918@gmail.com>
USER root
RUN apk --no-cache --update add \
                                build-base\
                                ruby-dev

USER fluent
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.2.0/bin:$PATH
RUN gem install fluent-plugin-webhdfs
EXPOSE 24284
CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
