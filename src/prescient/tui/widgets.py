import math
from textual.widgets import Static
from textual.reactive import reactive

class DuneWave(Static):
    """
    A dynamic ASCII sine wave animation.
    """
    offset = reactive(0.0)

    def on_mount(self) -> None:
        """
        Fires when the widget is added to the screen.
        """
        self.set_interval(1/12, self.tick)
    
    def tick(self) -> None:
        """
        Moves the wave forward.
        """
        self.offset += 0.35
    
    def render(self) -> str:
        """
        Draws the actual characters to the terminal.
        """
        width = self.size.width
        height = self.size.height

        if width < 10 or height < 3:
            return "[dim]__[/dim]"
        
        amplitude = -4
        frequency = 0.3
        center_y = height // 2

        lines = [[" " for _ in range(width)] for _ in range(height)]

        # Splitting the wave into three for better look
        # Main wave
        for x in range(width):
            y = int(center_y + amplitude * math.sin((frequency * x) + self.offset))
            if 0 <= y < height:
                lines[y][x] = "_"
        
        # Secondary ridge
        for x in range(width):
            y = int(center_y + 2 + (amplitude * 0.6) * math.sin((frequency * x) + self.offset + 2.0))
            if 0 <= y < height:
                lines[y][x] = "_"
        
        # Background dune
        for x in range(width):
            y = int(center_y + 4 + (amplitude * 0.3) * math.sin((frequency * x) + self.offset + 4.0))
            if 0 <= y < height:
                lines[y][x] = "_"
        
        wave_string = "\n".join("".join(line) for line in lines)
        return f"[dim cyan]{wave_string}[/dim cyan]"
