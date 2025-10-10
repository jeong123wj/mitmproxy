# mitmproxy

[![GitHub Release](https://img.shields.io/github/v/release/jeong123wj/mitmproxy)](https://github.com/jeong123wj/mitmproxy/releases)

This project is a fork of [mitmproxy](https://github.com/mitmproxy/mitmproxy), an interactive TLS-capable intercepting proxy for HTTP/1, HTTP/2, and WebSockets. Unlike the upstream project, this fork focuses on **mitmweb**, the web-based interface for mitmproxy. It introduces additional features and improvements tailored for specific use cases.

## ✨ Features

### JSON Unicode Output Option

New options `--ensure-ascii` and `--no-ensure-ascii` have been added to control how Unicode characters are displayed in JSON output.

- `--ensure-ascii` (default): Non-ASCII characters are escaped as \uXXXX sequences.

- `--no-ensure-ascii`: Unicode characters are preserved and displayed as-is.

### JSON Body Pretty-Print in HttpMessage Editor

- In edit mode, if the `Content-Type` header indicates JSON, the body is automatically pretty-printed.

## 🐳 Running with Docker

You can run this fork of mitmproxy directly inside a Docker container, making it easy to set up without installing local dependencies.

```bash
# Pull from Docker Hub
docker pull jeong123wj/mitmproxy

# Run mitmweb inside a container
# Port 8080: proxy traffic
# Port 8081: web interface
docker run -dt --name mitmweb -p 8080:8080 -p 127.0.0.1:8081:8081 jeong123wj/mitmproxy

# Check the logs to get the authentication token
docker logs mitmweb
```

After running the container, check the logs to find the authentication token. You'll see output like:

```
Web server listening at http://0.0.0.0:8081/?token=<token>
```

Since the container's port 8081 is mapped to your host's port 8081, copy the token from the logs and access the mitmweb UI at:

```
http://localhost:8081/?token=<token>
```

## 🚀 Installation & Development

### Prerequisites

- Python 3.12+
- uv

### Optional Tools

- npm (for frontend development)
- Docker (for containerized deployment)

### Installation

```bash
# Clone repository
git clone https://github.com/jeong123wj/mitmproxy.git
cd mitmproxy

# Run mitmweb
uv run mitmweb
```

### Frontend Development

```bash
# Install web dependencies
cd web
npm install

# Run development server
npm run start

# Build for production
npm run build
```

## 📜 License

This fork follows the same license as upstream mitmproxy (MIT). See [LICENSE](LICENSE) for details.

## 🙏 Acknowledgements

Thanks to the [mitmproxy](https://github.com/mitmproxy/mitmproxy) maintainers and community.
