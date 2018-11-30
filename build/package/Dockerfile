FROM stevenaldinger/decker:minimal as decker

FROM golang:1.10

# add decker to the path
ENV PATH="$PATH:/go/bin"

COPY --from=decker /go/bin/decker /go/bin/decker
COPY --from=decker /go/bin/internal/app/decker/plugins /go/bin/internal/app/decker/plugins
COPY --from=decker /go/bin/examples /go/bin/examples

# install dep
RUN apt-get update \
 && apt-get install -y \
      ca-certificates \
 && curl https://raw.githubusercontent.com/golang/dep/master/install.sh \
      --output /tmp/install-dep.sh \
      --silent \
 && chmod a+x /tmp/install-dep.sh \
 && /tmp/install-dep.sh \
 && rm /tmp/install-dep.sh \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG APP_NAME=decker-plugin

RUN mkdir -p /go/src/github.com/stevenaldinger/$APP_NAME \
 && touch /go/src/github.com/stevenaldinger/$APP_NAME/decker-plugin.hcl /go/src/github.com/stevenaldinger/$APP_NAME/decker-plugin.so \
 && mkdir -p /go/bin/internal/app/decker/plugins/$APP_NAME \
 && ln -sf /go/src/github.com/stevenaldinger/$APP_NAME/decker-plugin.hcl /go/bin/internal/app/decker/plugins/decker-plugin/decker-plugin.hcl \
 && ln -sf /go/src/github.com/stevenaldinger/$APP_NAME/decker-plugin.so /go/bin/internal/app/decker/plugins/decker-plugin/decker-plugin.so

WORKDIR /go/src/github.com/stevenaldinger/$APP_NAME

CMD ["bash"]
