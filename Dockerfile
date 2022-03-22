
# Credit to maslick and his stackoverflow post
# https://stackoverflow.com/a/57124028/171400
# A lot of this docker file is inspired by his
FROM debian:bullseye-slim as builder

ENV EXCELCOMPARE_VERSION="0.6.1"
ENV EXCELCOMPARE_URL="https://github.com/na-ka-na/ExcelCompare/releases/download/${EXCELCOMPARE_VERSION}/ExcelCompare-${EXCELCOMPARE_VERSION}.zip"

RUN apt-get update \
   && apt-get install -y \
      wget \
      unzip \
   && rm -rf /var/lib/apt/lists/*

RUN mkdir -p "/app" \
    && cd "/app" \
    && wget --quiet ${EXCELCOMPARE_URL} -O excelcompare.zip \
    && unzip excelcompare.zip \
    && rm excelcompare.zip \
    && chmod +x /app/bin/excel_cmp

FROM maslick/minimalka:jdk11
COPY --from=builder "/app" "/app"

WORKDIR /wd
ENTRYPOINT ["/app/bin/excel_cmp"]
