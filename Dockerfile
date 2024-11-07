FROM ruby:3.0.1-buster

# Instala las dependencias necesarias
RUN apt-get update -y && apt-get install -y \
  curl \
  npm \
  && rm -rf /var/lib/apt/lists/*

# Instala Yarn
RUN npm install --global yarn

# Configura el directorio de trabajo
WORKDIR /app

# Copia el Gemfile y Gemfile.lock para instalar las gems
COPY Gemfile* ./

# Instala las gems
RUN bundle install

# Copia el resto de la aplicación
COPY . .

# Instala Webpacker
RUN rails webpacker:install

# Comando por defecto
CMD ["rails", "server", "-b", "0.0.0.0"]
