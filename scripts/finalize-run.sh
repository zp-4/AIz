#!/usr/bin/env bash
set -euo pipefail
RUN="${1:?usage: finalize-run.sh RUN-ID}"
DIR="notebook/runs/$RUN"
[ -d "$DIR" ] || { echo "missing $DIR" >&2; exit 1; }
[ -f "$DIR/TEST_REPORT.md" ] || { echo "missing TEST_REPORT.md" >&2; exit 1; }
python3 - "$DIR" <<'PY'
import json,sys,datetime,hashlib,pathlib
p=pathlib.Path(sys.argv[1])
m=json.loads((p/'manifest.json').read_text())
r=json.loads((p/'result.json').read_text())
proto=m.get('protocol_id')
if proto and proto != 'UNSPECIFIED':
    pp=pathlib.Path('notebook/protocols')/(proto+'.md')
    if not pp.exists():
        raise SystemExit(f'protocol referenced by run does not exist: {pp}')
status=r.get('status')
if status not in {'valid','invalid','failed'}:
    raise SystemExit('result status must be valid, invalid, or failed before finalization')
if status == 'invalid' and not r.get('invalid_reason'):
    raise SystemExit('invalid run requires invalid_reason')
gates=r.get('hard_gates') or {}
if status == 'valid' and gates.get('pass') is not True:
    raise SystemExit('valid run requires hard_gates.pass=true')
if r.get('production_ready') is True and not (status == 'valid' and gates.get('pass') is True):
    raise SystemExit('production_ready=true requires a valid run with hard gate pass')
m['status']=status
m['ended_at']=datetime.datetime.now().astimezone().isoformat()
(p/'manifest.json').write_text(json.dumps(m,indent=2)+"\n")
lines=[]
for f in sorted(p.rglob('*')):
    if f.is_file() and f.name != 'SHA256SUMS':
        h=hashlib.sha256(f.read_bytes()).hexdigest()
        lines.append(f"{h}  {f.relative_to(p)}")
(p/'SHA256SUMS').write_text("\n".join(lines)+"\n")
PY
printf '%s\n' "$DIR/SHA256SUMS"
