// Control of trailing comments.
//! AlignTrailingComments: false

int a; // comment
int ab; // comment

int abc; // comment
int abcd; // comment

{
  int a; // all these

  int ab; // comments are

  int abcdef; // aligned
}
