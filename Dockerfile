# Base image with TorchServe
FROM pytorch/torchserve:latest

# Copy model store and configuration
COPY model_store/ /home/model-server/model-store/
COPY config.properties /home/model-server/config.properties

# Expose ports
EXPOSE 8080 8081 8082

# Start TorchServe
CMD ["torchserve", "--start","--ncs", "--model-store", "/home/model-server/model-store", "--disable-token-auth", "--models", "mv3l_aug.mar", "--ts-config", "/home/model-server/config.properties"]

