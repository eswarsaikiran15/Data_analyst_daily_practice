# 🖥️ CS Core Interview Master Notes
### Computer Networks · DBMS · Operating Systems · OOPs in Python
> **Format:** Concept → Definition → Interview Q&A with detailed answers  
> **Target:** FAANG, product companies, technical interviews at all levels


## 📋 Table of Contents

### 🌐 Computer Networks
1. [Basics & OSI Model](#1-basics--osi-model)
2. [TCP/IP Model & Protocols](#2-tcpip-model--protocols)
3. [TCP vs UDP](#3-tcp-vs-udp)
4. [HTTP / HTTPS](#4-http--https)
5. [DNS](#5-dns)
6. [IP Addressing & Subnetting](#6-ip-addressing--subnetting)
7. [Routing & Switching](#7-routing--switching)
8. [Network Devices](#8-network-devices)
9. [Sockets & Ports](#9-sockets--ports)
10. [Security — Firewalls, SSL/TLS, VPN](#10-security--firewalls-ssltls-vpn)
11. [CDN, Load Balancing, Proxies](#11-cdn-load-balancing-proxies)
12. [WebSockets & REST vs GraphQL](#12-websockets--rest-vs-graphql)

### 🗄️ Database Management Systems
13. [DBMS Fundamentals](#13-dbms-fundamentals)
14. [Relational Model & Keys](#14-relational-model--keys)
15. [SQL — DDL, DML, DCL](#15-sql--ddl-dml-dcl)
16. [Joins](#16-joins)
17. [Normalization](#17-normalization)
18. [Transactions & ACID](#18-transactions--acid)
19. [Concurrency Control & Locks](#19-concurrency-control--locks)
20. [Indexing & B-Trees](#20-indexing--b-trees)
21. [Query Optimization](#21-query-optimization)
22. [NoSQL vs SQL](#22-nosql-vs-sql)
23. [CAP Theorem](#23-cap-theorem)
24. [Stored Procedures, Triggers, Views](#24-stored-procedures-triggers-views)

### ⚙️ Operating Systems
25. [OS Fundamentals & Process vs Thread](#25-os-fundamentals--process-vs-thread)
26. [Process Scheduling](#26-process-scheduling)
27. [Synchronization — Mutex, Semaphore, Deadlock](#27-synchronization--mutex-semaphore-deadlock)
28. [Memory Management & Virtual Memory](#28-memory-management--virtual-memory)
29. [Paging & Segmentation](#29-paging--segmentation)
30. [File Systems](#30-file-systems)
31. [System Calls & IPC](#31-system-calls--ipc)
32. [CPU Scheduling Algorithms](#32-cpu-scheduling-algorithms)

### 🐍 OOPs in Python
33. [OOP Fundamentals — 4 Pillars](#33-oop-fundamentals--4-pillars)
34. [Classes, Objects & `self`](#34-classes-objects--self)
35. [Encapsulation & Properties](#35-encapsulation--properties)
36. [Inheritance & `super()`](#36-inheritance--super)
37. [Polymorphism & Duck Typing](#37-polymorphism--duck-typing)
38. [Abstraction & ABCs](#38-abstraction--abcs)
39. [Magic / Dunder Methods](#39-magic--dunder-methods)
40. [Class vs Static vs Instance Methods](#40-class-vs-static-vs-instance-methods)
41. [MRO & Multiple Inheritance](#41-mro--multiple-inheritance)
42. [Composition vs Inheritance](#42-composition-vs-inheritance)
43. [Design Patterns in Python](#43-design-patterns-in-python)
44. [SOLID Principles in Python](#44-solid-principles-in-python)

---

# 🌐 COMPUTER NETWORKS

---

## 1. Basics & OSI Model

### Concept
The **OSI (Open Systems Interconnection)** model is a conceptual framework with **7 layers** that standardises how different network systems communicate. Each layer has specific responsibilities and communicates only with the layers directly above and below it.

| Layer | Name | Function | Key Protocols/Devices |
|-------|------|----------|----------------------|
| 7 | Application | User-facing services | HTTP, FTP, SMTP, DNS, SSH |
| 6 | Presentation | Encryption, compression, translation | SSL/TLS, JPEG, ASCII |
| 5 | Session | Session management, authentication | NetBIOS, RPC |
| 4 | Transport | End-to-end delivery, error control | TCP, UDP |
| 3 | Network | Logical addressing, routing | IP, ICMP, Routers |
| 2 | Data Link | MAC addressing, framing | Ethernet, Switches, ARP |
| 1 | Physical | Bits over physical medium | Cables, Hubs, Repeaters |

**Mnemonic (top→bottom):** "**A**ll **P**eople **S**eem **T**o **N**eed **D**ata **P**rocessing"

### 🎯 Interview Q&A

> **Q: What is the OSI model and why was it created?**  
> **A:** The OSI model is a 7-layer conceptual framework created by ISO in 1984 to standardise how different vendor systems communicate. Before OSI, networks were proprietary — IBM systems couldn't talk to DEC systems. OSI defines each layer's responsibility clearly, so vendors can implement any layer independently as long as they respect the layer interface. In practice, the **TCP/IP model** (4 layers) is what the internet actually uses, but OSI is used as a teaching and troubleshooting reference.

> **Q: What happens when you type a URL in a browser? (Layer by layer)**  
> **A:** 1. **Application (L7)**: Browser constructs an HTTP GET request. 2. **Transport (L4)**: TCP breaks it into segments, adds port numbers (80 for HTTP), establishes a 3-way handshake. 3. **Network (L3)**: IP adds source/destination IP addresses; routing decides the path. 4. **Data Link (L2)**: Ethernet frames with MAC addresses are created; ARP resolves IP→MAC. 5. **Physical (L1)**: Bits are transmitted as electrical/optical/radio signals. On the server side, the reverse happens — each layer strips its header and passes to the layer above.

> **Q: What is the difference between L2 (Data Link) and L3 (Network) addressing?**  
> **A:** **L2 (MAC address)** is a hardware address burned into the NIC — 48-bit, flat, non-hierarchical, local-network only. Used for communication within the same subnet. **L3 (IP address)** is a logical address assigned administratively — 32-bit (IPv4) or 128-bit (IPv6), hierarchical, globally routable. IP addresses can change; MAC addresses don't. When a packet crosses a router, the IP address stays the same (end-to-end) but the MAC address changes at each hop (link-to-link). ARP maps IP → MAC within a LAN.

> **Q: What does the Transport layer do?**  
> **A:** The Transport layer (L4) provides **end-to-end communication** between processes on different hosts using **port numbers**. Key responsibilities: (1) **Multiplexing/demultiplexing** — multiple apps share the network using ports; (2) **Segmentation and reassembly** — breaking data into segments and reordering at destination; (3) **Error detection** — checksums; (4) **Flow control** — prevent sender from overwhelming receiver; (5) **Connection management** — TCP's 3-way handshake establishes reliable connections. TCP provides all these; UDP provides only multiplexing and optional checksum.

> **Q: What is the difference between the OSI model and the TCP/IP model?**  
> **A:** The **OSI model** has 7 layers (Application, Presentation, Session, Transport, Network, Data Link, Physical) and is a theoretical reference model. The **TCP/IP model** has 4 layers (Application, Transport, Internet, Network Access) and is the practical model the internet is built on. TCP/IP merges OSI's top 3 layers (Application+Presentation+Session) into one Application layer, and merges OSI's bottom 2 layers (Data Link+Physical) into one Network Access layer. TCP/IP was designed pragmatically around existing protocols; OSI was designed as an ideal theoretical framework.

---

## 2. TCP/IP Model & Protocols

### Concept
The **TCP/IP suite** is the actual protocol stack that powers the internet. Each protocol has a specific job and operates at a specific layer.

| Layer | Protocols |
|-------|-----------|
| Application | HTTP/HTTPS, FTP, SMTP, POP3, IMAP, DNS, DHCP, SSH, Telnet, SNMP |
| Transport | TCP, UDP |
| Internet | IP (IPv4/IPv6), ICMP, IGMP, ARP |
| Network Access | Ethernet, Wi-Fi (802.11), PPP |

**Key Port Numbers (must memorise):**
| Port | Protocol | Use |
|------|----------|-----|
| 20/21 | FTP | File transfer |
| 22 | SSH | Secure shell |
| 23 | Telnet | Remote terminal (insecure) |
| 25 | SMTP | Send email |
| 53 | DNS | Domain resolution |
| 67/68 | DHCP | IP address assignment |
| 80 | HTTP | Web traffic |
| 110 | POP3 | Receive email |
| 143 | IMAP | Email access |
| 443 | HTTPS | Secure web |
| 3306 | MySQL | Database |
| 5432 | PostgreSQL | Database |
| 6379 | Redis | Cache |
| 27017 | MongoDB | Database |

### 🎯 Interview Q&A

> **Q: What is DHCP and how does it work?**  
> **A:** **DHCP (Dynamic Host Configuration Protocol)** automatically assigns IP addresses and network configuration (subnet mask, gateway, DNS) to devices joining a network. Process — **DORA**: (1) **Discover** — client broadcasts "I need an IP" (since it has no IP yet); (2) **Offer** — DHCP server offers an available IP; (3) **Request** — client requests the offered IP; (4) **Acknowledge** — server confirms the lease. The IP is leased for a time period and must be renewed. Without DHCP, every device would need manual IP configuration.

> **Q: What is ARP and why is it needed?**  
> **A:** **ARP (Address Resolution Protocol)** maps an IP address (L3) to a MAC address (L2) within a LAN. When a host wants to send to `192.168.1.10` on the local subnet, it doesn't know that host's MAC address. It broadcasts "Who has 192.168.1.10? Tell 192.168.1.1." The target host responds with its MAC address. This mapping is cached in the **ARP table**. ARP is only used within a single subnet — for cross-network communication, packets go to the default gateway (router).

> **Q: What is ICMP? What is it used for?**  
> **A:** **ICMP (Internet Control Message Protocol)** is a network-layer protocol used for error reporting and diagnostics — not for carrying application data. Common uses: **ping** (sends ICMP Echo Request, expects Echo Reply — tests reachability and round-trip time) and **traceroute** (sends packets with increasing TTL values; each router that drops a packet sends an ICMP "Time Exceeded" message back, revealing the path). ICMP doesn't use ports — it's IP protocol number 1.

---

## 3. TCP vs UDP

### Concept
TCP and UDP are the two main Transport layer protocols, representing two fundamentally different approaches to data delivery.

| Feature | TCP | UDP |
|---------|-----|-----|
| Connection | Connection-oriented (3-way handshake) | Connectionless |
| Reliability | Guaranteed delivery, ordering, retransmission | Best-effort, no guarantee |
| Ordering | In-order delivery | No ordering |
| Flow Control | Yes (sliding window) | No |
| Congestion Control | Yes | No |
| Speed | Slower (overhead) | Faster |
| Header Size | 20 bytes minimum | 8 bytes |
| Use Cases | HTTP, FTP, SMTP, SSH | DNS, DHCP, video streaming, gaming, VoIP |

### 🎯 Interview Q&A

> **Q: Explain the TCP 3-way handshake.**  
> **A:** The 3-way handshake establishes a TCP connection before data transfer: (1) **SYN** — Client sends a segment with SYN flag and a random Initial Sequence Number (ISN), e.g., `SYN, seq=100`. (2) **SYN-ACK** — Server responds with its own SYN and acknowledges the client: `SYN, seq=300, ACK=101`. (3) **ACK** — Client acknowledges server's SYN: `ACK=301`. Now both sides have agreed on sequence numbers and a reliable connection is established. The exchange synchronises sequence numbers, which TCP uses to detect lost/out-of-order packets. Connection termination uses a **4-way FIN handshake**.

> **Q: What is the TCP 4-way termination (FIN handshake)?**  
> **A:** TCP connection termination is asymmetric — each direction is closed independently: (1) **FIN** — Client sends FIN to indicate it's done sending. (2) **ACK** — Server acknowledges client's FIN (but may still have data to send). (3) **FIN** — Server sends its own FIN when done. (4) **ACK** — Client acknowledges server's FIN. Client then enters **TIME_WAIT** state for 2×MSL (Maximum Segment Lifetime, ~2 minutes) before fully closing, ensuring any delayed packets are absorbed and not confused with a new connection.

> **Q: When would you choose UDP over TCP?**  
> **A:** Choose UDP when: (1) **Latency matters more than reliability** — real-time applications like VoIP, video conferencing, online gaming can tolerate occasional packet loss but not the delay from TCP retransmission; (2) **Simple request-response** — DNS queries are small and fast; if a response is lost, the app just retries; (3) **Broadcasting/multicasting** — UDP supports one-to-many; TCP is point-to-point; (4) **Custom reliability** — QUIC (HTTP/3) implements its own reliable delivery over UDP with better performance than TCP. The key insight: UDP's lack of features is a feature — apps can implement exactly the guarantees they need without TCP's overhead.

> **Q: What is TCP flow control and congestion control?**  
> **A:** **Flow control** prevents a fast sender from overwhelming a slow receiver. The receiver advertises a **receive window** (rwnd) — how much buffer space it has. The sender can't have more unacknowledged data than rwnd. **Congestion control** prevents a sender from overwhelming the network. TCP maintains a **congestion window** (cwnd) and uses algorithms like **Slow Start** (exponential growth until threshold), **Congestion Avoidance** (linear growth), and **Fast Retransmit/Recovery** (on 3 duplicate ACKs, assumes loss without waiting for timeout). The actual send window = min(rwnd, cwnd).

> **Q: What is TCP's sliding window mechanism?**  
> **A:** The sliding window allows TCP to send multiple segments before waiting for acknowledgements — "pipeline" the data. The window size determines how many bytes can be in-flight simultaneously. As ACKs arrive, the window "slides" forward, allowing more data to be sent. This is critical for performance on high-latency, high-bandwidth links (e.g., satellite) — without pipelining, you'd spend most time waiting for ACKs. Window size is constrained by both flow control (receiver's rwnd) and congestion control (cwnd).

---

## 4. HTTP / HTTPS

### Concept
**HTTP (HyperText Transfer Protocol)** is a stateless, application-layer protocol for transmitting hypermedia. **HTTPS** adds **SSL/TLS** encryption on top. HTTP/1.1, HTTP/2, and HTTP/3 are the major versions.

**HTTP Methods:**
| Method | Purpose | Idempotent | Safe |
|--------|---------|-----------|------|
| GET | Retrieve resource | ✅ | ✅ |
| POST | Create resource | ❌ | ❌ |
| PUT | Replace resource entirely | ✅ | ❌ |
| PATCH | Partial update | ❌ | ❌ |
| DELETE | Remove resource | ✅ | ❌ |
| HEAD | GET without body | ✅ | ✅ |
| OPTIONS | Get allowed methods | ✅ | ✅ |

**Key HTTP Status Codes:**
| Code | Meaning |
|------|---------|
| 200 | OK |
| 201 | Created |
| 204 | No Content |
| 301 | Moved Permanently |
| 302 | Found (temporary redirect) |
| 304 | Not Modified (cache hit) |
| 400 | Bad Request |
| 401 | Unauthorized (not authenticated) |
| 403 | Forbidden (authenticated but no permission) |
| 404 | Not Found |
| 429 | Too Many Requests (rate limited) |
| 500 | Internal Server Error |
| 502 | Bad Gateway |
| 503 | Service Unavailable |

### 🎯 Interview Q&A

> **Q: What is the difference between HTTP/1.1, HTTP/2, and HTTP/3?**  
> **A:** **HTTP/1.1**: One request per TCP connection at a time (or multiple connections). Head-of-line blocking — one slow request blocks others. Text-based protocol. **HTTP/2**: Multiplexing — multiple requests over a single TCP connection simultaneously using streams. Binary framing (more efficient). Header compression (HPACK). Server push. Still over TCP, so TCP head-of-line blocking exists. **HTTP/3**: Runs over **QUIC** (UDP-based), not TCP. Eliminates TCP head-of-line blocking entirely — each stream is independent. Faster connection establishment (0-RTT). Built-in TLS 1.3. Better for lossy networks.

> **Q: What is the difference between PUT and PATCH?**  
> **A:** **PUT** replaces the entire resource — if you PUT `{"name":"Alice","age":30}`, the resource becomes exactly that (any fields not included are removed/reset). **PATCH** applies a partial update — only the fields included in the request are changed, others remain. PUT is idempotent (multiple identical PUTs give same result). PATCH may or may not be idempotent depending on implementation. Use PUT for full replacement, PATCH for partial updates (more efficient over the network).

> **Q: What is the difference between 401 and 403?**  
> **A:** **401 Unauthorized** means the request lacks valid authentication credentials — the client is not identified. The solution is to log in (provide a token/password). **403 Forbidden** means the client IS authenticated (we know who you are) but does NOT have permission to access the resource. The solution is to request elevated privileges or access a different resource. Think: 401 = "Who are you?", 403 = "I know who you are, but you can't come in."

> **Q: What is HTTPS and how does TLS work?**  
> **A:** HTTPS = HTTP over **TLS (Transport Layer Security)**. TLS provides: **Confidentiality** (encryption), **Integrity** (data hasn't been tampered), **Authentication** (server proves its identity via certificate). TLS handshake: (1) Client sends "ClientHello" — supported cipher suites, TLS version. (2) Server responds with certificate (containing public key) and chosen cipher suite. (3) Client verifies certificate against trusted CAs. (4) Key exchange (e.g., ECDHE) generates a shared secret without transmitting it. (5) Both sides derive session keys. All subsequent data is encrypted. Modern TLS 1.3 does this in 1 round-trip (1-RTT).

> **Q: What are cookies, sessions, and JWT? How do they maintain state in HTTP?**  
> **A:** HTTP is stateless — each request is independent. State is maintained via: **Cookies** — small key-value pairs stored in the browser, sent with every request to the domain. Server sets them via `Set-Cookie` header. Used for session IDs. **Sessions** — server stores user state (in memory or DB) keyed by a session ID; the session ID is stored in a cookie. Stateful approach. **JWT (JSON Web Token)** — stateless token containing claims (user ID, roles, expiry), signed by the server's private key. Client stores the JWT (localStorage/cookie) and sends it in `Authorization: Bearer <token>` header. Server verifies the signature without DB lookup. JWTs are self-contained but can't be revoked without a blocklist.

---

## 5. DNS

### Concept
**DNS (Domain Name System)** is the internet's distributed directory — it translates human-readable domain names (google.com) into IP addresses (142.250.80.46). DNS is hierarchical and distributed for scalability and redundancy.

**DNS Record Types:**
| Record | Purpose |
|--------|---------|
| A | Domain → IPv4 address |
| AAAA | Domain → IPv6 address |
| CNAME | Alias → canonical name |
| MX | Mail server for domain |
| NS | Authoritative name server |
| TXT | Arbitrary text (SPF, DKIM, verification) |
| PTR | Reverse lookup: IP → domain |
| SOA | Start of Authority — zone metadata |

### 🎯 Interview Q&A

> **Q: How does DNS resolution work step by step?**  
> **A:** When you request `www.google.com`: (1) **Browser cache** — check local cache first. (2) **OS cache / hosts file** — check `/etc/hosts`. (3) **Recursive resolver** (your ISP's or 8.8.8.8) — receives the query; checks its own cache. (4) **Root nameserver** — resolver asks "Who handles .com?" Root returns the TLD nameserver. (5) **TLD nameserver** (.com) — "Who handles google.com?" Returns Google's authoritative nameserver. (6) **Authoritative nameserver** — has the actual A record for `www.google.com` → returns IP address. (7) Resolver caches the response (per TTL) and returns it to your browser. Total: milliseconds, mostly from cache.

> **Q: What is the difference between a CNAME and an A record?**  
> **A:** An **A record** maps a hostname directly to an IP address: `mail.example.com → 93.184.216.34`. A **CNAME (Canonical Name)** record maps a hostname to another hostname: `www.example.com → example.com`. CNAMEs allow multiple names to point to the same destination — when the IP changes, you only update one A record. Important restriction: a CNAME cannot coexist with other records for the same name (you can't have CNAME and MX for the same hostname). The apex domain (example.com itself) cannot be a CNAME — use ALIAS/ANAME records for that.

> **Q: What is DNS caching and TTL?**  
> **A:** Every DNS record has a **TTL (Time To Live)** — the number of seconds resolvers should cache the answer. Short TTL (60s) = changes propagate quickly but more DNS queries (more load on authoritative servers). Long TTL (86400s = 1 day) = fewer queries, better performance, but slow propagation when records change. During a migration, lower TTL before making the change so clients pick up the new IP faster. Recursive resolvers cache answers up to TTL; browsers also have their own DNS caches (often capped at 60s regardless of TTL).

---

## 6. IP Addressing & Subnetting

### Concept
**IPv4** uses 32-bit addresses written as four octets (e.g., `192.168.1.100`). **Subnetting** divides a network into smaller logical segments using a **subnet mask** or **CIDR notation**.

**Private IP Ranges (not routable on internet):**
- `10.0.0.0/8` — 10.x.x.x
- `172.16.0.0/12` — 172.16-31.x.x
- `192.168.0.0/16` — 192.168.x.x

**CIDR Quick Reference:**
| CIDR | Hosts | Subnet Mask |
|------|-------|-------------|
| /24 | 254 | 255.255.255.0 |
| /25 | 126 | 255.255.255.128 |
| /30 | 2 | 255.255.255.252 |
| /16 | 65,534 | 255.255.0.0 |

### 🎯 Interview Q&A

> **Q: What is NAT (Network Address Translation) and why is it used?**  
> **A:** **NAT** allows multiple devices with private IP addresses to share a single public IP address. The NAT device (router) maintains a translation table — it replaces the private source IP with the public IP when packets leave, and reverses the mapping when responses arrive. **Why**: IPv4 has only ~4.3 billion addresses, not enough for every device. NAT conserves addresses. Tradeoff: NAT breaks the end-to-end principle — external hosts can't initiate connections to internal devices (unless port forwarding is configured), making P2P and hosting services harder. IPv6 (128-bit addresses) was designed to eliminate the need for NAT.

> **Q: What is the difference between IPv4 and IPv6?**  
> **A:** **IPv4**: 32-bit addresses (~4.3 billion), written in dotted decimal (`192.168.1.1`), requires NAT for address conservation, optional header fields creating variable header length. **IPv6**: 128-bit addresses (~340 undecillion — practically unlimited), written in hexadecimal (`2001:0db8::1`), eliminates need for NAT, fixed 40-byte header (simpler/faster processing), built-in support for autoconfiguration (SLAAC), IPsec security built-in. Despite IPv4 exhaustion, full IPv6 adoption has been slow due to infrastructure upgrades required.

---

## 7. Routing & Switching

### Concept
**Switching** operates at Layer 2 using MAC addresses within a LAN. **Routing** operates at Layer 3 using IP addresses between networks.

### 🎯 Interview Q&A

> **Q: What is the difference between a hub, switch, and router?**  
> **A:** **Hub (L1)**: Dumb repeater — broadcasts every incoming frame out ALL ports. No intelligence, creates one collision domain. Obsolete. **Switch (L2)**: Learns MAC addresses and builds a MAC address table. Forwards frames only to the correct port (unicast). Each port is its own collision domain. Much more efficient than hubs. **Router (L3)**: Routes packets between different IP networks using routing tables. Connects LANs to WANs, connects subnets. Each router interface is in a different subnet. Routers make intelligent path decisions based on IP addresses and routing protocols (OSPF, BGP).

> **Q: What is the difference between static routing and dynamic routing?**  
> **A:** **Static routing**: Routes are manually configured by an administrator — never change unless manually updated. Predictable and secure but doesn't adapt to failures or topology changes. Good for small, stable networks. **Dynamic routing**: Routers exchange information using routing protocols and automatically compute best paths. **IGP (Interior Gateway Protocols)**: OSPF (link-state, scales well), EIGRP (Cisco). **EGP (Exterior)**: BGP — the protocol that runs the internet, used between autonomous systems (ISPs). Dynamic routing adapts to failures automatically but adds complexity and router CPU/memory overhead.

> **Q: What is a VLAN?**  
> **A:** A **VLAN (Virtual LAN)** logically divides a single physical switch into multiple isolated broadcast domains — even devices on the same physical switch can be in different networks. Benefits: (1) Security — finance and HR VLANs can't communicate without passing through a router (where policies can be applied); (2) Performance — reduces broadcast traffic; (3) Flexibility — move virtual networks without rewiring. VLANs are configured via **802.1Q tagging** — each frame carries a VLAN ID tag. Inter-VLAN communication requires a **Layer 3 switch** or router.

---

## 8. Network Devices

### 🎯 Interview Q&A

> **Q: What is the difference between a firewall, IDS, and IPS?**  
> **A:** **Firewall**: Filters traffic based on rules (IP, port, protocol). Stateful firewalls track connection state. Operates at L3-L4. Blocks unauthorised traffic. **IDS (Intrusion Detection System)**: Monitors traffic and alerts on suspicious patterns — passive, doesn't block traffic. Like a security camera. **IPS (Intrusion Prevention System)**: Like IDS but actively blocks detected threats inline. Modern firewalls (NGFW — Next-Generation Firewalls) integrate all three plus deep packet inspection, application awareness, and threat intelligence.

> **Q: What is a proxy server and what are its uses?**  
> **A:** A **proxy** sits between clients and servers, forwarding requests on behalf of clients. **Forward proxy**: Client uses it to reach the internet — hides client's identity, enables content filtering, caching. **Reverse proxy** (e.g., Nginx): Sits in front of servers — clients talk to proxy, proxy routes to backend servers. Enables load balancing, SSL termination (offloads TLS from app servers), caching, and hides server topology. **Transparent proxy**: Intercepts traffic without client configuration — used by ISPs for caching.

---

## 9. Sockets & Ports

### Concept
A **socket** is a communication endpoint defined by (IP address, port, protocol). **Ports** identify specific applications/services on a host.

- **Well-known ports**: 0–1023 (require root on Linux)
- **Registered ports**: 1024–49151
- **Dynamic/ephemeral ports**: 49152–65535 (used by clients for outgoing connections)

### 🎯 Interview Q&A

> **Q: What is a socket? How does a client-server connection work?**  
> **A:** A socket is a software endpoint for sending/receiving data, identified by (IP:Port). Server side: `socket()` → `bind(IP, port)` → `listen()` → `accept()` (blocks waiting for client). Client side: `socket()` → `connect(server_IP, port)` — this triggers TCP 3-way handshake. After connection: both sides can `send()`/`recv()` data. Finally `close()` triggers 4-way FIN. In Python: `socket.socket(AF_INET, SOCK_STREAM)` for TCP; `SOCK_DGRAM` for UDP.

> **Q: What is the difference between a port and a socket?**  
> **A:** A **port** is a 16-bit number that identifies a specific process/service on a host (e.g., port 80 = HTTP). A **socket** is the complete communication endpoint: `(protocol, local_IP, local_port, remote_IP, remote_port)` — a 5-tuple. Multiple connections can share the same server port (e.g., thousands of clients connecting to port 80) because each connection has a unique socket (different client IP:port). The OS demultiplexes incoming packets to the correct socket using the full 5-tuple.

---

## 10. Security — Firewalls, SSL/TLS, VPN

### 🎯 Interview Q&A

> **Q: How does SSL/TLS ensure secure communication?**  
> **A:** TLS provides three guarantees: (1) **Authentication** — the server's certificate (signed by a trusted CA) proves its identity, preventing impersonation; (2) **Confidentiality** — **asymmetric encryption** (e.g., RSA/ECDHE) is used during handshake to exchange a symmetric key; then all data is encrypted with fast **symmetric encryption** (AES); (3) **Integrity** — **MAC (Message Authentication Code)** ensures data hasn't been tampered in transit. The certificate chain works: browser trusts root CAs → root CA signs intermediate CA → intermediate CA signs your server cert. If any link in the chain is invalid/expired, browser shows a warning.

> **Q: What is a VPN and how does it work?**  
> **A:** A **VPN (Virtual Private Network)** creates an encrypted tunnel over the public internet between a client and a VPN server. All traffic is routed through the VPN server — the destination sees the VPN server's IP, not the client's. Protocols: **OpenVPN** (SSL/TLS based), **IPSec** (network-layer), **WireGuard** (modern, fast, simple). Use cases: (1) Secure remote access to corporate networks; (2) Privacy — hide IP from websites/ISPs; (3) Bypass geographic restrictions. Split tunneling allows only some traffic to go through the VPN.

> **Q: What is a SQL injection attack and how do you prevent it?**  
> **A:** SQL injection exploits applications that construct SQL queries with unvalidated user input. If a login query is `"SELECT * FROM users WHERE name='" + username + "'"`, an attacker inputs `admin' --` to get `SELECT * FROM users WHERE name='admin' --'` — the `--` comments out the password check. Prevention: (1) **Parameterised queries/prepared statements** — the database treats user input as data, never as SQL code; (2) **ORM** — abstracts SQL generation; (3) **Input validation** — sanitise inputs; (4) **Least privilege** — DB user only has necessary permissions; (5) **WAF** — Web Application Firewall as additional layer.

---

## 11. CDN, Load Balancing, Proxies

### 🎯 Interview Q&A

> **Q: What is a CDN and how does it work?**  
> **A:** A **CDN (Content Delivery Network)** is a geographically distributed network of servers (PoPs — Points of Presence) that cache content close to users. How it works: (1) User requests `img.example.com/photo.jpg`; (2) DNS resolves to the nearest CDN edge server (using anycast or geo-based DNS); (3) If edge has the content cached, serves directly (cache hit — very fast); (4) If not (cache miss), fetches from origin server, caches it, serves to user. Benefits: Reduced latency (closer servers), reduced origin load, DDoS protection, high availability. Used for static assets (images, CSS, JS), videos, and increasingly dynamic content.

> **Q: What are the different load balancing algorithms?**  
> **A:** **(1) Round Robin**: Distributes requests sequentially to each server — simple, assumes equal capacity. **(2) Weighted Round Robin**: Servers get proportional requests based on weight — for heterogeneous hardware. **(3) Least Connections**: Routes to server with fewest active connections — better for variable request duration. **(4) IP Hash**: Hashes client IP to always route to same server — session persistence (sticky sessions). **(5) Random**: Random server selection — surprisingly effective with enough servers. **(6) Least Response Time**: Routes to fastest responding server. Health checks monitor backend availability.

> **Q: What is the difference between L4 and L7 load balancing?**  
> **A:** **L4 (Transport)** load balancing routes based on IP/TCP information — fast, low overhead, can't inspect content. Just forwards TCP connections to backends. **L7 (Application)** load balancing reads HTTP headers, cookies, URL paths — routes based on content. Enables: routing `/api` to API servers, `/images` to static servers; session stickiness via cookies; SSL termination; A/B testing; canary deployments. L7 is more powerful but has higher overhead. Nginx, HAProxy, and AWS ALB are L7; AWS NLB is L4.

---

## 12. WebSockets & REST vs GraphQL

### 🎯 Interview Q&A

> **Q: What is the difference between HTTP and WebSockets?**  
> **A:** **HTTP** is request-response — the client initiates every interaction, server can only respond. Half-duplex. A new connection (or keep-alive connection) is used per request cycle. **WebSockets** provide a **full-duplex, persistent** connection — after the initial HTTP upgrade handshake, either side can send data at any time. Server can push data to clients without a request. Use cases: real-time chat, live notifications, stock tickers, collaborative editing, gaming. WebSocket connections start as HTTP and upgrade via `Connection: Upgrade` and `Upgrade: websocket` headers.

> **Q: What is the difference between REST and GraphQL?**  
> **A:** **REST**: Multiple endpoints (`/users`, `/users/:id/posts`), server decides what data each endpoint returns, can over-fetch (get data you don't need) or under-fetch (need multiple requests). Simple, cacheable (HTTP caching), widely understood. **GraphQL**: Single endpoint, client specifies exactly what data it needs in a query, gets exactly that — no over/under-fetching. Strong type system, introspectable schema, single round-trip for complex nested data. Tradeoffs: GraphQL is harder to cache, more complex server implementation, potential for expensive queries. REST is better for simple CRUD; GraphQL shines for complex, interconnected data with varied client needs.

---

---

# 🗄️ DATABASE MANAGEMENT SYSTEMS

---

## 13. DBMS Fundamentals

### Concept
A **DBMS (Database Management System)** is software that manages databases — providing data storage, retrieval, modification, and administration while ensuring **data integrity**, **security**, **concurrency**, and **ACID** properties.

**Types of DBMS:**
- **Relational (RDBMS)**: MySQL, PostgreSQL, Oracle, SQL Server — tables with relationships
- **Document**: MongoDB, Firestore — JSON-like documents
- **Key-Value**: Redis, DynamoDB — simple key-value pairs
- **Column-Family**: Cassandra, HBase — wide-column store
- **Graph**: Neo4j — nodes and edges
- **Time-Series**: InfluxDB, TimescaleDB

### 🎯 Interview Q&A

> **Q: What is the difference between a DBMS and an RDBMS?**  
> **A:** A **DBMS** is any software that manages databases — could be hierarchical, network, object-oriented, or relational. An **RDBMS** is specifically a DBMS that organises data in **tables (relations)** with rows and columns, enforces relationships via **keys**, and uses **SQL** as the query language. RDBMS strictly follows **ACID** properties. All RDBMS are DBMS, but not all DBMS are RDBMS. MongoDB is a DBMS (document-oriented) but not an RDBMS.

> **Q: What are the advantages of a DBMS over a file system?**  
> **A:** File systems require every application to manage its own data format, leading to: **data redundancy** (same data in multiple files), **inconsistency** (copies diverge), no concurrent access control, no standard query language, no transactions, security managed at OS level only. DBMS solves all of these: centralised data management, **ACID transactions** for consistency, **concurrent access** with locking/MVCC, powerful querying with SQL, **data independence** (physical storage changes don't affect applications), integrated **backup/recovery**, and **role-based access control**.

---

## 14. Relational Model & Keys

### Concept
The **relational model** represents data as **tables (relations)** of rows (tuples) and columns (attributes). Relationships between tables are expressed through **keys**.

| Key Type | Definition |
|----------|-----------|
| **Super Key** | Any set of attributes that uniquely identifies a row |
| **Candidate Key** | Minimal super key (no subset is also a super key) |
| **Primary Key** | Chosen candidate key — unique, NOT NULL |
| **Foreign Key** | References primary key of another table |
| **Composite Key** | Primary key made of multiple columns |
| **Surrogate Key** | System-generated key (e.g., AUTO_INCREMENT) |
| **Natural Key** | Key from real-world data (e.g., email, SSN) |
| **Unique Key** | Unique but can be NULL (unlike PK) |

### 🎯 Interview Q&A

> **Q: What is the difference between a primary key and a unique key?**  
> **A:** Both enforce uniqueness, but: **Primary Key** — cannot be NULL, only one per table, creates a clustered index in most RDBMS, uniquely identifies each row. **Unique Key** — can contain NULL values (one NULL in some databases, multiple in others), a table can have multiple unique keys, creates a non-clustered index. A primary key IS a unique constraint plus a NOT NULL constraint. Use unique keys for email/username fields where you want uniqueness but the field might not be the primary identifier.

> **Q: What is referential integrity and what are the ON DELETE options?**  
> **A:** **Referential integrity** ensures that a foreign key value always refers to an existing primary key — you can't have an order for a customer that doesn't exist. **ON DELETE options**: **CASCADE** — automatically delete child rows when parent is deleted (e.g., deleting a user deletes all their posts); **SET NULL** — set FK to NULL when parent deleted; **RESTRICT/NO ACTION** — prevent deletion if child rows exist (most conservative, default in MySQL); **SET DEFAULT** — set FK to a default value. Choose based on business logic — CASCADE is convenient but dangerous for sensitive data.

> **Q: What is a composite key and when would you use one?**  
> **A:** A **composite key** is a primary key made of two or more columns — the combination is unique, but individual columns may repeat. Example: `order_items` table with `(order_id, product_id)` as composite PK — the same order can have many products, and the same product can be in many orders, but a specific (order_id, product_id) pair is unique. Use when no single attribute is unique on its own but a combination is. Important for junction/bridge tables in many-to-many relationships.

---

## 15. SQL — DDL, DML, DCL

### Concept
SQL commands are categorised into:
- **DDL** (Data Definition Language): `CREATE`, `ALTER`, `DROP`, `TRUNCATE` — define structure
- **DML** (Data Manipulation Language): `SELECT`, `INSERT`, `UPDATE`, `DELETE` — manipulate data
- **DCL** (Data Control Language): `GRANT`, `REVOKE` — control access
- **TCL** (Transaction Control Language): `COMMIT`, `ROLLBACK`, `SAVEPOINT`

### 🎯 Interview Q&A

> **Q: What is the difference between DELETE, TRUNCATE, and DROP?**  
> **A:** **DELETE**: DML — removes rows based on WHERE condition (or all rows without WHERE); generates undo logs for each row; fires triggers; can be rolled back; slow for large tables. **TRUNCATE**: DDL — removes ALL rows; deallocates data pages; does NOT fire row-level triggers; cannot be rolled back in most databases (auto-commits); resets AUTO_INCREMENT; much faster than DELETE for clearing a table. **DROP**: DDL — removes the entire table including its structure, indexes, constraints, and data; cannot be rolled back; completely destroys the table. Rule of thumb: DELETE for conditional removal with rollback; TRUNCATE to quickly empty a table; DROP to permanently remove a table.

> **Q: What is the execution order of a SQL SELECT statement?**  
> **A:** SQL processes clauses in this logical order (different from writing order): (1) **FROM** + **JOIN** — identify source tables; (2) **WHERE** — filter rows before grouping; (3) **GROUP BY** — group remaining rows; (4) **HAVING** — filter groups based on aggregates; (5) **SELECT** — compute expressions and aliases; (6) **DISTINCT** — remove duplicates; (7) **ORDER BY** — sort results; (8) **LIMIT/OFFSET** — restrict final output. This is why you can't use a SELECT alias in WHERE (WHERE runs before SELECT), but you can use it in ORDER BY.

> **Q: What is the difference between WHERE and HAVING?**  
> **A:** **WHERE** filters individual rows **before** grouping — it cannot use aggregate functions (no `WHERE COUNT(*) > 5`). **HAVING** filters **after** GROUP BY — it operates on groups and CAN use aggregate functions (`HAVING COUNT(*) > 5`). Performance: WHERE is always more efficient because it reduces rows before grouping. Only use HAVING when the filter depends on an aggregate value. Example: "Find departments with more than 5 employees earning above $50k" — `WHERE salary > 50000 GROUP BY dept_id HAVING COUNT(*) > 5`.

---

## 16. Joins

### Concept
Joins combine rows from multiple tables based on related columns.

| Join Type | Returns |
|-----------|---------|
| INNER JOIN | Only matching rows from both tables |
| LEFT JOIN | All from left + matching from right (NULL if no match) |
| RIGHT JOIN | All from right + matching from left (NULL if no match) |
| FULL OUTER JOIN | All rows from both, NULL where no match |
| CROSS JOIN | Cartesian product of both tables |
| SELF JOIN | Table joined with itself |

### 🎯 Interview Q&A

> **Q: What is the difference between INNER JOIN and LEFT JOIN?**  
> **A:** **INNER JOIN** returns only rows where there is a **match in BOTH tables** — unmatched rows from either table are excluded. If an employee has no department (NULL dept_id or dept doesn't exist), they won't appear. **LEFT JOIN** returns **ALL rows from the left table** plus matching rows from the right — if no match exists in the right table, right-side columns show NULL. Use LEFT JOIN when you need to see all records from one table regardless of whether related data exists in another (e.g., all customers including those with no orders).

> **Q: How would you find records in Table A that don't exist in Table B?**  
> **A:** Two approaches: (1) **LEFT JOIN + IS NULL** (anti-join): `SELECT a.* FROM A LEFT JOIN B ON a.id = b.a_id WHERE b.a_id IS NULL` — all A rows, keep only where B had no match. (2) **NOT EXISTS**: `SELECT * FROM A WHERE NOT EXISTS (SELECT 1 FROM B WHERE B.a_id = A.id)`. Both are correct. NOT EXISTS can be faster when B is large (short-circuits). LEFT JOIN + IS NULL is often more readable. Avoid `NOT IN` if B can contain NULLs — `NOT IN` with any NULL in the subquery returns no rows (NULL trap).

---

## 17. Normalization

### Concept
**Normalization** organises a database to reduce **data redundancy** and improve **data integrity** through a series of **Normal Forms (NF)**.

| Normal Form | Rule |
|-------------|------|
| **1NF** | Atomic values, no repeating groups, each row unique |
| **2NF** | 1NF + no partial dependencies (non-key attrs depend on whole PK) |
| **3NF** | 2NF + no transitive dependencies (non-key attrs depend only on PK) |
| **BCNF** | 3NF + every determinant is a candidate key |
| **4NF** | BCNF + no multi-valued dependencies |

### 🎯 Interview Q&A

> **Q: Explain the first three normal forms with examples.**  
> **A:** **1NF**: Each cell must contain one atomic value; no repeating columns. Violation: `phones = "555-1234, 555-5678"` in one cell. Fix: separate rows or a phone table. **2NF**: No partial dependency — in a composite key (student_id, course_id), every non-key attribute must depend on BOTH columns, not just one. Violation: `student_name` depending only on `student_id` in a `(student_id, course_id)` table. Fix: move `student_name` to a Students table. **3NF**: No transitive dependency — non-key attribute should not depend on another non-key attribute. Violation: `emp_id → dept_id → dept_location`. Fix: `dept_location` should be in a Departments table, not Employees.

> **Q: What is denormalization and when would you use it?**  
> **A:** **Denormalization** intentionally introduces redundancy by merging tables or adding redundant columns — the opposite of normalization. When to use: (1) **Read-heavy workloads** where JOIN overhead is too costly; (2) **Reporting/analytics** where pre-aggregated data speeds up queries significantly; (3) **Data warehouses** (star schema, snowflake schema) which are intentionally denormalized for query performance. Tradeoffs: faster reads, slower writes (must update redundant data), risk of inconsistency, higher storage. Modern approach: normalise the OLTP (transactional) database, denormalise the OLAP (analytics) replica.

---

## 18. Transactions & ACID

### Concept
A **transaction** is a logical unit of work that must be executed **atomically**. ACID properties guarantee transaction correctness even in the presence of errors and concurrent access.

**ACID:**
- **A**tomicity — all or nothing (no partial execution)
- **C**onsistency — DB moves from one valid state to another valid state
- **I**solation — concurrent transactions don't interfere with each other
- **D**urability — committed data persists even after system failure

### 🎯 Interview Q&A

> **Q: Explain ACID properties with a bank transfer example.**  
> **A:** Transferring $500 from Account A to Account B: **Atomicity** — both debit and credit happen, or neither does. If the system crashes after debiting A but before crediting B, the transaction rolls back — A is not debited. **Consistency** — total money in the system before and after transfer must be the same; balance constraints (no negative balance) are enforced. **Isolation** — if two transfers happen simultaneously on Account A, one must wait for the other — they don't see each other's intermediate states. **Durability** — once the transaction commits and you see "Transfer successful," the data is saved to disk — a crash won't undo it. Implemented via **write-ahead logging (WAL)**.

> **Q: What are the four transaction isolation levels and their anomalies?**  
> **A:** From lowest to highest isolation: **(1) READ UNCOMMITTED**: Can read uncommitted data from other transactions — **dirty reads** possible. Fastest but least safe. **(2) READ COMMITTED**: Only reads committed data — no dirty reads. But **non-repeatable reads** possible (same query returns different results if another transaction commits between your two reads). **(3) REPEATABLE READ**: Rows you've read are locked — no non-repeatable reads. But **phantom reads** possible (new rows inserted by others appear if you re-run a range query). Default in MySQL InnoDB. **(4) SERIALIZABLE**: Full isolation — transactions execute as if serial. No anomalies but lowest concurrency. Higher isolation = more locking = less concurrency = lower throughput.

---

## 19. Concurrency Control & Locks

### Concept
When multiple transactions access data simultaneously, a **concurrency control mechanism** ensures correctness.

**Lock Types:**
- **Shared (S) lock**: Multiple transactions can read — compatible with other S locks
- **Exclusive (X) lock**: One transaction writes — incompatible with all other locks
- **Intent locks**: Signal intention to lock at a lower level

**Concurrency Problems:**
| Problem | Description |
|---------|-------------|
| Dirty Read | Reading uncommitted data that might be rolled back |
| Non-repeatable Read | Same query returns different data within same transaction |
| Phantom Read | New rows appear in repeated range queries |
| Lost Update | Two transactions overwrite each other's changes |

### 🎯 Interview Q&A

> **Q: What is a deadlock? How is it detected and prevented?**  
> **A:** A **deadlock** occurs when two or more transactions each hold a lock and wait for a lock held by the other — circular wait, no one can proceed. Example: T1 locks A, T2 locks B, T1 waits for B, T2 waits for A. **Detection**: DBMS maintains a wait-for graph; a cycle = deadlock. The DBMS selects a victim transaction (usually the one with least work done) and rolls it back. **Prevention**: (1) Lock ordering — always acquire locks in the same order; (2) Lock timeout — if a transaction waits too long, roll it back; (3) Pessimistic locking — acquire all locks upfront; (4) Optimistic concurrency — no locks during execution, validate at commit time (used in MVCC).

> **Q: What is MVCC (Multi-Version Concurrency Control)?**  
> **A:** **MVCC** is a concurrency control technique where instead of locking rows for reads, the database maintains multiple **versions** of each row. Readers see a consistent snapshot of the database at the transaction's start time, while writers create new versions. **Benefits**: Readers never block writers, writers never block readers — much better concurrency than traditional locking. **How**: Each row has hidden columns (transaction_id, created_at, deleted_at). A transaction only sees rows whose version was committed before the transaction started. Used by PostgreSQL, MySQL InnoDB, Oracle. This is how READ COMMITTED and REPEATABLE READ isolation are implemented efficiently.

---

## 20. Indexing & B-Trees

### Concept
An **index** is a data structure that speeds up data retrieval at the cost of additional storage and write overhead. Most RDBMS use **B-Trees** (balanced trees) for indexes.

**Index Types:**
- **Clustered Index**: Data rows are physically stored in index order — one per table (primary key in InnoDB)
- **Non-clustered (Secondary) Index**: Separate structure with pointers to actual rows — multiple allowed
- **Covering Index**: Index contains all columns needed to satisfy a query
- **Composite Index**: Index on multiple columns — leftmost prefix rule applies
- **Full-Text Index**: For text search
- **Hash Index**: O(1) exact lookup, no range queries

### 🎯 Interview Q&A

> **Q: How does a B-Tree index work?**  
> **A:** A **B-Tree** (Balanced Tree) is a self-balancing tree where: each node can hold multiple keys, all leaf nodes are at the same depth, and keys in each node are sorted. A lookup traverses from root to leaf in O(log n) — at each level, compare the search key to node keys to go left/right/stay. **B+ Tree** (what most RDBMS actually use): all data is in leaf nodes, internal nodes only hold keys for navigation, leaf nodes are linked in a doubly-linked list for efficient range scans. Range queries (BETWEEN, >, <) are efficient because you find the start and follow the linked list. Height of a B+ Tree for millions of rows is only 3-4 levels — extremely fast.

> **Q: What is the difference between a clustered and non-clustered index?**  
> **A:** **Clustered index**: The table's data rows are physically sorted and stored by the clustered key. There can be only ONE clustered index per table (you can only physically sort data one way). In InnoDB, the primary key IS the clustered index — the table IS the B+ Tree. Row lookups by PK are very fast. **Non-clustered (secondary) index**: A separate B+ Tree structure where leaf nodes contain the indexed key value + the primary key (not the actual row data). Looking up by a secondary index requires TWO steps: (1) find the PK in the secondary index, (2) use the PK to look up the actual row in the clustered index ("bookmark lookup"). A covering index avoids step 2 by including all needed columns in the secondary index itself.

> **Q: What is the leftmost prefix rule for composite indexes?**  
> **A:** For a composite index `(a, b, c)`, the index can be used for queries filtering on `a` alone, `a + b`, or `a + b + c`. It **cannot** be used for `b` alone, `c` alone, or `b + c` (skipping `a`). This is because the B-Tree is sorted first by `a`, then by `b` within each `a` value, then by `c`. Without knowing `a`, you can't efficiently traverse the sorted structure. Column order matters: put the most selective column first, then equality-filter columns before range-filter columns.

---

## 21. Query Optimization

### 🎯 Interview Q&A

> **Q: How does a query optimizer work?**  
> **A:** The **query optimizer** transforms a SQL query into an efficient execution plan. Steps: (1) **Parse** — validate syntax and semantics; (2) **Rewrite** — transform query (e.g., subquery to join, push predicates down); (3) **Plan generation** — generate multiple possible execution plans (different join orders, index choices); (4) **Cost estimation** — estimate cost of each plan using statistics (table sizes, column cardinality, histogram distributions); (5) **Plan selection** — choose the cheapest plan. Use `EXPLAIN` to see the chosen plan. The optimizer can be wrong when statistics are stale — run `ANALYZE TABLE` to update them.

> **Q: What are common query optimization techniques?**  
> **A:** (1) **Proper indexes** — on WHERE, JOIN, ORDER BY columns; (2) **Avoid functions on indexed columns** in WHERE (`WHERE YEAR(date) = 2024` prevents index use; use range instead); (3) **Avoid leading wildcards** in LIKE (`LIKE '%smith'` can't use index; `LIKE 'smith%'` can); (4) **SELECT specific columns** — avoid `SELECT *`; enables covering indexes; (5) **Use LIMIT** — stop early when you only need N rows; (6) **Join order matters** — filter early with WHERE to reduce rows before joining; (7) **Avoid correlated subqueries** in SELECT/WHERE — they re-execute per row; (8) **Partition pruning** — partition large tables so queries scan only relevant partitions.

---

## 22. NoSQL vs SQL

### Concept
**SQL databases** are relational, schema-enforced, ACID-compliant, scale vertically. **NoSQL databases** are non-relational, schema-flexible, trade some ACID for scalability and performance.

| Feature | SQL (RDBMS) | NoSQL |
|---------|-------------|-------|
| Schema | Fixed, enforced | Flexible, dynamic |
| Scaling | Vertical (bigger machine) | Horizontal (more machines) |
| Consistency | Strong (ACID) | Eventual (BASE) |
| Query Language | SQL (standard) | API/query language varies |
| Joins | Powerful | Limited or none |
| Transactions | Full ACID | Limited (varies) |
| Best For | Complex relationships, reporting | High volume, flexible schema |

### 🎯 Interview Q&A

> **Q: When would you choose NoSQL over SQL?**  
> **A:** Choose **NoSQL** when: (1) **Massive scale** — need to shard horizontally across thousands of nodes (Cassandra handles petabytes); (2) **Flexible/evolving schema** — documents vary significantly, schema changes frequently (e.g., user profiles with varied fields); (3) **High write throughput** — key-value stores like Redis for caching, DynamoDB for millions of writes/sec; (4) **Specific data models** — graph relationships (Neo4j), time-series (InfluxDB), full-text search (Elasticsearch). Choose **SQL** when: strong consistency required, complex queries with multiple joins, reporting/analytics, financial data where ACID is non-negotiable, team knows SQL well.

> **Q: What is BASE and how does it differ from ACID?**  
> **A:** **BASE** is the NoSQL philosophy: **B**asically **A**vailable (system is available most of the time), **S**oft state (state can change over time without input due to eventual consistency), **E**ventually consistent (system will eventually become consistent, not immediately). Example: DynamoDB — after a write, different nodes may return different values briefly, but eventually all nodes converge. **ACID** guarantees immediate consistency and durability. Trade-off: ACID provides stronger guarantees at the cost of availability and performance under network partitions; BASE accepts temporary inconsistency for higher availability and performance.

---

## 23. CAP Theorem

### Concept
The **CAP Theorem** (Brewer's Theorem) states that a distributed system can guarantee at most **2 of 3** properties:
- **C**onsistency — every read receives the most recent write or an error
- **A**vailability — every request receives a (non-error) response (may not be most recent data)
- **P**artition tolerance — system continues operating despite network partitions

Since network partitions are inevitable in distributed systems, the real choice is **CP vs AP**.

| System | Type | Trade-off |
|--------|------|-----------|
| HBase, Zookeeper | CP | Consistent, may be unavailable during partitions |
| Cassandra, CouchDB | AP | Always available, eventually consistent |
| Traditional RDBMS (single node) | CA | No partition tolerance |

### 🎯 Interview Q&A

> **Q: Explain the CAP theorem and give examples.**  
> **A:** In a distributed system with a network partition (nodes can't communicate), you must choose: **CP systems** sacrifice availability — during a partition, the system returns an error rather than possibly stale data. HBase, MongoDB (with strict settings) are CP. **AP systems** sacrifice consistency — during a partition, nodes respond with potentially outdated data. Cassandra, DynamoDB (default), CouchDB are AP. The theorem is often misunderstood — it applies only during a partition. Outside partitions, you can have all three. Modern systems like Google Spanner aim for CP with high availability in practice through global clock synchronisation.

> **Q: What is eventual consistency? Give an example.**  
> **A:** **Eventual consistency** means that if no new updates are made, eventually all replicas will converge to the same value — but temporarily, different nodes may return different values. Example: You post a photo on Instagram. Your write goes to the primary US data centre. A friend in Europe reads from the EU replica before it syncs — they don't see your photo yet. After a few seconds, replication propagates and everyone sees it. This is acceptable for social media. It's NOT acceptable for bank balances. Dynamo's eventual consistency: writes go to N nodes, you only need W acknowledgements to confirm write, R to confirm read. For consistency: R + W > N.

---

## 24. Stored Procedures, Triggers, Views

### 🎯 Interview Q&A

> **Q: What are the advantages and disadvantages of stored procedures?**  
> **A:** **Advantages**: (1) **Performance** — pre-compiled and cached execution plan; (2) **Reduced network traffic** — one call instead of many SQL statements; (3) **Security** — users can EXECUTE a procedure without direct table access; (4) **Code reuse** — business logic in one place; (5) **Encapsulation** — hide table structure from application. **Disadvantages**: (1) **Portability** — SQL dialect varies between databases; (2) **Difficult to version control** and debug; (3) **Testing is harder** than application code; (4) **Tight coupling** between database and application logic; (5) **Expertise** — DBAs needed for complex procedures. Modern trend: keep business logic in application code, use ORM; use stored procedures only for performance-critical batch operations.

> **Q: What are triggers and when should you use them?**  
> **A:** A **trigger** is a stored procedure that automatically executes when a specified event (INSERT/UPDATE/DELETE) occurs on a table — BEFORE or AFTER. Use cases: **audit logging** (auto-insert into audit table on every change), **enforcing complex constraints** (cross-table validation), **auto-updating denormalised columns**, **cascading business logic**. When NOT to use: complex business logic (hard to debug, invisible to application developers), performance-critical paths (triggers add overhead), when application-level alternatives are feasible. The main danger: "invisible side effects" — a simple UPDATE suddenly does 5 other things, making debugging very difficult.

> **Q: What is the difference between a view and a materialised view?**  
> **A:** A **view** is a stored query — a virtual table with no data stored. Every time you query the view, the underlying query executes. Zero storage overhead but no performance benefit for complex queries. **Materialised view** (PostgreSQL, Oracle; called "indexed view" in SQL Server) physically stores the query result as a table snapshot. Reads are instant. But data must be refreshed (on schedule or on change) — may show stale data. Great for dashboards, reports, or aggregations queried frequently on rarely-changing data. MySQL doesn't support materialised views natively — workaround: maintain summary tables via triggers or scheduled events.
---

# ⚙️ OPERATING SYSTEMS

---

## 25. OS Fundamentals & Process vs Thread

### Concept
An **Operating System** manages hardware resources and provides services to user programs. It acts as the intermediary between hardware and applications — handling processes, memory, file systems, I/O, and security.

**Process vs Thread — Full Comparison:**
| Feature | Process | Thread |
|---------|---------|--------|
| Definition | Program in execution | Lightweight unit inside a process |
| Memory | Own isolated address space | Shares heap/globals with process |
| Stack | Own stack | Own stack; shares heap |
| Creation cost | High (`fork()` copies everything) | Low (allocate stack only) |
| Context switch | Expensive (TLB flush, full state) | Cheaper (less state to save) |
| Communication | IPC: pipes, sockets, shared mem | Direct shared variables (needs sync) |
| Fault isolation | Crash doesn't affect others | One crash kills whole process |
| Python | `multiprocessing.Process` | `threading.Thread` |
| Bypasses Python GIL? | ✅ Yes | ❌ No (CPython GIL) |

### 🎯 Interview Q&A

> **Q: What is a process? What does a PCB contain?**  
> **A:** A **process** is a program in execution — it includes the executable code, current state, and allocated resources. The OS represents each process with a **PCB (Process Control Block)** which stores: **PID** (process identifier), **process state** (new / ready / running / waiting / terminated), **program counter** (address of next instruction), **CPU registers** (all register values, saved/restored on context switch), **memory management info** (page tables, base/limit registers), **open file descriptors**, **CPU scheduling info** (priority, burst time), and **accounting info** (CPU time used, start time). The PCB is what the OS saves and restores during every context switch.

> **Q: What is the difference between a process and a thread?**  
> **A:** A **process** has its own isolated memory space — processes can't directly read each other's memory (security and stability). Communication requires IPC mechanisms. A **thread** lives inside a process and shares the same heap, code, and global variables with all other threads in that process — fast to create and communicate, but one thread's bug can corrupt shared data and crash the entire process. In Python specifically: threads share the GIL so only one thread runs Python bytecode at a time (fine for I/O-bound, useless for CPU-bound parallelism); `multiprocessing` creates real OS processes with separate GILs, enabling true CPU parallelism.

> **Q: What is a zombie process and an orphan process?**  
> **A:** A **zombie process** has finished executing but still has a PCB entry because its parent hasn't called `wait()` to read the exit status. It holds no memory or CPU — just a PID slot. Accumulating zombies can exhaust PID space. Fix: parent must call `wait()`/`waitpid()`, or use `signal(SIGCHLD, SIG_IGN)` to auto-reap. An **orphan process** is a still-running child whose parent terminated. The orphan is adopted by **init/systemd (PID 1)**, which periodically calls `wait()` — orphans never become zombies.

> **Q: What is a context switch and what overhead does it involve?**  
> **A:** A **context switch** is when the CPU switches from executing one process/thread to another. Steps: save current CPU registers + PC + stack pointer into PCB → update PCB state to "ready" → run scheduler → load new process's PCB state into CPU. **Overhead**: (1) Direct: saving/restoring 10s of registers (~1–10 µs); (2) Indirect: CPU caches and TLB (Translation Lookaside Buffer) are invalidated — the new process causes cache/TLB misses until its working set is warm again. Thread context switches are cheaper since they share the address space (no TLB flush). Excessive context switching causes **thrashing** of CPU caches.

---

## 26. Process Scheduling

### Concept
The **CPU scheduler** decides which ready process runs next. Goals: maximise CPU utilisation and throughput; minimise waiting time, turnaround time, and response time.

**Key Metrics:**
- **Arrival Time (AT)** — when process enters ready queue
- **Burst Time (BT)** — CPU time needed
- **Completion Time (CT)** — when process finishes
- **Turnaround Time (TAT)** = CT − AT
- **Waiting Time (WT)** = TAT − BT
- **Response Time** = time of first CPU allocation − AT

**Process States:**
```
New ──→ Ready ──→ Running ──→ Terminated
              ←──        ←──
                   ↓       ↑
                 Waiting ───
                (I/O, sleep)
```

### 🎯 Interview Q&A

> **Q: Compare FCFS, SJF, Round Robin, and Priority scheduling.**  
> **A:** **FCFS (First Come First Served)**: Non-preemptive, simple FIFO queue. Problem: **convoy effect** — a long process blocks all short ones behind it. **SJF (Shortest Job First)**: Non-preemptive, always runs the shortest burst next — provably minimises average waiting time. Problem: requires knowing burst time in advance (estimated via exponential averaging in practice); can cause **starvation** of long processes. **SRTF (Shortest Remaining Time First)**: Preemptive SJF — optimal but same starvation problem. **Round Robin**: Each process gets a fixed quantum (10–100ms) in circular order — fair, no starvation, good interactive response. Large quantum → FCFS; tiny quantum → too many context switches. **Priority Scheduling**: Each process has a priority; CPU goes to highest priority. Risk: starvation of low-priority processes. Solution: **aging** (gradually raise priority of waiting processes).

> **Q: What is the convoy effect and how does Round Robin solve it?**  
> **A:** The **convoy effect** in FCFS occurs when a CPU-bound long process arrives first — all short processes queue behind it, inflating their wait times. The CPU and I/O devices are also poorly utilised in turns. **Round Robin** eliminates this by preempting every process after its quantum — no process can monopolise the CPU. Short processes finish in a few quanta without waiting for the long process to complete. Tradeoff: context-switch overhead. Ideal quantum ≈ 80% of CPU bursts should be shorter than the quantum (so most processes finish in one quantum but can be preempted if they're long).

---

## 27. Synchronization — Mutex, Semaphore, Deadlock

### Concept
When threads/processes share resources, **synchronization** prevents **race conditions** (non-deterministic behaviour from concurrent access to shared state).

**Critical Section Requirements (Peterson's conditions):**
1. **Mutual Exclusion** — only one process in critical section at a time
2. **Progress** — if no process is in CS, one waiting process gets in
3. **Bounded Waiting** — a process won't wait forever

### 🎯 Interview Q&A

> **Q: What is a mutex? What is a semaphore? What is the difference?**  
> **A:** A **mutex (mutual exclusion lock)** is a binary lock with **ownership** — only the thread that acquired it can release it. Used to protect a critical section. If locked, other threads block until the owner unlocks. A **semaphore** is a counter-based signalling mechanism with no ownership — any thread can call `signal()`. **Binary semaphore** (value 0/1) behaves like a mutex but without ownership. **Counting semaphore** controls access to a pool of N resources (e.g., 10 DB connections): `wait()/P()` decrements (blocks at 0); `signal()/V()` increments (wakes a waiter). Key difference: mutex is for mutual exclusion with owner accountability; semaphore is for signalling and resource counting. In Python: `threading.Lock()` = mutex; `threading.Semaphore(n)` = counting semaphore.

> **Q: What are the four Coffman conditions for deadlock?**  
> **A:** All four must hold **simultaneously** for deadlock: (1) **Mutual Exclusion** — at least one resource is non-shareable (only one process can use it at a time); (2) **Hold and Wait** — a process holds one resource while waiting for another; (3) **No Preemption** — resources can't be forcibly taken; (4) **Circular Wait** — P1 waits for P2, P2 waits for P3, …, Pn waits for P1. **Deadlock prevention** eliminates one condition — most practical is eliminating circular wait by enforcing a **global lock ordering** (always acquire lock A before lock B). Python example: `threading.Lock()` objects always acquired in the same order across all threads.

> **Q: What are the four strategies for handling deadlocks?**  
> **A:** **(1) Prevention**: Statically eliminate a Coffman condition — e.g., require processes to request ALL resources upfront (eliminates Hold & Wait), or enforce lock ordering (eliminates circular wait). **(2) Avoidance**: Dynamically check that granting a resource keeps the system in a **safe state** — Banker's Algorithm simulates allocation and checks if a safe sequence exists. Theoretical, rarely used in practice. **(3) Detection & Recovery**: Allow deadlocks to occur, periodically run detection (cycle in resource-allocation graph), then recover by aborting a victim process (cheapest to restart) or preempting a resource. Used in database systems. **(4) Ostrich Algorithm**: Ignore it — cost of prevention/detection exceeds cost of occasional reboot. Used by most general-purpose OSes (Windows, Linux) for non-critical deadlocks.

> **Q: What is a race condition? Show a Python example and fix.**  
> **A:** A race condition is when correctness depends on the interleaving timing of threads.
```python
# ❌ Race condition
import threading
counter = 0
def increment():
    global counter
    for _ in range(100000):
        counter += 1   # NOT atomic: read → increment → write (3 steps)

threads = [threading.Thread(target=increment) for _ in range(2)]
for t in threads: t.start()
for t in threads: t.join()
print(counter)  # Expected 200000, actual: random < 200000

# ✅ Fixed with mutex
lock = threading.Lock()
counter = 0
def increment_safe():
    global counter
    for _ in range(100000):
        with lock:       # atomic critical section
            counter += 1
```
> The fix wraps the critical section in a lock so only one thread executes read-increment-write at a time.

---

## 28. Memory Management & Virtual Memory

### Concept
The OS provides each process an illusion of having a large, private, contiguous address space — **virtual memory** — regardless of actual physical RAM size.

**Process Memory Layout (low → high addresses):**
```
┌─────────────────┐  High
│  Stack          │  ← local vars, function calls (grows ↓)
│       ↓         │
│    (gap)        │
│       ↑         │
│  Heap           │  ← dynamic allocation malloc/new (grows ↑)
│  BSS            │  ← uninitialised globals/statics (zeroed)
│  Data segment   │  ← initialised globals/statics
│  Text (Code)    │  ← executable instructions (read-only)
└─────────────────┘  Low (address 0)
```

### 🎯 Interview Q&A

> **Q: What is virtual memory and why is it important?**  
> **A:** **Virtual memory** gives each process its own isolated address space (0 to 2^N-1). The **MMU (Memory Management Unit)** hardware translates every virtual address to a physical address using **page tables**. Benefits: **(1) Isolation** — process A cannot read/write process B's memory (security + stability); **(2) Overcommit** — processes can address more memory than physical RAM; pages not currently needed are swapped to disk; **(3) Shared libraries** — multiple processes map the same physical pages for libc, reducing physical memory use; **(4) Copy-on-Write (COW)** — `fork()` shares pages between parent and child; a private copy is made only when either writes, making fork() fast.

> **Q: What is a page fault? Walk through its handling.**  
> **A:** A page fault occurs when a process accesses a virtual address with no corresponding physical page currently in RAM (either never loaded or swapped out). Steps: (1) MMU detects missing page table entry → raises page fault exception → CPU jumps to OS page fault handler; (2) Handler checks if address is valid (within process's VMA — virtual memory area). If invalid → **segmentation fault** (SIGSEGV), kill process; (3) If valid, find a free physical frame (or evict one using a page replacement algorithm — LRU approximation); (4) If evicted frame is dirty, write it to swap disk; (5) Load the needed page from disk/executable into the frame; (6) Update page table entry; (7) Restart the faulting instruction — transparent to the process.

> **Q: What is the difference between internal and external fragmentation?**  
> **A:** **Internal fragmentation**: Wasted space *inside* an allocated block — allocating a 128-byte block for a 100-byte request wastes 28 bytes internally. Caused by fixed-size allocations. **External fragmentation**: Total free memory is sufficient but split into non-contiguous chunks — no single contiguous block is large enough for the request. Caused by variable-size allocation and deallocation patterns. **Paging eliminates external fragmentation** (by using fixed-size pages that can map anywhere) but introduces small internal fragmentation (last page of a file may be partially used). **Compaction** solves external fragmentation but is expensive (moves all live data).

---

## 29. Paging & Segmentation

### Concept
**Paging**: Physical memory is divided into fixed-size **frames**; logical memory into same-size **pages**. OS maps pages→frames via **page table**.

**Segmentation**: Logical memory divided into variable-size named **segments** (code, stack, heap) matching the programmer's view.

| Feature | Paging | Segmentation |
|---------|--------|-------------|
| Block size | Fixed (e.g., 4KB) | Variable |
| External fragmentation | ❌ None | ✅ Yes |
| Internal fragmentation | ✅ Yes (last page) | ❌ None |
| Programmer visible | No | Yes |

### 🎯 Interview Q&A

> **Q: How does paging work? What is the TLB and why is it critical?**  
> **A:** Virtual address = **page number (VPN)** + **page offset**. VPN indexes the page table → physical frame number (PFN). Physical address = PFN × page_size + offset. Problem: without caching, every memory access requires one page table lookup (a memory access itself) + the actual access = 2× memory accesses minimum. The **TLB (Translation Lookaside Buffer)** is an on-chip hardware cache of recent VPN→PFN translations (16–1024 entries). **TLB hit** (~1 cycle): translate directly. **TLB miss** (~10–100 cycles): walk page table in memory, load mapping into TLB. Modern CPUs have TLB hit rates of 99%+. TLB is flushed on context switch (since page tables change) — a major source of context switch overhead.

> **Q: What are page replacement algorithms?**  
> **A:** When a page fault occurs and no free frame exists, one must be evicted: **(1) OPT (Optimal)**: Evict the page not needed for longest future time — theoretically best, impossible in practice (needs future knowledge), used as benchmark. **(2) FIFO**: Evict the oldest page — simple but can evict frequently-used pages. Suffers **Bélády's anomaly** (more frames → more faults). **(3) LRU (Least Recently Used)**: Evict the page not accessed for the longest time — good approximation of OPT but expensive to implement perfectly (needs timestamp per access). **(4) Clock/Second-Chance**: FIFO with a reference bit — before evicting, give pages with reference bit=1 a second chance (clear bit, move on). Practical LRU approximation used in Linux. Goal: minimise page fault rate = minimise disk I/O.

> **Q: What is thrashing?**  
> **A:** **Thrashing** is when a process spends more time swapping pages than executing. Occurs when the process's **working set** (actively used pages) doesn't fit in allocated physical frames — it constantly page-faults, loads a page (evicting another needed page), immediately faults on the evicted page, etc. CPU utilisation plummets; disk I/O saturates. OS may increase multiprogramming degree (thinking CPU is underutilised), making it worse. Solutions: **(1) Working Set Model** — allocate each process enough frames to hold its current working set; **(2) Page Fault Frequency** — if fault rate exceeds threshold, give process more frames; **(3) Reduce multiprogramming degree** — swap out some processes entirely; **(4) Add RAM**.

---

## 30. File Systems

### Concept
A **file system** organises data storage on disk — managing file creation, deletion, reading, writing, naming, directories, and permissions.

**Key Unix File System Structures:**
- **Superblock**: FS metadata — total/free blocks, inode count, FS type
- **Inode table**: Array of inodes, one per file
- **Inode**: File metadata (permissions, size, timestamps, block pointers) — NOT the filename
- **Directory**: Maps filenames → inode numbers
- **Data blocks**: Actual file content

### 🎯 Interview Q&A

> **Q: What is an inode? What does it contain?**  
> **A:** An **inode (index node)** is a fixed-size data structure storing all file metadata **except the filename**: **file type** (regular/directory/symlink/device), **permissions** (rwx bits for owner/group/others + setuid/setgid/sticky), **owner UID and GID**, **file size in bytes**, **link count** (number of hard links), **timestamps** (atime: last access, mtime: last modification, ctime: last status change), and **block pointers** (12 direct blocks + 1 single-indirect + 1 double-indirect + 1 triple-indirect, enabling files from small to terabytes). The filename lives in the directory entry that points to this inode. This separation enables **hard links** — multiple filenames pointing to the same inode.

> **Q: What is the difference between a hard link and a soft (symbolic) link?**  
> **A:** **Hard link** (`ln file hardlink`): Another directory entry pointing to the **same inode**. Deleting the original filename doesn't delete the file — the file is deleted only when its **link count reaches 0** (all hard links removed). Hard links can't cross file systems (inodes are FS-specific) and can't link to directories. **Soft link / symlink** (`ln -s target link`): A special file containing a **path string** to the target. If the target is deleted, the symlink becomes dangling (broken). Symlinks can cross file systems and link to directories. `ls -la` shows symlinks with `->`. Use hard links to protect critical files from accidental deletion; use symlinks for flexibility and cross-filesystem references.

> **Q: What is journaling in file systems?**  
> **A:** **Journaling** (used by ext4, NTFS, HFS+) ensures file system consistency after crashes. Before making changes to the actual FS structures, the OS writes a **journal entry** (log) describing the intended changes to a circular log area. Then applies the actual changes. If the system crashes mid-operation, on recovery the OS reads the journal and either **redo** (re-apply incomplete operations) or **undo** (roll back partial operations). Without journaling (old ext2), a crash mid-write could leave the FS in an inconsistent state requiring `fsck` (file system check) — scanning the entire disk, which takes hours on large disks. Journaling reduces recovery to seconds.

---

## 31. System Calls & IPC

### Concept
**System calls** are the interface between user-space programs and the OS kernel. User programs run in **user mode** (restricted). To perform privileged operations (disk I/O, network, process creation), they issue a system call → CPU switches to **kernel mode** → OS handles it → returns to user mode.

**IPC Mechanism Comparison:**
| Mechanism | Speed | Scope | Sync needed? |
|-----------|-------|-------|-------------|
| Shared Memory | Fastest | Same machine | Yes (semaphore) |
| Message Queue | Fast | Same machine | No (built-in) |
| Pipe | Medium | Related processes | No (blocking) |
| Named Pipe (FIFO) | Medium | Same machine | No |
| Socket | Slower | Network-wide | No (protocols) |
| Signal | Very fast | Same machine | No (async) |

### 🎯 Interview Q&A

> **Q: What is the difference between `fork()` and `exec()`?**  
> **A:** **`fork()`** creates a new process (child) as a near-exact copy of the parent — same code, heap, stack, open files, environment. Uses **Copy-on-Write** so pages are only physically copied when modified. Returns the child's PID to the parent, returns 0 to the child. Both processes run independently from the next instruction after `fork()`. **`exec()`** replaces the **current process's** image with a new program — loads new executable, reinitialises stack/heap, starts from new `main()`. PID unchanged. Together (`fork` + `exec`) is how shells spawn commands: fork creates a child, child execs the command, parent waits. Python's `subprocess.Popen` does this. `os.fork()` in Python creates a child; `os.execv()` replaces a process image.

> **Q: What is the difference between pipes and shared memory?**  
> **A:** **Pipes**: Unidirectional byte stream between related processes. Every read/write goes through the **kernel buffer** (syscall overhead + copy). Synchronisation built-in (blocking on empty read, blocking write when full). Simple and safe. **Shared Memory** (`shmget`/`mmap`): After setup, processes read/write shared pages **directly without kernel** — maximum speed, no copy overhead. But **zero built-in synchronisation** — must use semaphores/mutexes to prevent race conditions. High complexity. Rule of thumb: use pipes for simplicity and small data; use shared memory for high-throughput, latency-sensitive data exchange between cooperating processes (e.g., video processing pipeline).

---

## 32. CPU Scheduling Algorithms

### Concept
| Algorithm | Preemptive | Starvation | Key Metric |
|-----------|-----------|-----------|------------|
| FCFS | ❌ | ❌ | Simple FIFO |
| SJF | ❌ | ✅ | Min avg wait |
| SRTF | ✅ | ✅ | Optimal avg wait |
| Round Robin | ✅ | ❌ | Fair response time |
| Priority | Both | ✅ (aging fixes) | Urgent first |
| Multilevel Queue | ✅ | ✅ | Separate queues |
| Linux CFS | ✅ | ❌ | Virtual runtime |

### 🎯 Interview Q&A

> **Q: How does Round Robin scheduling work? How does quantum size affect performance?**  
> **A:** Round Robin gives each process a fixed **time quantum** (typically 10–100ms) in circular order. When quantum expires, the process is preempted and added to the back of the ready queue. No starvation — every process gets CPU within (n-1)×quantum wait. **Quantum too large**: degenerates to FCFS; long jobs block short ones; poor interactive response. **Quantum too small**: constant context switching; CPU wastes majority of time saving/restoring state rather than executing processes. **Ideal quantum**: empirically, ~80% of CPU bursts should be shorter than the quantum (processes complete in one slice) while still allowing preemption of long processes. Linux uses a **variable quantum** based on priority via CFS (Completely Fair Scheduler).

> **Q: What is the Banker's Algorithm?**  
> **A:** The **Banker's Algorithm** is a deadlock **avoidance** algorithm (Dijkstra, 1965). Before granting a resource request, it simulates the allocation and checks if the resulting state is **safe** — a safe state has at least one **safe sequence** where all processes can complete using currently available + eventually released resources. If the state would be unsafe (could lead to deadlock), the request is denied and the process waits. Named after a bank: a banker won't lend money if doing so could leave them unable to satisfy all future withdrawals. Limitation: requires knowing maximum resource needs in advance; rarely used in real OSes (too conservative, too overhead), but used in DB transaction managers.

---

---

# 🐍 OOPs IN PYTHON

---

## 33. OOP Fundamentals — 4 Pillars

### Concept
Object-Oriented Programming organises code around **objects** (data + behaviour) rather than functions and logic. The four pillars form the foundation of OOP design.

| Pillar | Definition | Python Mechanism |
|--------|-----------|-----------------|
| **Encapsulation** | Bundling data + methods; hiding internal state | `_private`, `__mangled`, `@property` |
| **Abstraction** | Exposing only essential interfaces; hiding complexity | `ABC`, `@abstractmethod` |
| **Inheritance** | New class derives from existing class | `class Child(Parent)` |
| **Polymorphism** | Same interface, different behaviours | Method overriding, duck typing |

### 🎯 Interview Q&A

> **Q: What are the four pillars of OOP? Explain each with a Python example.**  
> **A:**
```python
# 1. ENCAPSULATION — hide internal state, expose via interface
class BankAccount:
    def __init__(self, balance):
        self.__balance = balance        # name-mangled: private

    @property
    def balance(self): return self.__balance

    def deposit(self, amount):
        if amount > 0: self.__balance += amount

# 2. ABSTRACTION — hide implementation, expose interface
from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self) -> float: ...    # interface only, no implementation

class Circle(Shape):
    def __init__(self, r): self.r = r
    def area(self): return 3.14 * self.r ** 2   # concrete implementation

# 3. INHERITANCE — reuse and extend
class Animal:
    def speak(self): return "..."

class Dog(Animal):
    def speak(self): return "Woof!"   # override

# 4. POLYMORPHISM — same interface, different behaviour
animals = [Dog(), Cat(), Bird()]
for a in animals:
    print(a.speak())   # each calls its own version
```

> **Q: What is the difference between Abstraction and Encapsulation?**  
> **A:** **Encapsulation** is about **hiding data** — bundling state and behaviour together and restricting direct access to internal state (using `_`/`__` prefix, `@property`). The goal is data protection and controlled access. **Abstraction** is about **hiding complexity** — exposing only the essential interface and hiding the implementation details. The goal is simplification. Analogy: A car's **engine** is encapsulated (you can't touch internal components directly). The **steering wheel and pedals** are abstraction (you interact through a simple interface without knowing how fuel injection works). In Python: `@property` is encapsulation; `ABC` with `@abstractmethod` is abstraction.

---

## 34. Classes, Objects & `self`

### Concept
A **class** is a blueprint. An **object** (instance) is a concrete realisation. `self` is the reference to the current instance — passed automatically as the first argument to every instance method.

### Code
```python
class Car:
    # Class attribute — shared by ALL instances
    total_cars = 0

    def __init__(self, make: str, model: str, year: int):
        # Instance attributes — unique per object
        self.make  = make
        self.model = model
        self.year  = year
        self._mileage = 0           # _ = protected by convention
        Car.total_cars += 1

    def drive(self, km: float) -> str:
        self._mileage += km
        return f"Drove {km}km. Total: {self._mileage}km"

    @property
    def mileage(self):              # getter
        return self._mileage

    @classmethod
    def from_string(cls, s: str) -> "Car":   # alternative constructor
        make, model, year = s.split("-")
        return cls(make, model, int(year))

    @staticmethod
    def is_vintage(year: int) -> bool:       # utility — no self/cls needed
        return year < 1990

    def __repr__(self):
        return f"Car(make={self.make!r}, model={self.model!r}, year={self.year})"

    def __str__(self):
        return f"{self.year} {self.make} {self.model}"

# Usage
c1 = Car("Toyota", "Camry", 2020)
c2 = Car.from_string("Honda-Civic-2019")
print(Car.total_cars)       # 2
print(c1.drive(150))
print(Car.is_vintage(1985)) # True
print(repr(c1))
print(str(c1))
```

### 🎯 Interview Q&A

> **Q: What is `self` in Python? Is it a keyword?**  
> **A:** `self` is **not a keyword** — it's a strong convention for the first parameter of instance methods. Python automatically passes the instance as the first argument when you call `obj.method()` — `obj.drive(150)` becomes `Car.drive(obj, 150)`. You could name it anything (`this`, `me`) but `self` is universal convention. It allows methods to access and modify the instance's attributes (`self.make`, `self._mileage`). Without `self`, there's no way for a method to know which instance it's operating on.

> **Q: What is the difference between a class attribute and an instance attribute?**  
> **A:** A **class attribute** is defined in the class body (outside `__init__`) — shared by all instances. Changing it via the class (`Car.total_cars += 1`) affects all instances. An **instance attribute** is defined in `__init__` via `self.attr = value` — unique per object. Critical gotcha: if you do `car_obj.total_cars = 5`, Python creates a new **instance attribute** that shadows the class attribute for that specific object only — the class attribute is unchanged for all others. This shadowing behaviour confuses many beginners.

> **Q: What is `__init__` and is it a constructor?**  
> **A:** `__init__` is the **initialiser**, not the true constructor. The actual constructor is `__new__` (called first to create the object). `__init__` is called after the object is created to initialise its attributes. In practice, we call `__init__` the constructor because `__new__` is rarely overridden. `__init__` never returns a value (implicitly returns `None`). You can define multiple `__init__` logic via `@classmethod` alternative constructors (e.g., `from_string`, `from_dict`, `from_file`) since Python doesn't support method overloading.

---

## 35. Encapsulation & Properties

### Concept
**Encapsulation** bundles data and methods, protecting internal state from direct external access. Python uses naming conventions and `@property` descriptors.

- `name` — public: accessible everywhere
- `_name` — protected: convention "don't access from outside"; still accessible
- `__name` — private: **name-mangling** → `_ClassName__name`; harder to access accidentally

### Code
```python
class Temperature:
    def __init__(self, celsius: float):
        self._celsius = celsius   # _ = protected by convention

    # GETTER — access like attribute: temp.celsius
    @property
    def celsius(self) -> float:
        return self._celsius

    # SETTER — validate on assignment: temp.celsius = 25
    @celsius.setter
    def celsius(self, value: float) -> None:
        if value < -273.15:
            raise ValueError(f"Temperature below absolute zero: {value}")
        self._celsius = value

    # DELETER
    @celsius.deleter
    def celsius(self) -> None:
        del self._celsius

    # Computed property (no setter — read only)
    @property
    def fahrenheit(self) -> float:
        return self._celsius * 9/5 + 32

    @property
    def kelvin(self) -> float:
        return self._celsius + 273.15


t = Temperature(100)
print(t.celsius)      # 100   — getter called
print(t.fahrenheit)   # 212.0 — computed
t.celsius = 25        # setter called with validation
# t.celsius = -300    # raises ValueError
```

### 🎯 Interview Q&A

> **Q: Why use `@property` instead of direct attribute access or getters/setters?**  
> **A:** `@property` gives the **best of both worlds**: the clean syntax of attribute access (`obj.value`) with the power of a method (validation, computation, side effects). Three reasons: (1) **Validation** — prevent invalid state without polluting call sites with setter calls; (2) **Computed attributes** — `fahrenheit` computes from `celsius` dynamically, no sync issues; (3) **Backward compatibility** — start with a plain attribute `self.value = x`; later add validation by converting to `@property` without changing any calling code (no refactoring needed). Java forces getters/setters from the start; Python's `@property` lets you start simple and add complexity later.

> **Q: What is name mangling in Python? When would you use `__` (double underscore)?**  
> **A:** **Name mangling** transforms `__attr` to `_ClassName__attr`. Example: `self.__balance` in `BankAccount` becomes `_BankAccount__balance`. It's still accessible (`obj._BankAccount__balance`) but the double underscore prevents **accidental overriding in subclasses**. If `BankAccount` and a subclass `SavingsAccount` both define `__balance`, they won't clash — each has its own mangled name. Use `__` (not `_`) specifically to avoid subclass attribute name collisions in class hierarchies. Don't use it for general "privacy" — `_` convention is enough for that.

---

## 36. Inheritance & `super()`

### Concept
**Inheritance** creates an IS-A relationship — a subclass inherits all attributes and methods of the parent and can override or extend them. `super()` provides access to the parent class's methods following the MRO.

### Code
```python
class Vehicle:
    def __init__(self, make: str, speed: int):
        self.make  = make
        self.speed = speed

    def describe(self) -> str:
        return f"{self.make} going {self.speed}km/h"

    def move(self) -> str:
        return "Moving"


class Car(Vehicle):
    def __init__(self, make: str, speed: int, doors: int):
        super().__init__(make, speed)    # ← call parent __init__
        self.doors = doors

    def describe(self) -> str:          # override
        base = super().describe()       # ← call parent method
        return f"{base} with {self.doors} doors"

    def honk(self) -> str:             # new method
        return "Beep!"


class ElectricCar(Car):
    def __init__(self, make: str, speed: int, doors: int, battery_kwh: int):
        super().__init__(make, speed, doors)
        self.battery_kwh = battery_kwh

    def describe(self) -> str:
        return super().describe() + f" | Battery: {self.battery_kwh}kWh"


ec = ElectricCar("Tesla", 250, 4, 100)
print(ec.describe())
# Tesla going 250km/h with 4 doors | Battery: 100kWh

# isinstance checks full hierarchy
print(isinstance(ec, ElectricCar))  # True
print(isinstance(ec, Car))          # True
print(isinstance(ec, Vehicle))      # True
print(type(ec) == Car)              # False — exact type only
```

### 🎯 Interview Q&A

> **Q: What does `super()` do and why use it instead of calling the parent class directly?**  
> **A:** `super()` returns a proxy object that delegates method calls to the **next class in the MRO**, not necessarily the direct parent. With `super().__init__()` in `Car`, calling `ElectricCar.__init__` triggers `Car.__init__` which calls `super().__init__` which hits `Vehicle.__init__` — the entire chain is called in MRO order. If you hardcode `Car.__init__(self, ...)` instead, in multiple inheritance scenarios the cooperative call chain breaks — some classes might be skipped or called twice. `super()` is **cooperative inheritance** — essential for correct multiple inheritance. Always use `super()`.

> **Q: What is method overriding? What is method overloading? Does Python support both?**  
> **A:** **Method overriding**: A subclass provides its own implementation of a method defined in the parent — same name, same signature. Python fully supports this. The most derived class's method is called. **Method overloading**: Multiple methods with the same name but different parameter types/counts. Python does **NOT** support traditional overloading — defining a method twice just replaces the first. Python alternatives: (1) Default parameters `def area(self, r=None, l=None, w=None):`; (2) `*args/**kwargs`; (3) `@singledispatch` from functools for type-based dispatch; (4) `isinstance` checks inside the method.

---

## 37. Polymorphism & Duck Typing

### Concept
**Polymorphism** — "many forms" — allows objects of different classes to be treated uniformly through a common interface. Python achieves this primarily through **duck typing**: "If it walks like a duck and quacks like a duck, it's a duck" — type is less important than behaviour.

### Code
```python
# ── Runtime polymorphism via method overriding ────────────────────
class Shape:
    def area(self) -> float:
        raise NotImplementedError

class Circle(Shape):
    def __init__(self, r): self.r = r
    def area(self): return 3.14159 * self.r ** 2

class Rectangle(Shape):
    def __init__(self, w, h): self.w, self.h = w, h
    def area(self): return self.w * self.h

class Triangle(Shape):
    def __init__(self, b, h): self.b, self.h = b, h
    def area(self): return 0.5 * self.b * self.h

def total_area(shapes: list) -> float:
    return sum(s.area() for s in shapes)   # polymorphic call

shapes = [Circle(5), Rectangle(4, 6), Triangle(3, 8)]
print(total_area(shapes))   # calls each shape's own area()

# ── Duck typing — no inheritance needed ───────────────────────────
class Dog:
    def speak(self): return "Woof!"

class Cat:
    def speak(self): return "Meow!"

class Robot:
    def speak(self): return "Beep boop!"

def make_noise(thing):        # no type annotation needed
    print(thing.speak())      # works for ANY object with speak()

for obj in [Dog(), Cat(), Robot()]:
    make_noise(obj)           # Duck typing in action

# ── Operator overloading — polymorphism for operators ─────────────
class Vector:
    def __init__(self, x, y): self.x, self.y = x, y
    def __add__(self, other): return Vector(self.x+other.x, self.y+other.y)
    def __str__(self): return f"Vector({self.x}, {self.y})"

v1, v2 = Vector(1, 2), Vector(3, 4)
print(v1 + v2)   # Vector(4, 6) — + calls __add__
```

### 🎯 Interview Q&A

> **Q: What is duck typing? How does it relate to polymorphism?**  
> **A:** Duck typing is Python's primary form of polymorphism — instead of checking an object's type, Python checks if it has the required method or attribute. `make_noise(thing)` works with Dog, Cat, Robot, or any future class that has a `speak()` method — no common base class or interface required. This is more flexible than Java/C++ where you must explicitly declare that a class implements an interface. Duck typing is enabled by Python's dynamic dispatch — method lookup happens at runtime, not compile time. The downside: type errors are caught at runtime, not at definition time (mitigated by type hints + mypy).

> **Q: What is operator overloading? Which dunder methods enable it?**  
> **A:** **Operator overloading** lets user-defined classes define behaviour for Python operators. Key dunder methods: `__add__` (+), `__sub__` (-), `__mul__` (*), `__truediv__` (/), `__floordiv__` (//), `__mod__` (%), `__pow__` (**), `__eq__` (==), `__lt__` (<), `__le__` (<=), `__len__` (len()), `__getitem__` (obj[key]), `__contains__` (in operator), `__call__` (obj()). Always return `NotImplemented` (not `NotImplementedError`) when the operation isn't supported for a type — Python then tries the reflected operation on the other operand. When you define `__eq__`, Python sets `__hash__ = None` — define `__hash__` explicitly if you need the object to be hashable.

---

## 38. Abstraction & ABCs

### Concept
**Abstraction** exposes only what's necessary and hides the "how." In Python, `ABC (Abstract Base Class)` from the `abc` module enforces that subclasses implement specified methods — providing a formal interface contract.

### Code
```python
from abc import ABC, abstractmethod
from typing import List


class DatabaseConnector(ABC):
    """Abstract interface — defines WHAT, not HOW."""

    @abstractmethod
    def connect(self, host: str, port: int) -> bool:
        """Establish database connection."""
        ...

    @abstractmethod
    def execute(self, query: str) -> List[dict]:
        """Execute a SQL query and return results."""
        ...

    @abstractmethod
    def disconnect(self) -> None:
        """Close the connection."""
        ...

    # Non-abstract method with shared logic
    def execute_safe(self, query: str) -> List[dict]:
        if not query.strip():
            raise ValueError("Empty query")
        return self.execute(query)


class MySQLConnector(DatabaseConnector):
    def connect(self, host, port):
        print(f"Connecting to MySQL at {host}:{port}")
        return True

    def execute(self, query):
        print(f"MySQL executing: {query}")
        return [{"id": 1, "name": "Alice"}]

    def disconnect(self):
        print("MySQL disconnected")


class PostgreSQLConnector(DatabaseConnector):
    def connect(self, host, port):
        print(f"Connecting to PostgreSQL at {host}:{port}")
        return True

    def execute(self, query):
        print(f"PG executing: {query}")
        return []

    def disconnect(self):
        print("PG disconnected")


# Cannot instantiate abstract class
# db = DatabaseConnector()  # ← TypeError!

# Polymorphic usage — code works with ANY connector
def run_query(db: DatabaseConnector, query: str):
    db.connect("localhost", 5432)
    results = db.execute_safe(query)
    db.disconnect()
    return results

run_query(MySQLConnector(), "SELECT * FROM users")
run_query(PostgreSQLConnector(), "SELECT * FROM orders")
```

### 🎯 Interview Q&A

> **Q: What is an Abstract Base Class? Why use it instead of just raising NotImplementedError?**  
> **A:** An **ABC** with `@abstractmethod` enforces the interface **at class instantiation time** — the moment you try to instantiate a subclass that hasn't implemented all abstract methods, Python raises `TypeError`. Raising `NotImplementedError` only fails at **call time** — you can create a broken subclass object and ship it to production without knowing it's incomplete. ABCs also support `isinstance()` and `issubclass()` checks — `isinstance(obj, DatabaseConnector)` works for any concrete implementation. ABCs document intent clearly: "this class is an interface, all subclasses MUST implement these methods." Use ABCs when building frameworks, plugin systems, or any API where users provide implementations.

> **Q: What is the difference between an interface and an abstract class? How does Python handle this?**  
> **A:** In Java/C++, an **interface** has only abstract methods (no state, no implementation), while an **abstract class** can have concrete methods and state. Python has no separate `interface` keyword — the `ABC` mechanism serves both purposes: a pure ABC with all `@abstractmethod` and no concrete methods = interface; an ABC with some concrete methods = abstract class. Python also supports **Protocol** (from `typing`, Python 3.8+) for structural subtyping — a class satisfies a Protocol if it has the right methods/attributes, without inheriting from it (true duck typing with static analysis support).

---

## 39. Magic / Dunder Methods

### Concept
**Dunder (double-underscore) methods** integrate objects with Python's built-in syntax and functions — making objects feel like built-in types.

### Code
```python
class Stack:
    def __init__(self):
        self._items: list = []

    # ── Object representation ────────────────────────────────────
    def __repr__(self) -> str:
        return f"Stack({self._items!r})"   # for developers

    def __str__(self) -> str:
        return f"Stack with {len(self._items)} items: top={self._items[-1] if self._items else None}"

    # ── Container protocol ────────────────────────────────────────
    def __len__(self) -> int:
        return len(self._items)

    def __contains__(self, item) -> bool:
        return item in self._items

    def __getitem__(self, index):
        return self._items[index]

    def __iter__(self):
        return iter(reversed(self._items))   # iterate top→bottom

    # ── Comparison ────────────────────────────────────────────────
    def __eq__(self, other) -> bool:
        if not isinstance(other, Stack):
            return NotImplemented           # not NotImplementedError!
        return self._items == other._items

    def __hash__(self):
        return hash(tuple(self._items))     # needed since __eq__ defined

    # ── Boolean ───────────────────────────────────────────────────
    def __bool__(self) -> bool:
        return len(self._items) > 0         # empty stack is falsy

    # ── Callable ──────────────────────────────────────────────────
    def __call__(self, item):              # stack(value) pushes
        self._items.append(item)
        return self

    # Stack-specific methods
    def push(self, item): self._items.append(item)
    def pop(self):
        if not self._items: raise IndexError("pop from empty stack")
        return self._items.pop()
    def peek(self): return self._items[-1] if self._items else None


s = Stack()
s(1)(2)(3)           # callable chaining via __call__
print(len(s))        # 3 — __len__
print(2 in s)        # True — __contains__
print(bool(s))       # True — __bool__
for item in s:       # __iter__
    print(item)      # 3, 2, 1 (top to bottom)
```

### 🎯 Interview Q&A

> **Q: What is the difference between `__repr__` and `__str__`?**  
> **A:** `__repr__` is for **developers** — unambiguous, should ideally produce a string that `eval()` can recreate the object: `Stack([1, 2, 3])`. Used in the REPL, in lists, and in `repr()`. `__str__` is for **end users** — human-friendly, readable: `"Stack with 3 items: top=3"`. Used by `print()`, `str()`, f-strings. If only `__repr__` is defined, `str()` falls back to it. If only `__str__`, the REPL uses a default like `<Stack object at 0x...>`. **Best practice**: always define `__repr__` (most important); define `__str__` when you want a different user-friendly representation.

> **Q: Why does defining `__eq__` make an object unhashable?**  
> **A:** The **hash contract** requires: if `a == b`, then `hash(a) == hash(b)`. If you define custom `__eq__` but rely on the default `__hash__` (which is based on object identity/id), two objects that compare equal might have different hashes — violating the contract and breaking dictionaries and sets. Python therefore sets `__hash__ = None` when you define `__eq__`, making the object unhashable. To make your object both equality-comparable **and** hashable (usable as dict keys/set members), explicitly define `__hash__` using the same fields as `__eq__`: `return hash((self.x, self.y))`.

> **Q: What is the `__call__` method?**  
> **A:** `__call__` makes an object **callable** — you can invoke it with `obj(args)` like a function. This enables: (1) **Stateful callables** — objects that behave like functions but remember state between calls (counters, caches); (2) **Callable class instances** as callbacks/strategy objects; (3) **Decorators as classes** — `@MyDecorator` works because the class instance is callable. Example: `class Counter: def __call__(self): self.n += 1; return self.n` — each call returns the next integer. `callable(obj)` returns `True` if the object has `__call__`.

---

## 40. Class vs Static vs Instance Methods

### Concept
| Method Type | Decorator | First Param | Access | Use Case |
|------------|-----------|-------------|--------|----------|
| Instance | (none) | `self` (instance) | Instance + class attrs | Regular methods |
| Class | `@classmethod` | `cls` (class) | Class attrs only | Alternative constructors |
| Static | `@staticmethod` | (none) | Nothing automatically | Utility functions |

### Code
```python
class Pizza:
    _discount_rate = 0.10       # class attribute

    def __init__(self, size: str, toppings: list):
        self.size     = size
        self.toppings = toppings
        self._base_price = {"small": 8, "medium": 12, "large": 16}[size]

    # ── INSTANCE method — operates on self ────────────────────────
    def price(self) -> float:
        return self._base_price + len(self.toppings) * 1.5

    def discounted_price(self) -> float:
        return self.price() * (1 - Pizza._discount_rate)

    # ── CLASS method — operates on class, not instance ────────────
    @classmethod
    def set_discount(cls, rate: float) -> None:
        cls._discount_rate = rate       # affects ALL instances

    @classmethod
    def margherita(cls) -> "Pizza":    # alternative constructor
        return cls("medium", ["tomato", "mozzarella"])

    @classmethod
    def pepperoni(cls) -> "Pizza":     # alternative constructor
        return cls("large", ["tomato", "mozzarella", "pepperoni"])

    # ── STATIC method — utility, no self/cls needed ───────────────
    @staticmethod
    def is_valid_size(size: str) -> bool:
        return size in ("small", "medium", "large")

    @staticmethod
    def calculate_tax(price: float, rate: float = 0.08) -> float:
        return price * rate

    def __repr__(self):
        return f"Pizza({self.size!r}, {self.toppings})"


p1 = Pizza("large", ["pepperoni", "mushrooms"])
p2 = Pizza.margherita()                   # classmethod constructor
print(p1.price())                          # instance method
print(Pizza.is_valid_size("huge"))         # False — static
Pizza.set_discount(0.20)                   # classmethod — affects all
print(p1.discounted_price())
print(Pizza.calculate_tax(12.0))           # static utility
```

### 🎯 Interview Q&A

> **Q: What is the difference between `@classmethod` and `@staticmethod`?**  
> **A:** `@classmethod` receives the **class itself** as the first argument (`cls`) — it can access and modify class-level attributes and create instances (primary use: **alternative constructors** like `from_dict`, `from_json`, `from_string`). Calling `cls(...)` inside a classmethod respects inheritance — if a subclass calls the classmethod, `cls` is the subclass, not the parent. `@staticmethod` receives **neither self nor cls** — it's a plain function that lives in the class namespace for organisational purposes. It can't access class or instance state without explicit references. Use staticmethod for utility/helper functions logically related to the class but independent of class state.

> **Q: Can a static method be called on an instance?**  
> **A:** Yes — `instance.static_method()` works, but `cls` and `self` are NOT passed. It's identical to `ClassName.static_method()`. Calling it on an instance is just syntactic convenience — Python looks up the method on the class and calls it with no automatic arguments. This is different from `@classmethod` where `instance.class_method()` passes the class (not the instance) as first argument. Best practice: call static methods on the class (`Pizza.is_valid_size(...)`) to make it clear no instance state is involved.

---

## 41. MRO & Multiple Inheritance

### Concept
Python's **MRO (Method Resolution Order)** defines the order in which classes are searched for a method. Python uses the **C3 Linearisation** algorithm, ensuring a consistent, intuitive order that respects class hierarchies.

**C3 Rule**: Start with the class itself, then linearise parents left-to-right, ensuring: (1) a class always appears before its parents, (2) left-to-right order of parents is preserved, (3) no class appears before its subclasses.

### Code
```python
class A:
    def hello(self): return "A"

class B(A):
    def hello(self): return "B"

class C(A):
    def hello(self): return "C"

class D(B, C):
    pass

# MRO: D → B → C → A → object
print(D.__mro__)
# (<class 'D'>, <class 'B'>, <class 'C'>, <class 'A'>, <class 'object'>)
print(D().hello())   # "B" — first in MRO after D

# ── Mixin pattern — most common use of multiple inheritance ────────
class JSONMixin:
    """Adds JSON serialisation. No __init__ — pure behaviour."""
    def to_json(self) -> str:
        import json
        return json.dumps(self.__dict__, default=str)

    @classmethod
    def from_json(cls, json_str: str):
        import json
        data = json.loads(json_str)
        obj = cls.__new__(cls)
        obj.__dict__.update(data)
        return obj

class LogMixin:
    """Adds logging to any class."""
    def log(self, message: str) -> None:
        print(f"[{self.__class__.__name__}] {message}")

class TimestampMixin:
    """Adds created_at on init."""
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)    # cooperative super()!
        from datetime import datetime
        self.created_at = datetime.now().isoformat()

class User(TimestampMixin, JSONMixin, LogMixin):
    def __init__(self, name: str, email: str):
        super().__init__()     # triggers TimestampMixin.__init__
        self.name  = name
        self.email = email

u = User("Alice", "alice@example.com")
print(u.to_json())             # JSONMixin method
u.log("User created")          # LogMixin method
print(u.created_at)            # TimestampMixin attribute
print(User.__mro__)
```

### 🎯 Interview Q&A

> **Q: What is the MRO and how does Python calculate it?**  
> **A:** The **MRO** is the order Python searches classes when looking up a method or attribute. Python uses **C3 Linearisation**: for `class D(B, C)`, the MRO is computed as D + merge(MRO(B), MRO(C), [B, C]). The merge algorithm takes the first element of each list if it doesn't appear in the tail of any other list. Result: `D → B → C → A → object`. This ensures: (1) A subclass always comes before its parents; (2) The left-to-right order of parent classes is preserved; (3) The diamond problem (shared ancestor) is resolved — `A` appears only once. Always inspect `ClassName.__mro__` when debugging unexpected method resolution.

> **Q: What is the diamond problem and how does Python solve it?**  
> **A:** The **diamond problem** occurs in multiple inheritance when class D inherits from B and C, both of which inherit from A — forming a diamond shape. The question: if D calls `super().__init__()`, should A's `__init__` be called once or twice? Without a strategy, naïve implementations call A twice (wasting work or causing bugs). Python's **C3 MRO** ensures each class appears **exactly once** in the resolution order. `super()` in cooperative inheritance follows the MRO — B's `super()` calls C (not A directly), and C's `super()` calls A. Every class in the chain is called exactly once, in MRO order.

> **Q: What is a Mixin? When would you use it?**  
> **A:** A **Mixin** is a class designed to add specific, reusable behaviour to other classes via multiple inheritance — not meant to be instantiated alone. Mixins: (1) are small and focused (one responsibility); (2) typically have no `__init__` or minimal cooperative `__init__`; (3) don't inherit from the classes they'll be mixed into. Use mixins to: add serialisation (`JSONMixin`, `XMLMixin`), logging, caching, validation, timestamp tracking to any class without duplicating code. Convention: name mixins with `Mixin` suffix. Django REST Framework uses mixins extensively (`CreateModelMixin`, `ListModelMixin`).

---

## 42. Composition vs Inheritance

### Concept
Two fundamental ways to reuse code:
- **Inheritance** (IS-A): `Dog IS-A Animal` — use when the subclass truly IS a specialised version of the parent
- **Composition** (HAS-A): `Car HAS-A Engine` — use when one class contains or uses another

> **Favour composition over inheritance** (Gang of Four) — it's more flexible, less tightly coupled.

### Code
```python
# ── Inheritance — IS-A ────────────────────────────────────────────
class Animal:
    def breathe(self): return "breathing"

class Dog(Animal):          # Dog IS-A Animal — correct use
    def bark(self): return "Woof!"


# ── Composition — HAS-A ──────────────────────────────────────────
class Engine:
    def __init__(self, horsepower: int):
        self.hp = horsepower

    def start(self) -> str:
        return f"Engine ({self.hp}hp) started"

    def stop(self) -> str:
        return "Engine stopped"

class GPS:
    def navigate(self, destination: str) -> str:
        return f"Navigating to {destination}"

class Car:
    def __init__(self, make: str, hp: int):
        self.make   = make
        self._engine = Engine(hp)      # HAS-A Engine
        self._gps    = GPS()           # HAS-A GPS

    def start(self) -> str:
        return f"{self.make}: {self._engine.start()}"

    def navigate(self, dest: str) -> str:
        return self._gps.navigate(dest)

car = Car("Tesla", 400)
print(car.start())
print(car.navigate("Airport"))

# ── Why composition beats inheritance here ────────────────────────
# If Car INHERITED from Engine: Car IS-A Engine? No! That's wrong.
# Also, if we want to swap for ElectricEngine, composition is trivial:
class ElectricEngine:
    def __init__(self, kw: int): self.kw = kw
    def start(self): return f"Electric motor ({self.kw}kW) humming"
    def stop(self): return "Motor stopped"

class ElectricCar(Car):
    def __init__(self, make: str, kw: int):
        self.make    = make
        self._engine = ElectricEngine(kw)  # swap engine, same interface
        self._gps    = GPS()
```

### 🎯 Interview Q&A

> **Q: When should you use inheritance vs composition?**  
> **A:** Use **inheritance** when: (1) the IS-A relationship is genuinely true and stable (Dog IS-A Animal, not just "has similar methods"); (2) you want polymorphism — treating subclasses uniformly through a base class interface; (3) the subclass extends the parent's behaviour while reusing most of it. Use **composition** when: (1) HAS-A relationship (Car HAS-A Engine, User HAS-A Address); (2) you need flexibility to swap implementations at runtime; (3) you want to avoid fragile base class problems (changing the parent breaks all children); (4) you need behaviour from multiple sources (Python allows multiple inheritance, but deep hierarchies become unmaintainable). Rule of thumb: if you can model it with composition, prefer it.

> **Q: What is the fragile base class problem?**  
> **A:** The **fragile base class** problem occurs when a change to a parent class unexpectedly breaks subclasses. Example: a parent class's `add_all()` method calls `add()` internally. A subclass overrides `add()` with counting logic. If `add_all()` in the parent changes to not call `add()` anymore, the subclass's counting breaks silently. With composition, the subclass doesn't override parent methods — it uses the component through a stable interface. Changes to the component's internals don't break the container as long as the public API stays the same.

---

## 43. Design Patterns in Python

### Concept
**Design patterns** are reusable solutions to common software design problems. Gang of Four (GoF) categorised 23 patterns into: **Creational**, **Structural**, **Behavioural**.

### Code
```python
# ── SINGLETON — one instance only ────────────────────────────────
class DatabasePool:
    _instance = None

    def __new__(cls, *args, **kwargs):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance._initialised = False
        return cls._instance

    def __init__(self, size: int = 10):
        if self._initialised: return
        self.size = size
        self.connections = []
        self._initialised = True

db1 = DatabasePool(10)
db2 = DatabasePool(20)
print(db1 is db2)      # True — same instance
print(db1.size)        # 10 — first init wins


# ── FACTORY METHOD — delegate creation to subclass ────────────────
from abc import ABC, abstractmethod

class Notification(ABC):
    @abstractmethod
    def send(self, message: str) -> str: ...

class EmailNotification(Notification):
    def send(self, message): return f"Email: {message}"

class SMSNotification(Notification):
    def send(self, message): return f"SMS: {message}"

class PushNotification(Notification):
    def send(self, message): return f"Push: {message}"

def notification_factory(channel: str) -> Notification:
    channels = {
        "email": EmailNotification,
        "sms":   SMSNotification,
        "push":  PushNotification,
    }
    if channel not in channels:
        raise ValueError(f"Unknown channel: {channel}")
    return channels[channel]()

notif = notification_factory("email")
print(notif.send("Hello!"))


# ── OBSERVER — publish/subscribe ─────────────────────────────────
from typing import Callable, List

class EventEmitter:
    def __init__(self):
        self._listeners: dict[str, List[Callable]] = {}

    def on(self, event: str, callback: Callable) -> None:
        self._listeners.setdefault(event, []).append(callback)

    def emit(self, event: str, *args, **kwargs) -> None:
        for cb in self._listeners.get(event, []):
            cb(*args, **kwargs)

emitter = EventEmitter()
emitter.on("data", lambda x: print(f"Handler 1: {x}"))
emitter.on("data", lambda x: print(f"Handler 2: {x}"))
emitter.emit("data", "Hello World")


# ── DECORATOR PATTERN — wrap objects ─────────────────────────────
class Coffee:
    def cost(self) -> float: return 2.0
    def description(self) -> str: return "Coffee"

class MilkDecorator:
    def __init__(self, coffee): self._coffee = coffee
    def cost(self): return self._coffee.cost() + 0.5
    def description(self): return self._coffee.description() + " + Milk"

class SugarDecorator:
    def __init__(self, coffee): self._coffee = coffee
    def cost(self): return self._coffee.cost() + 0.25
    def description(self): return self._coffee.description() + " + Sugar"

drink = SugarDecorator(MilkDecorator(Coffee()))
print(drink.description())   # Coffee + Milk + Sugar
print(drink.cost())          # 2.75


# ── STRATEGY — interchangeable algorithms ────────────────────────
from typing import Protocol

class SortStrategy(Protocol):
    def sort(self, data: list) -> list: ...

class BubbleSortStrategy:
    def sort(self, data: list) -> list:
        d = data[:]
        n = len(d)
        for i in range(n):
            for j in range(n-i-1):
                if d[j] > d[j+1]: d[j], d[j+1] = d[j+1], d[j]
        return d

class QuickSortStrategy:
    def sort(self, data: list) -> list:
        if len(data) <= 1: return data
        p = data[len(data)//2]
        return (self.sort([x for x in data if x < p]) +
                [x for x in data if x == p] +
                self.sort([x for x in data if x > p]))

class Sorter:
    def __init__(self, strategy: SortStrategy):
        self._strategy = strategy

    def sort(self, data: list) -> list:
        return self._strategy.sort(data)

    def set_strategy(self, strategy: SortStrategy) -> None:
        self._strategy = strategy

data = [5, 2, 8, 1, 9, 3]
sorter = Sorter(QuickSortStrategy())
print(sorter.sort(data))
sorter.set_strategy(BubbleSortStrategy())
print(sorter.sort(data))
```

### 🎯 Interview Q&A

> **Q: What is the Singleton pattern? What are its drawbacks?**  
> **A:** The **Singleton** ensures only one instance of a class exists globally and provides a global access point to it. Used for: shared resources (DB connection pool, config, logger). Python implementation: override `__new__` to return the existing instance. **Drawbacks**: (1) **Global state** — makes testing hard (one test's state bleeds into another); (2) **Hidden dependencies** — components rely on a global implicitly; (3) **Violates SRP** — the class manages both its responsibility AND its own lifecycle; (4) **Thread-safety issues** in `__new__` requires locking. Modern alternative: **dependency injection** — pass the shared object explicitly; much easier to test and mock.

> **Q: What is the difference between the Decorator pattern and Python's `@decorator`?**  
> **A:** The **GoF Decorator pattern** wraps objects to add behaviour dynamically at runtime — `MilkDecorator(Coffee())` wraps a Coffee object and adds milk behaviour. Objects can be stacked at runtime. Python's **`@decorator` syntax** is a function-wrapping mechanism at definition time — `@timer` replaces a function with a wrapper function. They share the same concept (wrapping), but GoF Decorator is object-oriented (wrapping instances); Python decorators are functional (wrapping callables). Both avoid subclassing for every combination of added behaviour.

---

## 44. SOLID Principles in Python

### Concept
**SOLID** is a set of five design principles for writing maintainable, scalable, and testable OOP code.

| Letter | Principle | Definition |
|--------|-----------|-----------|
| **S** | Single Responsibility | A class should have one reason to change |
| **O** | Open/Closed | Open for extension, closed for modification |
| **L** | Liskov Substitution | Subtypes must be substitutable for their base types |
| **I** | Interface Segregation | Clients shouldn't depend on interfaces they don't use |
| **D** | Dependency Inversion | Depend on abstractions, not concretions |

### Code
```python
# ── S: Single Responsibility Principle ───────────────────────────
# ❌ WRONG — UserManager does too many things
class UserManager:
    def create_user(self, name, email): pass
    def send_welcome_email(self, user): pass   # email concern
    def save_to_db(self, user): pass            # DB concern
    def generate_report(self): pass             # reporting concern

# ✅ CORRECT — each class has one reason to change
class UserService:
    def create_user(self, name: str, email: str) -> dict:
        return {"name": name, "email": email}

class EmailService:
    def send_welcome(self, user: dict) -> None:
        print(f"Sending welcome email to {user['email']}")

class UserRepository:
    def save(self, user: dict) -> None:
        print(f"Saving {user} to database")


# ── O: Open/Closed Principle ──────────────────────────────────────
# ❌ WRONG — must modify class to add new discount type
class DiscountService:
    def get_discount(self, customer_type: str) -> float:
        if customer_type == "regular": return 0.05
        elif customer_type == "vip":   return 0.10
        # Adding "premium" requires modifying this class!

# ✅ CORRECT — extend without modifying
from abc import ABC, abstractmethod

class DiscountStrategy(ABC):
    @abstractmethod
    def discount(self) -> float: ...

class RegularDiscount(DiscountStrategy):
    def discount(self): return 0.05

class VIPDiscount(DiscountStrategy):
    def discount(self): return 0.10

class PremiumDiscount(DiscountStrategy):    # NEW: just add a class
    def discount(self): return 0.20

class PriceCalculator:
    def final_price(self, price: float, strategy: DiscountStrategy) -> float:
        return price * (1 - strategy.discount())


# ── L: Liskov Substitution Principle ─────────────────────────────
# ❌ WRONG — Square IS-A Rectangle? Mathematically yes, OOP no!
class Rectangle:
    def __init__(self, w, h): self.w, self.h = w, h
    def set_width(self, w): self.w = w
    def set_height(self, h): self.h = h
    def area(self): return self.w * self.h

class Square(Rectangle):          # LSP violation!
    def set_width(self, w):        # must also set height
        self.w = self.h = w        # changes expected Rectangle behaviour
    def set_height(self, h):
        self.w = self.h = h

def test_rectangle(r: Rectangle):
    r.set_width(4)
    r.set_height(5)
    assert r.area() == 20   # fails for Square! 5*5=25 not 20

# ✅ CORRECT — separate hierarchy or use composition
class Shape(ABC):
    @abstractmethod
    def area(self) -> float: ...

class Rectangle2(Shape):
    def __init__(self, w, h): self.w, self.h = w, h
    def area(self): return self.w * self.h

class Square2(Shape):               # not a Rectangle anymore
    def __init__(self, side): self.side = side
    def area(self): return self.side ** 2


# ── I: Interface Segregation Principle ───────────────────────────
# ❌ WRONG — fat interface forces all implementers to implement all methods
class Animal(ABC):
    @abstractmethod
    def walk(self): ...
    @abstractmethod
    def swim(self): ...
    @abstractmethod
    def fly(self): ...    # not all animals fly!

# ✅ CORRECT — small, focused interfaces
class Walkable(ABC):
    @abstractmethod
    def walk(self): ...

class Swimmable(ABC):
    @abstractmethod
    def swim(self): ...

class Flyable(ABC):
    @abstractmethod
    def fly(self): ...

class Duck(Walkable, Swimmable, Flyable):
    def walk(self): return "Duck walks"
    def swim(self): return "Duck swims"
    def fly(self):  return "Duck flies"

class Dog(Walkable, Swimmable):    # no fly — doesn't need to implement it
    def walk(self): return "Dog walks"
    def swim(self): return "Dog swims"


# ── D: Dependency Inversion Principle ────────────────────────────
# ❌ WRONG — high-level module depends on low-level concrete class
class MySQLDatabase:
    def save(self, data): print(f"MySQL: saving {data}")

class UserServiceBad:
    def __init__(self):
        self.db = MySQLDatabase()   # tightly coupled to MySQL!
    def create_user(self, name):
        self.db.save({"name": name})

# ✅ CORRECT — depend on abstraction, inject concrete implementation
class Database(ABC):
    @abstractmethod
    def save(self, data: dict) -> None: ...

class MySQLDB(Database):
    def save(self, data): print(f"MySQL: {data}")

class MongoDB(Database):
    def save(self, data): print(f"MongoDB: {data}")

class UserServiceGood:
    def __init__(self, db: Database):    # injected abstraction
        self.db = db

    def create_user(self, name: str) -> None:
        self.db.save({"name": name})

# Easy to test with a mock:
class MockDB(Database):
    def __init__(self): self.saved = []
    def save(self, data): self.saved.append(data)

mock = MockDB()
service = UserServiceGood(mock)
service.create_user("Alice")
assert mock.saved == [{"name": "Alice"}]   # testable!
```

### 🎯 Interview Q&A

> **Q: Explain SOLID principles and why they matter.**  
> **A:** **S (SRP)** — one class, one reason to change. Prevents bloated classes that are hard to test and maintain. **O (OCP)** — add new features by adding new classes, not modifying existing ones. Prevents breaking existing code when adding features. **L (LSP)** — subclasses must behave correctly when used as their parent type. Prevents subtle bugs from IS-A relationships that don't hold behaviourally. **I (ISP)** — don't force classes to implement methods they don't need. Prevents empty/stub implementations and unnecessary coupling. **D (DIP)** — depend on abstractions (interfaces/ABCs), not concrete implementations. Enables loose coupling, testability (mock the abstraction), and flexibility to swap implementations.

> **Q: How does Dependency Injection relate to the Dependency Inversion Principle?**  
> **A:** **DIP** is the principle: high-level modules should depend on abstractions, not concretions. **Dependency Injection (DI)** is the technique that implements it: instead of a class creating its dependencies (`self.db = MySQLDatabase()`), the dependencies are **passed in** from outside (constructor injection, method injection, or property injection). This means the class depends on the `Database` abstraction, and the concrete `MySQLDatabase` or `MockDatabase` is provided by the caller. Benefits: (1) **Testability** — inject a mock in tests; (2) **Flexibility** — swap implementations without modifying the class; (3) **Explicit dependencies** — no hidden coupling.

> **Q: What is the Liskov Substitution Principle? Give a Python example of a violation.**  
> **A:** LSP states that objects of a superclass should be replaceable with objects of a subclass without breaking the program's correctness — a subclass must honour the parent class's **contract** (preconditions, postconditions, invariants). Classic violation: `Square extends Rectangle`. A `Rectangle` contract: you can independently set width and height; area = w × h. A `Square` must keep width == height, so setting width also changes height — violating the Rectangle contract. Code that works with `Rectangle` (like `test_rectangle`) breaks with `Square`. Fix: don't use inheritance here; use a separate `Shape` hierarchy or composition.

---

## 🧠 Quick Revision — All 4 Topics

### CN One-Liners
```
OSI 7 layers: Physical → Data Link → Network → Transport → Session → Presentation → Application
TCP: reliable, ordered, 3-way handshake | UDP: fast, unreliable, connectionless
HTTP methods: GET(safe+idempotent), POST(neither), PUT(idempotent), DELETE(idempotent)
DNS: domain → IP | DHCP: auto-assigns IP | ARP: IP → MAC (within LAN)
HTTP 401: not authenticated | 403: authenticated, no permission
TLS: asymmetric for key exchange → symmetric for data | Certificate proves server identity
CDN: edge servers cache content near users | Load balancer: distributes traffic
WebSocket: full-duplex persistent | REST: stateless request-response
```

### DBMS One-Liners
```
ACID: Atomicity, Consistency, Isolation, Durability
Isolation levels: READ UNCOMMITTED < READ COMMITTED < REPEATABLE READ < SERIALIZABLE
Anomalies: dirty read → non-repeatable read → phantom read (solved by higher isolation)
B+ Tree: all data at leaves, linked leaf list → efficient range queries
Clustered index: data physically sorted by PK (one per table)
Non-clustered: separate structure, points back to clustered index (many per table)
Normalisation: 1NF(atomic) → 2NF(no partial dep) → 3NF(no transitive dep)
MVCC: readers never block writers → high concurrency | Used by PostgreSQL, InnoDB
CAP: distributed system can only guarantee 2 of 3: Consistency, Availability, Partition tolerance
```

### OS One-Liners
```
Process: own memory space | Thread: shared memory, cheaper context switch
PCB: stores PID, state, PC, registers, memory info, file descriptors
Deadlock conditions: mutual exclusion + hold & wait + no preemption + circular wait
Mutex: binary lock with ownership | Semaphore: counter, no ownership
Virtual memory: each process gets isolated address space via page tables
Page fault: page not in RAM → OS loads from disk → restarts instruction
TLB: hardware cache for virtual→physical address translations
Thrashing: more time swapping pages than executing → reduce multiprogramming
FCFS: convoy effect | SJF: optimal avg wait, starvation risk | RR: fair, no starvation
```

### OOPs One-Liners
```
4 pillars: Encapsulation, Abstraction, Inheritance, Polymorphism
self: reference to current instance; not a keyword; passed automatically
__repr__: for developers (unambiguous) | __str__: for users (readable)
@property: getter/setter with attribute syntax + validation
@classmethod: receives cls → alternative constructors | @staticmethod: no self/cls → utility
MRO: C3 linearisation → D→B→C→A (Diamond solved, each class visited once)
super(): follows MRO, not just direct parent → essential for cooperative multiple inheritance
Composition over inheritance: HAS-A more flexible than IS-A
SOLID: SRP, OCP, LSP, ISP, DIP
Dependency injection: pass dependencies from outside → testable, flexible
```

---

*📌 These notes cover 95% of CN, DBMS, OS, and OOPs questions asked in FAANG and product company interviews.*  
*⭐ Combine with the Python DSA notes for complete technical interview preparation.*
