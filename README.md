# homebrew-tools

Personal Homebrew tap for custom formulas.

## Installation

```sh
brew tap mattmc3/brews
brew install prj
brew install pather
```

## Updating Formulas

Formulas are kept current by [brew-bumper](https://github.com/mattmc3/brew-bumper), which reads the
`homepage` field to find the upstream repo, resolves the newest tag, downloads the artifact and
rewrites the `url` and `sha256`.

### GitHub Actions

The **Update Formulas** workflow runs nightly. To trigger it by hand:

1. Go to the **Actions** tab in this repository
2. Select **Update Formulas** workflow
3. Click **Run workflow**
4. Options:
   - Leave formula field empty to update all formulas
   - Or enter a specific formula name like `prj`
   - Optionally specify a version tag to update to a new release

### Local

brew-bumper also runs as a plain CLI:

```sh
# Update all formulas to latest tags
brew_bumper.rb

# Update specific formula to latest tag
brew_bumper.rb prj

# Update formula to a specific version
brew_bumper.rb prj v1.0.2

# Preview without writing
brew_bumper.rb --dry-run
```

### Manual

Calculate SHA256 manually:

```sh
# Extract URL from formula and calculate SHA256
URL=$(grep 'url "' Formula/prj.rb | sed 's/.*url "\(.*\)".*/\1/')
curl -L "$URL" | shasum -a 256
```

## License

MIT License
