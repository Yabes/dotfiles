panic() {
  local RED='\e[31m'
  local MESSAGE="${1}"

  echo -e "${RED}${MESSAGE}"
  exit 1
}

worktree_create() {
  local TARGET_BRANCH="${1}"
  local CURRENT_GIT_DIR="$(realpath $(git rev-parse --git-dir))"

  if [ -z "${TARGET_BRANCH}" ]; then
    panic "Missing target branch"
  fi

  local REPO_PATH=$(dirname "${CURRENT_GIT_DIR}")
  local REPO_NAME=$(basename "${REPO_PATH}")
  local WORKTREE_NAME="${REPO_NAME}-${TARGET_BRANCH}"

  cd "${REPO_PATH}"

  git fetch
  git worktree add "../${WORKTREE_NAME}" "${TARGET_BRANCH}"

  echo "${WORKTREE_NAME}"

  cd "../${WORKTREE_NAME}"

  cp "${REPO_PATH}/.env" .
  yarn install --immutable --immutable-cache
  yarn dlx @yarnpkg/sdks base
  yarn docker:dist
}

worktree_delete() {
  local GIT_ROOT=$(git rev-parse --show-toplevel)
  local COMMON_GIT_DIR="$(realpath $(git rev-parse --git-common-dir))"
  local CURRENT_GIT_DIR="$(realpath $(git rev-parse --git-dir))"

  if [ "${CURRENT_GIT_DIR}" == "${COMMON_GIT_DIR}" ]; then
    panic "Not in a worktree"
  fi

  local WORKTREE_PATH="$(dirname "${CURRENT_GIT_DIR}")"
  local COMMON_PATH="$(dirname "${COMMON_GIT_DIR}")"

  cd "${COMMON_PATH}"
  git worktree remove "${GIT_ROOT}"
}
