# 🖼️ Download-SmugMug

**Download-SmugMug** is a Python-based command-line utility for bulk downloading photos and galleries from SmugMug. It’s scaffolded as a simple CLI using **Click**, managed with **Poetry**, and operated via a **Makefile** for repeatable commands.

---

## 📁 Project Structure

```
download-smugmug/
├── pyproject.toml              # Poetry project definition
├── Makefile                    # Dev shortcuts (install, test, run)
├── src/
│   └── img_pull/
│       ├── __init__.py
│       └── cli/
│           ├── __init__.py
│           └── main.py         # CLI entrypoint (Click app)
└── tests/
    └── test_cli.py             # Basic CLI smoke tests
```

---

## ⚡ Quick Start (Makefile-driven)

> Prereqs: Python 3.12+ and Poetry.

```bash
# 1) Install dependencies (incl. dev tools)
make init

# 2) Install pre-commit hooks (optional locally; enforced in CI)
make hooks

# 3) Run tests
make test

# 4) See CLI help
make run
```

---

## 🧪 Common Tasks

```bash
make fmt          # format with black
make lint         # lint with flake8
make test         # run pytest
make build        # poetry build (sdist/wheel)
make clean        # remove caches and build artifacts
make requirements # export requirements.txt (for non-Poetry envs)
```

---

## 🪝 Pre-Commit Hooks (and the VS Code/Codespaces caveat)

- We keep **pre-commit** in the Poetry *dev* group. The Git hook needs to be (re)installed so it points at the project’s `.venv`:
  ```bash
  make hooks       # internally runs: poetry run pre-commit install --install-hooks
  ```

- If you see `ModuleNotFoundError: No module named 'pre_commit'` when committing from the VS Code UI, it means VS Code is invoking the hook with a Python that doesn’t have `pre-commit`.
  - **Fix (recommended):** run `make hooks` after opening the Codespace (the hook records the venv path).
  - **Alternative:** install `pre-commit` globally in the dev container: `pipx install pre-commit && pre-commit install`.
  - **Devcontainer automation (optional):** add a `postCreateCommand` to auto-run `make init && make hooks` on container start.

---

## 🧰 Development Tips

```bash
# Activate the Poetry shell (optional)
poetry shell

# Run the CLI during development without installing as a script
python -m img_pull.cli.main version
```

Tests are src-layout-aware; imports should be `from img_pull...`, not `from src.img_pull...`

---

## 📦 Dependencies

Runtime:
- **click** — command-line framework
- **importlib.metadata** — version lookup for packaging

Dev (installed via `make init`):
- **pytest**, **pytest-cov** — testing/coverage
- **black**, **flake8** — formatting/linting
- **pre-commit** — local hooks framework

See `pyproject.toml` for exact versions.

---

## 🚀 Roadmap / TODO

### ✅ Current
- [x] Click-based CLI scaffold
- [x] Version command (`smugpull version`)
- [x] Poetry packaging
- [x] Makefile-based workflow
- [x] Basic tests

### 🧩 Short-Term
- [ ] SmugMug OAuth 1.0a auth flow
- [ ] `download` command with `--dest` and `--album ... --album ...`
- [ ] Progress display with `rich` or `tqdm`
- [ ] Unit tests for API + file I/O
- [ ] Config file support (`~/.smugpull.toml`)

### 🖥️ Future
- [ ] Optional **Textual** TUI for gallery selection and progress
- [ ] Parallel downloads + retry/backoff
- [ ] Cross-platform packaging (pipx / single-file binary)

---

## 🪪 License

MIT License © 2025 Scott Joiner
