# dtconf

**WARNING**: This code is currently under heavy development and not reccomended
for use unless you are actively developing on it.

## Global TODO
- [ ] Replace any and all hard-coded paths with an envar that can be set in a
configuration file or from the commandline
- [ ] Guards for empty/null envars, missing files, dirs, etc

## ZSH Config

* Assumes [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) is installed
and located under `$HOME/oh-my-zsh`.

* After `$ZSH/custom` scripts are sourced, all `.zsh` scripts under
`$HOME/dtconf/.zshrc.d` are sourced.

* Some path hacking was required to get MINGW64 working properly using
[MSYS2](https://msys2.github.io/) in `$HOME/dtconf/.zshrc.d/01-init.zsh`

### TODO

- [ ] [Kali](kali.org) config
- [ ] [Debian](debian.org) config
- [ ] [Babun](https://github.com/babun/babun) config
- [ ] Finish zsh MSYS2 config
  - [x] Working MINGW64 config
  - [ ] Working MSYS config
  - [ ] Working MINGW32 config
- [ ] Remove [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) dependency
