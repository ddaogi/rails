# 사용할 Ruby 버전에 맞는 기본 이미지를 선택합니다.
FROM ruby:3.2.2

# 작업 디렉토리를 설정합니다.
WORKDIR /myapp

# 기본 필요한 OS 패키지들을 설치합니다.
# build-essential: 기본적인 빌드 도구(컴파일러 등)를 설치합니다.
# libpq-dev: PostgreSQL을 위한 라이브러리를 설치합니다.
# nodejs: JavaScript 런타임을 설치합니다.
RUN apt-get update -qq && apt-get install -y nodejs npm build-essential libpq-dev

# Yarn을 설치합니다. (Webpacker가 필요한 경우)
RUN npm install -g yarn

# 현재 Gemfile과 Gemfile.lock을 컨테이너 내부로 복사합니다.
COPY Gemfile* /myapp/

# Bundler를 사용하여 Gemfile에 명시된 gem들을 설치합니다.
RUN bundle install

# 현재 디렉토리의 모든 파일을 컨테이너의 작업 디렉토리로 복사합니다.
COPY . /myapp/

# 컨테이너의 기본 실행 명령을 설정합니다. 이 명령은 컨테이너가 실행될 때 호출됩니다.
CMD ["rails", "server", "-b", "0.0.0.0"]
