#!/bin/bash

# 도커 이미지 버전 인자 확인
if [ -z "$1" ]; then
  echo "❌ 이미지 버전을 인자로 전달해주세요."
  echo "사용법: $0 <버전>"
  exit 1
fi
IMAGE_VERSION="$1"

# 현재 작업 디렉토리 저장
ORIGINAL_DIR="$(pwd)"

# 스크립트 파일 위치를 기준으로 경로 설정
SCRIPT_PATH="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
FORK_RELEASE_DIR="$SCRIPT_DIR"
PROJECT_ROOT_DIR="$(dirname "$FORK_RELEASE_DIR")"

# 빌드 실행은 프로젝트 루트에서 수행
cd "$PROJECT_ROOT_DIR"
.venv/bin/python -m build --wheel --outdir "$FORK_RELEASE_DIR/docker/"

# Docker 이미지 빌드
cd "$FORK_RELEASE_DIR/docker"
docker build -t "jeong123wj/mitmproxy:$IMAGE_VERSION" .

# 원래 디렉토리로 복귀
cd "$ORIGINAL_DIR"
