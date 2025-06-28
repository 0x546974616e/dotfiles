// Style of aligning consecutive short case labels. Only applies if
// AllowShortCaseExpressionOnASingleLine or AllowShortCaseLabelsOnASingleLine
// is true.
//! AlignConsecutiveShortCaseStatements:
//!   Enabled: false
//!   AcrossEmptyLines: false
//!   AcrossComments: false
//!   AlignCaseArrows: false
//!   AlignCaseColons: false

switch (level) {
case log::info:
  return "info:";
case log::warning:
  return "warning:";
default:
  return "";
}

switch (level) {
case log::info:
  return "info:";
case log::warning:
  return "warning:";

default:
  return "";
}

switch (level) {
case log::info:
  return "info:";
case log::warning:
  return "warning:";
/* A comment. */
default:
  return "";
}
