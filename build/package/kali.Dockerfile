FROM stevenaldinger/decker:kali

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

CMD ["bash"]
