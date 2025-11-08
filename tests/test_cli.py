# tests/test_cli.py
from click.testing import CliRunner
from smugpull.cli.main import cli


def test_version():
    r = CliRunner().invoke(cli, ["version"])
    print(r.stdout)
    print(r.exception)
    assert r.exit_code == 0
