# Network Scanning Tools - Quick Cheat Sheet 📋

## Nmap Quick Commands

### Host Discovery
\`\`\`bash
nmap -sn 192.168.1.0/24                    # Ping scan
nmap -Pn 192.168.1.1                       # Skip ping (assume host is up)
nmap -PS -PA -PU -PY 192.168.1.0/24        # Custom probe
\`\`\`

### Port Scanning
\`\`\`bash
nmap 192.168.1.1                           # Default scan (1000 ports)
nmap -p- 192.168.1.1                       # All 65535 ports
nmap -p 22,80,443 192.168.1.1              # Specific ports
nmap -p 1-1000 192.168.1.1                 # Port range
nmap -F 192.168.1.1                        # Fast (100 ports)
\`\`\`

### Scan Types
\`\`\`bash
nmap -sS 192.168.1.1                       # TCP SYN scan (stealth)
nmap -sT 192.168.1.1                       # TCP Connect scan
nmap -sU 192.168.1.1                       # UDP scan
nmap -sA 192.168.1.1                       # ACK scan (firewall)
nmap -sF 192.168.1.1                       # FIN scan
nmap -sN 192.168.1.1                       # NULL scan
nmap -sX 192.168.1.1                       # Xmas scan
\`\`\`

### Service & OS Detection
\`\`\`bash
nmap -sV 192.168.1.1                       # Service version detection
nmap -O 192.168.1.1                        # OS fingerprinting
nmap -A 192.168.1.1                        # Aggressive (OS, version, scripts)
nmap --script vuln 192.168.1.1             # Vulnerability scanning
\`\`\`

### Timing & Performance
\`\`\`bash
nmap -T0 192.168.1.1                       # Paranoid (very slow)
nmap -T1 192.168.1.1                       # Sneaky
nmap -T2 192.168.1.1                       # Polite
nmap -T3 192.168.1.1                       # Normal (default)
nmap -T4 192.168.1.1                       # Aggressive (fast)
nmap -T5 192.168.1.1                       # Insane (very fast)
\`\`\`

### Output Options
\`\`\`bash
nmap -oN output.txt 192.168.1.1            # Normal format
nmap -oX output.xml 192.168.1.1            # XML format
nmap -oG output.grep 192.168.1.1           # Grepable format
nmap -oA output 192.168.1.1                # All formats
nmap -v 192.168.1.1                        # Verbose
nmap -vv 192.168.1.1                       # Very verbose
\`\`\`

---

## Hping3 Quick Commands

### Ping Methods
\`\`\`bash
hping3 -1 192.168.1.1                      # ICMP ping
hping3 -2 192.168.1.1                      # UDP ping
hping3 -0 192.168.1.1                      # Raw IP ping
\`\`\`

### Port Scanning
\`\`\`bash
hping3 -S -p 80 192.168.1.1                # SYN to port 80
hping3 -A -p 80 192.168.1.1                # ACK to port 80
hping3 -U -p 80 192.168.1.1                # URG to port 80
hping3 -F -p 80 192.168.1.1                # FIN to port 80
hping3 -8 1-100 -S 192.168.1.1             # Scan ports 1-100
\`\`\`

### Advanced Options
\`\`\`bash
hping3 -S -p 80 -c 10 192.168.1.1          # Send 10 packets
hping3 --fast -S -p 80 192.168.1.1         # Fast mode (10 pps)
hping3 --faster -S -p 80 192.168.1.1       # Faster mode (100 pps)
hping3 --flood -S -p 80 192.168.1.1        # Flood mode
hping3 --traceroute -S -p 80 192.168.1.1   # Traceroute mode
\`\`\`

---

## Netcat Quick Commands

### Port Scanning
\`\`\`bash
nc -zv 192.168.1.1 80                      # Single port
nc -zv 192.168.1.1 1-1000                  # Port range
nc -zvu 192.168.1.1 53                     # UDP port
\`\`\`

### Banner Grabbing
\`\`\`bash
nc -v 192.168.1.1 80                       # HTTP banner
nc -v 192.168.1.1 22                       # SSH banner
nc -v 192.168.1.1 21                       # FTP banner
\`\`\`

### File Transfer
\`\`\`bash
nc -l -p 1234 > file.txt                   # Receiver (listen)
nc 192.168.1.1 1234 < file.txt             # Sender
\`\`\`

---

## Masscan Quick Commands

\`\`\`bash
masscan 192.168.1.0/24 -p80,443            # Basic scan
masscan 192.168.1.1 -p0-65535              # All ports
masscan 192.168.1.0/24 -p80 --rate 10000   # Rate limit
masscan 192.168.1.0/24 -p80 -oL output.txt # Output to file
\`\`\`

---

## Tcpdump Quick Commands

\`\`\`bash
tcpdump -i eth0                            # Capture on interface
tcpdump -i eth0 -w capture.pcap            # Save to file
tcpdump -r capture.pcap                    # Read file
tcpdump host 192.168.1.1                   # Filter by host
tcpdump port 80                            # Filter by port
tcpdump 'tcp port 80'                      # TCP port 80
tcpdump 'udp port 53'                      # UDP port 53
tcpdump -n -i eth0                         # No DNS resolution
tcpdump -nn -i eth0                        # No DNS and port resolution
\`\`\`

---

## Wireshark / Tshark

\`\`\`bash
tshark -i eth0                             # Capture packets
tshark -i eth0 -w capture.pcap             # Save capture
tshark -r capture.pcap                     # Read file
tshark -r capture.pcap -Y 'http'           # Filter HTTP traffic
tshark -r capture.pcap -Y 'dns'            # Filter DNS traffic
tshark -r capture.pcap -T fields -e ip.src # Extract specific field
\`\`\`

---

## DNS Tools

\`\`\`bash
# Dig
dig google.com                             # A record
dig google.com MX                          # MX records
dig google.com ANY                         # All records
dig -x 8.8.8.8                             # Reverse lookup
dig @8.8.8.8 google.com                    # Query specific DNS

# Nslookup
nslookup google.com                        # Basic query
nslookup -type=mx google.com               # MX records
nslookup google.com 8.8.8.8                # Specific DNS server

# Host
host google.com                            # Basic lookup
host -a google.com                         # All records
host -x 8.8.8.8                            # Reverse lookup
\`\`\`

---

## Common Ports Reference

| Port | Service | Protocol |
|------|---------|----------|
| 21 | FTP | TCP |
| 22 | SSH | TCP |
| 23 | Telnet | TCP |
| 25 | SMTP | TCP |
| 53 | DNS | TCP/UDP |
| 80 | HTTP | TCP |
| 110 | POP3 | TCP |
| 143 | IMAP | TCP |
| 443 | HTTPS | TCP |
| 445 | SMB | TCP |
| 3306 | MySQL | TCP |
| 3389 | RDP | TCP |
| 5432 | PostgreSQL | TCP |
| 8080 | HTTP Proxy | TCP |
| 8443 | HTTPS Alt | TCP |

---

## Docker Commands

\`\`\`bash
# Start lab
docker-compose up -d

# Stop lab
docker-compose down

# Access Kali
docker exec -it kali-scanner bash

# View logs
docker-compose logs -f

# Restart services
docker-compose restart
\`\`\`

---

## Tips & Tricks

1. **Save scan results**: Always use `-o` options to save output
2. **Combine tools**: Use output from one tool as input to another
3. **Use timing templates**: `-T4` or `-T5` for faster scans
4. **Stealth scanning**: Use `-sS` instead of `-sT`
5. **Script scanning**: Use NSE scripts with `--script`
6. **Firewall evasion**: Try different scan types if one fails
7. **Large networks**: Use Masscan for speed
8. **Detailed info**: Use `-A` for comprehensive scanning

---

Last Updated: 2025-11-05
