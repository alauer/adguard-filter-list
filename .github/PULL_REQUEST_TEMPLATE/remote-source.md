## Add or document a remote/unfetchable source (special handling)

Use this template when an upstream source cannot be fetched by `hostlist-compiler` (for example: requires manual download, blocked by upstream, or is an HTML page). This covers the historical OISD case where `oisd.txt` was stored locally.

Summary: explain why the source can't be fetched automatically and how you've added or documented the workaround.

Example approaches

- Add a comment in `compile-hostlist` documenting how to fetch and save the source to `oisd.txt` (or other file) and make sure it's gitignored.
- Add an entry in `hostlist-compiler-config.json` that references a local file (not recommended for long-term but acceptable with clear PR notes).

Checklist

- [ ] Documented why the source cannot be fetched automatically and the workaround.
- [ ] If checked in locally (e.g., `oisd.txt`), added it to `.gitignore` and explained how maintainers will refresh it.
- [ ] Included exact curl/wget command or steps to fetch the source manually in your PR description.
- [ ] Ran `./compile-hostlist` locally and confirmed compilation behaves as expected with the workaround.

Manual fetch example (put in PR description):

```bash
curl -L https://big.oisd.nl/ -o oisd.txt
# or
wget -O oisd.txt https://big.oisd.nl/
```

Notes

- Prefer upstream sources that the `hostlist-compiler` can fetch directly. Use local-file workarounds only when unavoidable and document refresh cadence (e.g., monthly).
- Consider opening an issue with the upstream or the HostlistCompiler project if the source blocks automated fetches.
