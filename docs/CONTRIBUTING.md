# Contributing

When contributing to this repository, 
please make a fork of the repo, make your changes, 
then send in a pull request (we recommend that you create apps within the app project).

### Note
In order to create an app:
* Navigate to the UserApps folder
* Create your yourApp.swift file
* Copy the example from Calculator.swift or square.swift to get an idea of formatting
* when you want to see your app in the screen, navigate to app.swift
* inside of the private func loadCustomApps() call your app by doing the command:
* apps.append(yourApp())
* Now test by building!

Side note, you should build before sending a PR, that way your PR doesn't crash the app!

## Development environment setup

To set up a development environment, please follow these steps:

1. Clone the repo

   ```sh
   git clone https://github.com/Betim-Hodza/SocialCodingIos
   ```

2. Open in XCODE

3. Connect your iphone or just use iOS emulator (on MAC)

4. Ta-da now you can start!

## Issues and feature requests

You've found a bug in the source code, a mistake in the documentation or maybe you'd like a new feature? You can help us by [submitting an issue on GitHub](https://github.com/Betim-Hodza/SocialCodingIos/issues). Before you create an issue, make sure to search the issue archive -- your issue may have already been addressed!

Please try to create bug reports that are:

- _Reproducible._ Include steps to reproduce the problem.
- _Specific._ Include as much detail as possible: which version, what environment, etc.
- _Unique._ Do not duplicate existing opened issues.
- _Scoped to a Single Bug._ One bug per report.

**Even better: Submit a pull request with a fix or new feature!**

### How to submit a Pull Request

More in depth detail:

1. Fork the project
2. Create your feature branch (`git checkout -b feat/amazing_feature`)
3. Commit your changes (`git commit -m 'feat: add amazing_feature'`) SocialCodingIos uses [conventional commits](https://www.conventionalcommits.org), so please follow the specification in your commit messages.
4. Push to the branch (`git push origin feat/amazing_feature`)
5. [Open a Pull Request](https://github.com/Betim-Hodza/SocialCodingIos/compare?expand=1)
