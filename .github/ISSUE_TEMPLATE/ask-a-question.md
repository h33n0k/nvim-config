---
name: Ask a Question
about: Ask a question about how to use or configure specific elements in this Neovim configuration.
title: '[Question]: '
labels: question
assignees: ''

body:
  - type: input
    id: question_summary
    attributes:
      label: Question Summary
      placeholder: Enter a short summary...

  - type: textarea
    id: question_details
    attributes:
      label: Detailed Description
      placeholder: Describe your question here...

  - type: textarea
    id: system_info
    attributes:
      label: System Information
      placeholder: Include system info here...
      optional: true
---

# Thank you for reaching out! Please provide as much detail as possible to help me answer your question effectively.

## Question Summary:
Briefly summarize your question (e.g., "How do I enable XYZ feature?").

## Detailed Description:
Provide details about your question, including:
- What you're trying to achieve.
- Any errors or issues you've encountered.
- Relevant code snippets, settings, or steps you've tried.

## System Information:
Share your Neovim version, OS, and other relevant details. You can use `:checkhealth` for detailed diagnostics.
