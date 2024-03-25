FROM alpine/git

RUN wget -q  https://api.github.com/repos/cli/cli/releases/latest \
    && wget -q $(cat latest | grep linux_amd64.tar.gz | grep browser_download_url | grep -v .asc | cut -d '"' -f 4) \
    && tar -xvzf gh*.tar.gz \
    && mv gh*/bin/gh /usr/local/bin/ \
    && wget -q https://github.com/mikefarah/yq/releases/download/v4.2.0/yq_linux_amd64.tar.gz \
    && tar -xvzf yq*.tar.gz \
    && mv yq_linux_amd64 /usr/local/bin/yq \
    && rm -fr *

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
