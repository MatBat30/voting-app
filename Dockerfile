FROM ubuntu:20.04

# Mettez à jour les paquets et installez les outils de base, y compris Python
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip

# Installez pip
RUN python3 -m pip install --upgrade pip
# Définissez le répertoire de travail
WORKDIR /azure-vote

# Copiez les fichiers Python de votre application dans le conteneur
COPY ./azure-vote .

EXPOSE 80

# Installez les dépendances Python
RUN pip install -r requirements.txt
# Exécutez l'application Python
CMD ["python3", "/azure-vote/main.py"]
