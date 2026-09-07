# figures/

Image files referenced from `appendix.tex`. Copy the internship photographs here
using exactly these filenames (lowercase, `.jpg`):

| Filename | Photograph |
|---|---|
| `fig01-epso-top-pallets.jpg` | Stacked pallets of EPSO Top 25 kg bags inside the greenhouse, ICL pallets on the left |
| `fig02-fertilizer-store.jpg` | Store next to the fertigation plant: SOLUMOP pallets, calcium chloride flakes (E509), sand filters, forklift in the foreground |
| `fig03-icl-novapeak-mkp.jpg` | Close-up of ICL NOVAPeak mono potassium phosphate 0-52-34 bags |
| `fig04-eurosolids-sop-pallet.jpg` | Full pallet of Eurosolids potassium sulphate (SOP), empty pallet leaning above it |
| `fig05-eurosolids-sop-closeup.jpg` | Close-up of the Eurosolids SOP bag labelling (25 kg / 55 lbs) |

Plus the scanned declaration, included from `declaration.tex` (Appendix B):

| Filename | Content |
|---|---|
| `declaration-signed.jpg` | Signed and stamped Internship Leader's Declaration — **not tracked in git** |

`declaration-signed.jpg` is listed in `.gitignore` because this repository is
public and the form carries a handwritten signature, the company stamp (with
tax and registration numbers) and the awarded grade. Keep your local copy at
that exact path and Appendix B builds normally; without it the document still
compiles, showing a placeholder note in place of the form.

Notes:

- All five are portrait-orientation phone photos and are typeset at
  `0.52\textwidth` (the two SOP shots side by side at `0.46\textwidth`), which
  suits a 3:4 aspect ratio on A4.
- If a file is renamed, update the matching `\includegraphics` in
  `appendix.tex`.
- `pdflatex` reads `.jpg` directly — no conversion needed. If the phone produced
  `.heic`, convert to JPEG first.
