FROM ruby:2.6
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && apt-get install -y nginx \
    && mkdir /myapp

ADD nginx.conf /etc/nginx/sites-available/app.conf
RUN rm -f /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler:2.0.2
RUN bundle install
COPY . /myapp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
#EXPOSE 3000

#CMD ["rails", "server", "-b", "0.0.0.0"]

CMD bundle exec puma -d && \
    /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf