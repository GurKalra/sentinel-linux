import tomllib
from pathlib import Path

CONFIG_PATHS = [
    Path("sentinel.toml"), #Local dev folder
    Path("/etc/sentinel/sentinel.toml")  # System-wide install
]

def load_config():
    """Reads the TOML schema. Fallback to empty if missing."""
    for path in CONFIG_PATHS:
        if path.exists():
            try:
                with open(path, "rb") as f:
                    return tomllib.load(f)
            except Exception:
                continue
    return {"triggers": {"high_risk" : {}, "medium_risk": {}}}

CONFIG = load_config() 