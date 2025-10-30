## Add a new source to the combined AdGuard hostlist

Use this template when adding a new upstream source to `hostlist-compiler-config.json`.

Summary: briefly describe the source, its purpose and origin.

Example entry (copy and adapt):

```json
{
  "name": "Example List Name",
  "source": "https://example.com/path/to/list.txt",
  "type": "adblock",
  "transformations": [
    "RemoveComments",
    "Compress",
    "Validate"
  ]
}
```

Checklist

- [ ] I added the new entry to `hostlist-compiler-config.json` under the top-level `sources` array.
- [ ] The `type` is `adblock` (this project expects AdGuard-style adblock rules).
- [ ] I kept transformations consistent with existing entries (RemoveComments, Compress, Validate) unless there's a strong reason.
- [ ] I validated the source URL by fetching it locally and confirmed it returns plaintext (or noted why it doesn't).

Validation steps (local)

1. Install the compiler if needed:

```bash
npm i -g @adguard/hostlist-compiler@v1.0.39
```

2. Run the compile script and inspect output for obvious problems:

```bash
./compile-hostlist
less blocklist
```

3. If the source requires special handling (e.g., OISD), note that in your PR and include `oisd.txt` or the workaround.

CI notes

- The repository's CI runs `./compile-hostlist` inside the devcontainer and will upload the `blocklist` artifact. If your change causes CI to fail, check the `hostlist-compiler` logs for the failing source and adjust transformations or the source URL accordingly.

Rationale and notes

- Add a short explanation why this source is useful and any known caveats (long lines, non-DNS rules, whitelists).

Optional: If you want, include a short sample of the first 10 lines of the source file in your PR description to help reviewers.
