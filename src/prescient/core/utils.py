import shutil

def detect_package_manager() -> str | None:
    """
    Globally detects the active package manager on the host system.
    Shared by the hooks installer and the heuristic engine.
    """
    if shutil.which ("apt"):
        return "apt"
    elif shutil.which("pacman"):
        return "pacman"
    return None