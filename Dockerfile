# Use the official Kali Linux image as the base image
FROM kalilinux/kali-rolling

# Set environment variables for user and password (change these as needed)
ENV KALI_USER=rhsalisu
ENV KALI_PASSWORD=Rabiu2004@

# Update the package repository and install SSH server
RUN apt-get update && apt-get install -y openssh-server

# Create a non-root user and set the password
RUN useradd -ms /bin/bash $KALI_USER \
    && echo "$KALI_USER:$KALI_PASSWORD" | chpasswd

# Expose SSH port
EXPOSE 22

# Expose a shell on port 8080 (Change this based on your specific needs)
EXPOSE 8080

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]

# Set the user to root (not recommended)
USER root
