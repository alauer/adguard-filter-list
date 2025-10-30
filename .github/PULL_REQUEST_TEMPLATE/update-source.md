## Update an existing source in hostlist-compiler-config.json

Use this template when you update the URL, name, or transformations of an existing source entry.

Summary: briefly describe what changed and why (e.g., upstream moved, improved format, broken URL).

Example change (illustrative diff):

```diff
-    {
-      "name": "Example List Name",
-      "source": "https://old.example.com/list.txt",
-      "type": "adblock",
-      "transformations": ["RemoveComments","Compress","Validate"]
-    }
+    {
+      "name": "Example List Name",
+      "source": "https://new.example.com/list.txt",
+      "type": "adblock",
+      "transformations": ["RemoveComments","Compress","Validate"]
+    }
```

Checklist

- [ ] I updated the correct entry in `hostlist-compiler-config.json` (under `sources`).
- [ ] I explained why the update is needed in the PR description (link upstream issue if available).
- [ ] I validated JSON syntax locally.
- [ ] I ran `./compile-hostlist` and inspected `blocklist` for obvious failures or unexpected long/non-DNS rules.
- [ ] If transformations changed, I explained why and showed a short before/after sample of the source output.

Validation steps (local)

```bash
npm i -g @adguard/hostlist-compiler@v1.0.39
./compile-hostlist
less blocklist
```

CI notes

- The repo runs schema checks on PRs (basic JSON + fields). If the PR modifies `hostlist-compiler-config.json`, the validate workflow may fail—fix the JSON or required fields.

Notes for reviewers

- Check the first 10–20 lines of the upstream source to ensure it uses expected rule formats (AdGuard adblock / DNS list).
- If the updated URL redirects to a different format (HTML, zipped archive, JSON), call this out and propose a transformation or removal.
