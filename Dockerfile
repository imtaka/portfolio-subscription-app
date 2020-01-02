FROM ruby:2.6
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    #&& apt-get install -y nginx \
    && mkdir /webapp

#ADD nginx.conf /etc/nginx/sites-available/app.conf
#RUN rm -f /etc/nginx/sites-enabled/default && \
 #   ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf

WORKDIR /webapp
COPY Gemfile /webapp/Gemfile
COPY Gemfile.lock /webapp/Gemfile.lock
RUN gem install bundler:2.0.2
RUN bundle install
COPY . /webapp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
#EXPOSE 3000


#CMD ["rails", "server", "-b", "0.0.0.0"]
RUN mkdir -p tmp/sockets
#RUN mkdir -p tmp/pids
#CMD bundle exec puma
#CMD ["bundle", "exec", "pumactl", "start", "config/puma.rb"]
#CMD bundle exec puma -d && \
 #   /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf