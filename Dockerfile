# Set the Docker image you want to base your image off.
# I chose this one because it has Elixir preinstalled.
FROM trenpixster/elixir:1.4.0

# Setup Node - Phoenix uses the Node library `brunch` to compile assets.
# The official node instructions want you to pipe a script from the
# internet through sudo. There are alternatives:
# https://www.joyent.com/blog/installing-node-and-npm
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && apt-get install -y nodejs



# Install other stable dependencies that don't change often

# Compile app
RUN mkdir /app
WORKDIR /app

# Install Elixir Deps
ADD mix.* ./
RUN MIX_ENV=prod mix local.rebar
RUN MIX_ENV=prod mix local.hex --force
RUN MIX_ENV=prod mix deps.get


ENV AWS_ACCESS_KEY_ID=AKIAIVDVZXQ3KV2ADISA
ENV AWS_SECRET_ACCESS_KEY=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
ENV BUCKET_NAME=phoenixprofilepicstoragebucket999
ENV SECRET_KEY_BASE=odZ3VPbBou3vWtzgLSp1mzBNqhmn2Zjxc5bdQLFcoa5xEaFsYG6qwbjF7b5VzSsN
ENV HOST=localhost
ENV PORT=80
ENV DBPORT=5432
ENV DBHOST=platypusnest.c9usvlx4atue.us-west-2.rds.amazonaws.com
ENV USERNAME=patientplatypus
ENV PASSWORD=Fvnjty0b
ENV DATABASE=newslydb

#RUN MIX_ENV=prod mix ecto.create

# Install Node Deps
ADD package.json ./
RUN npm install

#patientplatypus@next ~/Desktop/newsly/newsly_project $ aws ecr #create-repository --repository-name newsly-app
#{
#    "repository": {
#        "repositoryUri": "344677375614.dkr.ecr.us-west-2.amazonaws.com/newsly-app",
#        "repositoryArn": "arn:aws:ecr:us-west-2:344677375614:repository/newsly-app",
#        "registryId": "344677375614",
#        "repositoryName": "newsly-app",
#        "createdAt": 1510938107.0
#    }
#}




# Install app
ADD . .
RUN MIX_ENV=prod mix compile

# Compile assets
RUN NODE_ENV=prod node_modules/brunch/bin/brunch build --production
RUN MIX_ENV=prod mix phx.digest

# Exposes this port from the docker container to the host machine
EXPOSE 80

# The command to run when this image starts up
# CMD MIX_ENV=prod mix phx.server
CMD echo hello there sailor && MIX_ENV=prod mix ecto.migrate && MIX_ENV=prod mix phoenix.server
