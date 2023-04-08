FROM texlive/texlive:latest-minimal

# Install procps for ps command (used by latexmk -pvc)
RUN apt-get update && apt-get -y install texlive-latex-base  \
    texlive-latex-extra texlive-lang-spanish latexmk procps

ARG LATEX_PROJECT_NAME
# Use the env variable because the arg variable is not available in the entrypoint
ENV LATEX_PROJECT_NAME=${LATEX_PROJECT_NAME}

ARG USER_ID
ARG GROUP_ID
RUN groupadd -g ${GROUP_ID} tex && \
    useradd -u ${USER_ID} -g ${GROUP_ID} -ms /bin/bash tex

WORKDIR /home/tex/app

RUN mkdir -p target

COPY scripts/run.sh .
COPY src/ ./src
COPY assets/ ./assets

RUN chown -R tex:tex /home/tex/app/target

USER tex

ENTRYPOINT ["./run.sh"]
