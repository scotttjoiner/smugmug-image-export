# src/smugpull/cli/main.py
import importlib.metadata as md
import click


@click.group(help="SmugMug bulk downloader")
def cli():  # group root
    pass


@cli.command("version")
def version_cmd():
    try:
        v = md.version("download-smugmug")
    except md.PackageNotFoundError:
        v = "0.1.0"
    click.echo(v)


if __name__ == "__main__":
    cli()
