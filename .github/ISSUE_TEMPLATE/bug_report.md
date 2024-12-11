---
name: Bug Report
about: Report a problem with this Neovim configuration.
title: '[Bug]: '
labels: bug
assignees: ''

body:
  - type: input
    id: bug_summary
    attributes:
      label: Bug Summary
      placeholder: Enter a short summary...

  - type: textarea
    id: bug_description
    attributes:
      label: Bug Summary
      placeholder: Describe the bug and how to reproduce it...

  - type: textarea
    id: reproduction_steps
    attributes:
      label: Steps to Reproduce
      placeholder: List reproduction steps here...

  - type: textarea
    id: error_logs
    attributes:
      label: Error Logs or Output
      placeholder: Paste error logs here...
      optional: true

  - type: textarea
    id: system_info
    attributes:
      label: System Information
      placeholder: Include system info here...

  - type: textarea
    id: additional_context
    attributes:
      label: Additional Context
      placeholder: Add additional context here...
      optional: true
---

# Thank you for reporting an issue! Please fill out the information below to help me diagnose and fix the problem.

## Bug Summary
Briefly summarize the bug (e.g., "Error when opening files with Telescope").

## Detailed Description
Provide a clear and detailed description of the bug, including:
- What you expected to happen.
- What actually happened.
- Any steps to reproduce the bug.

## Steps to Reproduce
List the steps to reproduce the issue (e.g., "1. Open Neovim. 2. Run :Telescope find_files").

## Error Logs or Output
Include any relevant logs, error messages, or output (e.g., logs from `:messages` or errors in the terminal). You can also attach screenshots if helpful.

## System Information
Share your Neovim version, OS, and other relevant details. You can use `:checkhealth` for detailed diagnostics.

## Additional Context
Add any other context about the problem here, such as configuration files or related plugins that might affect the issue.
