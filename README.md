<p align="center">
  <picture>
    <source
      width="512px"
      media="(prefers-color-scheme: dark)"
      srcset="assets/wordmark/wordmark+slogan-dark.svg"
    >
    <img
      width="512px"
      src="assets/wordmark/wordmark+slogan-light.svg"
    >
  </picture>
  <br>
  <a href="https://revenge-mod.github.io/">
       <picture>
           <source height="32px" media="(prefers-color-scheme: dark)" srcset="assets/logo/logo-dark.svg" />
           <img height="32px" src="assets/logo/logo-light.svg" />
       </picture>
   </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <a href="https://discord.com/invite/ddcQf3s2Uq">
       <picture>
           <source height="32px" media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/13122796/178032563-d4e084b7-244e-4358-af50-26bde6dd4996.png" />
           <img height="32px" src="https://user-images.githubusercontent.com/13122796/178032563-d4e084b7-244e-4358-af50-26bde6dd4996.png" />
       </picture>
   </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <a href="https://github.com/revenge-mod">
       <picture>
           <source height="32px" media="(prefers-color-scheme: dark)" srcset="https://i.ibb.co/dMMmCrW/Git-Hub-Mark.png" />
           <img height="32px" src="https://i.ibb.co/9wV3HGF/Git-Hub-Mark-Light.png" />
       </picture>
   </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

   </a>
</p>

# 💊 RevengeTweak

Tweak to inject [Revenge](https://github.com/revenge-mod/Revenge) into Discord. Forked [BunnyTweak](https://github.com/pyoncord/BunnyTweak), modified to match with [RevengeXposed](https://github.com/revenge-mod/Revenge-xposed) behavior. There are still slight differences between these two, and this tweak may be missing some loader features.

> [!NOTE]
> As of right now this tweak does not encompass some functionalities when running in a jailed environment with a wildcard certificate \
> If you value these features sign the application with a local dev certificate:
> - setAlternateAppIcon does not work, thus breaking dynamic app icons
> - sharing files to the application/selecting items via the Files app does not work

## 🔽 Installation

Builds can be found in the [Releases](https://github.com/revenge-mod/revenge-tweak/releases/latest) tab.

> [!NOTE]
> Raw decrypted IPAs which are used to provide prepatched IPAs are sourced from the [Enmity](https://github.com/enmity-mod/) community. These raw decrypted IPAs are also used throughout Enmity related projects such as [enmity-mod/tweak](https://github.com/enmity-mod/tweak/) and [acquitelol/rosiecord](https://github.com/acquitelol/rosiecord).\
> All credits are attributed to the owner(s) of the raw IPAs.

### Jailbroken

1. Install the Orion runtime via your preferred package manager, by adding `https://repo.chariz.com/` to your sources, then finding `Orion Runtime`.
1. Install Revenge by downloading the appropriate Debian package (or by building your own, see [Building RevengeTweak locally](#building-revengetweak-locally)) and adding it to your package manager. Use the file ending in `arm.deb` for rootful jailbreaks, and the file ending in `arm64.deb` for rootless jailbreaks.

### Jailed

<a href="https://tinyurl.com/2jyk87mz"><img src="https://i.imgur.com/dsbDLK9.png" width="230"></a>
<a href="https://tinyurl.com/yjn8fpp3"><img src="https://i.imgur.com/46qhEAv.png" width="230"></a>

> [!NOTE]
> TrollStore may display an encryption warning, which you can disregard.

1. Download and install [Revenge.ipa](https://github.com/revenge-mod/revenge-tweak/releases/latest/download/Revenge.ipa) using your preferred sideloading method.

## 🛠️ Building RevengeTweak locally

> [!NOTE]
> These steps assume you use MacOS.

1. Install Xcode from the App Store. If you've previously installed the `Command Line Utilities` package, you will need to run `sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer` to make sure you're using the Xcode tools instead.

> If you want to revert the `xcode-select` change, run `sudo xcode-select -switch /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk`

2. Install the required dependencies. You can do this by running `brew install make ldid` in your terminal. If you do not have brew installed, follow the instructions [here](https://brew.sh/).

3. Setup your path accordingly. We recommend you run the following before running the next commands, as well as any time you want to build RevengeTweak.

```bash
export PATH="$(brew --prefix make)/libexec/gnubin:$PATH"
# feel free to set whatever path you want, but it needs to be a direct path, without relative parts
export THEOS="/Users/vendetta/IPA/theos"
```

4. Setup [theos](https://theos.dev/docs/installation-macos) by running the script provided by theos.

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/theos/theos/master/bin/install-theos)"
```

If you've already installed theos, you can run `$THEOS/bin/update-theos` to make sure it's up to date.

5. Clone this repository with `git clone git@github.com:revenge-mod/RevengeTweak.git` and `cd` into it. Replace the URL with your fork if you've forked this repository.

6. To build RevengeTweak, you can run `rm -rf packages && make clean && make package FINALPACKAGE=1 && make package FINALPACKAGE=1 THEOS_PACKAGE_SCHEME=rootless`. The first command will remove any previous packages, the second will clean the project, the third will build the rootful package (which is denoted by the `arm.deb` ending), and the fourth will build the rootless package (which is denoted by the `arm64.deb` ending).

The first time you run this, it might take a bit longer, but subsequent builds should be much faster.

The resulting `.deb` files will be in the `packages` folder. As a reminder, `*arm.deb` is for rootful jailbreaks and sideloading, and `*arm64.deb` is for rootless jailbreaks.

## 📙 Contributing

If you want to contribute, you will basically need to follow the steps for [Building RevengeTweak locally](#building-revengetweak-locally), as well as run `make spm` for the Swift LSP to work.

<!-- @vladdy was here, battling all these steps so you don't have to. Have fun! :3 -->
<!-- @castdrian also was here simplifying these steps immensely -->
