FROM kalilinux/kali-rolling

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color

# Update and install all network scanning tools
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    nmap \
    hping3 \
    netcat-traditional \
    wireshark \
    tshark \
    tcpdump \
    masscan \
    nikto \
    dnsutils \
    iputils-ping \
    net-tools \
    traceroute \
    fping \
    ncat \
    unicornscan \
    enum4linux \
    smbclient \
    snmp \
    arp-scan \
    netdiscover \
    proxychains \
    tor \
    curl \
    wget \
    git \
    vim \
    nano \
    htop \
    neofetch \
    nmap-scripts && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create working directories
RUN mkdir -p /root/scan-results /root/scripts /root/data

# Set working directory
WORKDIR /root

# Display welcome message
RUN echo '#!/bin/bash' > /root/.bashrc.d/welcome && \
    echo 'echo "════════════════════════════════════════"' >> /root/.bashrc.d/welcome && \
    echo 'echo "   Network Scanning Lab - Kali Linux"' >> /root/.bashrc.d/welcome && \
    echo 'echo "════════════════════════════════════════"' >> /root/.bashrc.d/welcome

CMD ["/bin/bash"]
