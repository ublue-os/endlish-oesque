# endlish-oesque 

[![release-please](https://github.com/ublue-os/endlish-oesque/actions/workflows/release-please.yml/badge.svg)](https://github.com/ublue-os/endlish-oesque/actions/workflows/release-please.yml)

An Endless-OS-Esque prototype image to see how far we can get.

# Usage

This is **highly experimental** and only intended as a prototype—I wouldn't recommend using it in production at all. 

## For existing Silverblue/Kinoite users

### Prepare

1. Ensure you're not using any overlays, as it could cause problems—you can add them back later if you choose:

   ```shell
   rpm-ostree reset
   ```

2. Install all available OS updates:

   ```shell
   rpm-ostree upgrade
   ```

3. Restart your computer to ensure you're running the latest updates

4. Pin the working deployment so you can safely rollback ([more info](https://docs.fedoraproject.org/en-US/fedora-silverblue/faq/#_about_using_silverblue)):

   ```shell
   sudo ostree admin pin 0
   ```

### Rebase

1. Run the following in a terminal, based on which type of GPU you use:

   <details>
     <summary>AMD/Intel</summary>
     <pre><code>sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/endlish-oesque:38</code></pre>
   </details>

   <details>
     <summary>NVIDIA</summary>
     <pre><code>sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/endlish-oesque-nvidia:38</code></pre>
   </details>
        
2. Restart your computer

### Install extensions

This image comes with some GNOME extensions to tailor the desktop experience. For now, **you must manually install them (https://github.com/ublue-os/beyond/issues/74)**.

1. Open Console and run:

   ```shell
   just install-endlish-oesque-extensions
   ```

2. Log out and back in (or restart your computer) to ensure the extensions are running

### To revert back to Silverblue

```shell
sudo rpm-ostree rebase fedora:fedora/38/x86_64/silverblue
```

## Verification

These images are signed with sigstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

```shell
cosign verify --key cosign.pub ghcr.io/ublue-os/endlish-oesque
```
