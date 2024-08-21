#!/usr/bin/env python3
# coding: utf-8

from argparse import ArgumentParser

def check(letters):
  # Check letters dimensions.
  for letter, ascii in letters.items():

    # First check height.
    assert len(ascii) == 3, (
      f'Letter "{letter}" is not 3 characters high.'
    )

    # Then check width.
    assert len(set(map(len, ascii))) == 1, (
      f'Letter "{letter}" is not even.'
    )

  return letters

# Taken and enhanced from:
# https://patorjk.com/software/taag/#p=display&f=Calvin%20S
letters = check({

  "a": [
    "┌─┐",
    "├─┤",
    "┴ ┴",
  ],

  "A": [
    "╔═╗",
    "╠═╣",
    "╩ ╩",
  ],

  "b": [
    "┌┐ ",
    "├┴┐",
    "└─┘",
  ],

  "B": [
    "╔╗ ",
    "╠╩╗",
    "╚═╝",
  ],

  "c": [
    "┌─┐",
    "│  ",
    "└─┘",
  ],

  "C": [
    "╔═╗",
    "║  ",
    "╚═╝",
  ],

  "d": [
    "┌┬┐",
    " ││",
    "╶┴┘",
  ],

  "D": [
    "╔╦╗",
    " ║║",
    "═╩╝",
  ],

  "e": [
    "┌─┐",
    "├┤ ",
    "└─┘",
  ],

  "E": [
    "╔═╗",
    "║╣ ",
    "╚═╝",
  ],

  "f": [
    "┌─┐",
    "├┤ ",
    "└  ",
  ],

  "F": [
    "╔═╗",
    "╠╣ ",
    "╚  ",
  ],

  "g": [
    "┌─┐",
    "│ ┬",
    "└─┘",
  ],

  "G": [
    "╔═╗",
    "║ ╦",
    "╚═╝",
  ],

  "h": [
    "┬ ┬",
    "├─┤",
    "┴ ┴",
  ],

  "H": [
    "╦ ╦",
    "╠═╣",
    "╩ ╩",
  ],

  "i": [
    "┬",
    "│",
    "┴",
  ],

  "I": [
    "╦",
    "║",
    "╩",
  ],

  "j": [
    " ┬",
    " │",
    "└┘",
  ],

  "J": [
    " ╦",
    " ║",
    "╚╝",
  ],

  "k": [
    "┬┌─",
    "├┴┐",
    "┴ ┴",
  ],

  "K": [
    "╦╔═",
    "╠╩╗",
    "╩ ╩",
  ],

  "l": [
    "┬  ",
    "│  ",
    "┴─┘",
  ],

  "L": [
    "╦  ",
    "║  ",
    "╩═╝",
  ],

  "m": [
    "┌┬┐",
    "│││",
    "┴ ┴",
  ],

  "M": [
    "╔╦╗",
    "║║║",
    "╩ ╩",
  ],

  "n": [
    "┌┐┌",
    "│││",
    "┘└┘",
  ],

  "N": [
    "╔╗╔",
    "║║║",
    "╝╚╝",
  ],

  "o": [
    "┌─┐", # "┌┬┐", "┌┬┐", "┌┬┐",
    "│ │", # "│ │", "│└┤", "│└┼",
    "└─┘", # "└─┘", "└─┘", "└─┘",
  ],

  "O": [
    "╔═╗",
    "║ ║",
    "╚═╝",
  ],

  "p": [
    "┌─┐",
    "├─┘",
    "┴  ",
  ],

  "P": [
    "╔═╗",
    "╠═╝",
    "╩  ",
  ],

  "q": [
    "┌─┐ ",
    "│─┼┐",
    "└─┘└",
  ],

  "Q": [
    "╔═╗ ",
    "║═╬╗",
    "╚═╝╚",
  ],

  "r": [
    "┬─┐",
    "├┬┘",
    "┴└─",
  ],

  "R": [
    "╦═╗",
    "╠╦╝",
    "╩╚═",
  ],

  "s": [
    "┌─┐",
    "└─┐",
    "└─┘",
  ],

  "S": [
    "╔═╗",
    "╚═╗",
    "╚═╝",
  ],

  "t": [
    "┌┬┐",
    " │ ",
    " ┴ ",
  ],

  "T": [
    "╔╦╗",
    " ║ ",
    " ╩ ",
  ],

  "u": [
    "┬ ┬",
    "│ │",
    "└─┘",
  ],

  "U": [
    "╦ ╦",
    "║ ║",
    "╚═╝",
  ],

  "v": [
    "┬ ┬", # "┬  ┬",
    "│┌┘", # "└┐┌┘",
    "└┘ ", # " └┘ ",
  ],

  "V": [
    "╦ ╦", # "╦  ╦",
    "║╔╝", # "╚╗╔╝",
    "╚╝ ", # " ╚╝ ",
  ],

  "w": [
    "┬ ┬",
    "│││",
    "└┴┘",
  ],

  "W": [
    "╦ ╦",
    "║║║",
    "╚╩╝",
  ],

  "x": [
    "─┐┬", # "─┐ ┬",
    "┌┼┘", # "┌┴┬┘",
    "┴└─", # "┴ └─",
  ],

  "X": [
    "═╗╦", # "═╗ ╦",
    "╔╬╝", # "╔╩╦╝",
    "╩╚═", # "╩ ╚═",
  ],

  "y": [
    "┬ ┬",
    "└┬┘",
    " ┴ ",
  ],

  "Y": [
    "╦ ╦",
    "╚╦╝",
    " ╩ ",
  ],

  "z": [
    "┌─┐",
    "┌─┘",
    "└─┘",
  ],

  "Z": [
    "╔═╗",
    "╔═╝",
    "╚═╝",
  ],

  "0": [
    "┌─┐",
    "│╱│",
    "└─┘",
  ],

  "1": [
    "╶┐ ",
    " │ ",
    "╶┴╴",
  ],

  "2": [
    "┌─┐",
    "┌─┘",
    "└─╴",
  ],

  "3": [
    "┌─┐", # "╶─┐",
    " ─┤", # " ─┤",
    "└─┘", # "╶─┘",
  ],

  "4": [
    "╷ ╷", # "┬ ┬",
    "└─┤", # "└─┤",
    "  ╵", # "  ┴",
  ],

  "5": [
    "┌─╴",
    "└─┐",
    "└─┘",
  ],

  "6": [
    "┌─╴",
    "├─┐",
    "└─┘",
  ],

  "7": [
    "╶─┐",
    " ┌┘",
    " ╵ ",
  ],

  "8": [
    "┌─┐",
    "├─┤",
    "└─┘",
  ],

  "9": [
    "┌─┐",
    "└─┤",
    "╶─┘",
  ],

  " ": [
    "  ",
    "  ",
    "  ",
  ],

  "?": [
    "┌─┐",
    " ┌┘",
    " o ",
  ],

  "-": [
    "  ",
    "──",
    "  ",
  ],

})

"""

@
[
\  '\\'
]
{
|
}
^
_
SPACE
!
"
#
$
%
&
'
(
)
*
+
,
-
.
/
:
;
<
=
>
?
`
~

┌─┐
│└┘
└──

┌─
│
└─

─┐
 │
─┘

/\

────

╔═╗╔═╗╔═╗╔═╗╔═╗
╚═╗╠═╝╠═╣║  ║╣
╚═╝╩  ╩ ╩╚═╝╚═╝

┬
│
o

─┼─┼─
─┼─┼─

┌┼┐
└┼┐
└┼┘

O ┌─
 ┌┘
─┘ O  moitié

O┌
┌┘
┘O

O┬
┌┘
┴O

 ┬
┌┼─
└┘

\│/
─ ─
/│\

┘

───

o

"""

comments = {
  "c": "//",
  "cpp": "//",
  "js": "//",
  "py": "#",
  "sh": "#",
  "sql": "--",
  "ts": "//",
}

if __name__ == "__main__":
  parser = ArgumentParser()

  # Comment style.
  parser.add_argument(
    "-c", "--comment",
    required = False,
    # choices = comments.keys(),
    type = lambda comment: comments.get(comment, comment),
    help = (
      "Prefix each line with the given comment style or as it is. "
      f"Supported comment style: {', '.join(comments.keys())}."
    ),
  )

  # Text to convert.
  parser.add_argument(
    "text",
    nargs = "*",
    metavar = "TEXT",
    help = "Text to convert to ASCII."
  )

  # Allow positional and keyword arguments to be mixed.
  arguments = parser.parse_intermixed_args()

  # Compute the actual text by merging all positional arguments.
  text = " ".join(arguments.text).strip()
  if text:

    # Loop through the 3 characters line.
    for line in range(0, 3):

      # Print comment.
      if arguments.comment:
        print(arguments.comment, "", end = "")

      # Print letter lines.
      for letter in text:
        if letter in letters or (letter := "?") in letters:
          print(letters[letter][line], end = "")

      # Print a new line
      print()
