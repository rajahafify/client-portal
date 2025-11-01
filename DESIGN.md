
# design.md — Stacked Home (Aesthetic Spec)

## Page Anatomy

* **Top App Bar**
  Left logo, centered tabs, right notifications + avatar.
  *Tailwind:* `sticky top-0 z-40`, `border-b border-slate-200/60`, `bg-white/95 backdrop-blur`, container `max-w-7xl mx-auto px-6 lg:px-8 h-16 flex items-center justify-between`.
  *Note:* The header band sits flush beneath the top app bar; keep the first section directly attached by removing extra top padding (`pt-0`) inside the main content container.

* **Header Band**
  Title left, segmented pills center, primary button right, thin divider.
  *Tailwind:* `bg-white`, `px-6 lg:px-8 py-3`, divider `border-b border-slate-100`.

* **Stats Row**
  Four equal tiles with label, large value, small delta, soft tint.
  *Tailwind:* wrapper `grid gap-4 sm:grid-cols-2 lg:grid-cols-4`, tile `rounded-xl border border-slate-200 bg-white p-6 relative overflow-hidden`, tint `bg-gradient-to-t from-indigo-50/60 to-transparent`.

* **Activity List**
  Section title, grouped by day.
  *Tailwind:* section `mt-8`, title `px-6 lg:px-8 py-4 text-sm font-semibold text-slate-700`, group header `text-xs uppercase tracking-wide text-slate-500 px-6 lg:px-8 py-3`, rows `divide-y divide-slate-100`.

* **Cards Grid**
  Section title + “View all”. 3–4 simple cards.
  *Tailwind:* grid `mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3`, card `rounded-xl border border-slate-200 bg-white p-5`.

## Visual Language

* **Typography**
  Titles Manrope `font-semibold`; body Inter `font-normal`/`font-medium`.
  *Tailwind:* `font-sans`, sizes `text-2xl` (stats value), `text-base` (row primary), `text-sm` (body), `text-xs` (meta), `tabular-nums`.
* **Color**
  Shell `bg-slate-50`, surfaces `bg-white`.
  Accent gradient for CTAs: `bg-gradient-to-r from-indigo-500 to-indigo-600`.
  Text: titles `text-slate-900`, body `text-slate-600`.
  Deltas: positive `text-emerald-600`, negative `text-rose-600`.
  Borders `border-slate-200`, dividers `border-slate-100`.
* **Elevation & Edges**
  Hairline borders, soft radius ≤ `rounded-xl`.
  *Tailwind:* `shadow-none` or `shadow-sm/hover:shadow`, `rounded-lg rounded-xl`.

## Spacing & Rhythm

* Gutters: `px-6 lg:px-8`.
* Section spacing: `space-y-6 lg:space-y-8`.
* Stats gaps: `gap-4`.
* Row height target: `py-4` to `py-5`.

## Navigation & Filters

* Centered tabs with underline. Use this pattern for any in-page section navigation instead of inner sidebars.
  *Tailwind Tabs:* container `flex gap-6`, item `text-sm text-slate-600 hover:text-slate-900`, active `font-medium text-slate-900 border-b-2 border-slate-900 pb-3`.
* Sub navigation (Overview / Activity / etc.) should appear immediately under the header band as top-aligned tabs spanning the content width—no vertical section lists.
* Pills: one active at a time.
  *Tailwind Pills:* `inline-flex items-center gap-2 rounded-full px-3 py-1.5 text-sm border`, active `border-slate-900 text-slate-900`, inactive `border-slate-200 text-slate-600`.

## Stats Tiles

* Order: label → value → delta.
  *Tailwind:* label `text-sm text-slate-500`, value `mt-1 text-3xl font-semibold tabular-nums text-slate-900`, delta `mt-1 text-xs`, icon chip `inline-flex items-center gap-1`.

## Activity List

* **Row layout**: left value cluster, middle description, right action link + small id.
  *Tailwind:* row `px-6 lg:px-8 py-4 flex items-center gap-6`, left `min-w-[200px] flex items-center gap-3`, badge `rounded-full px-2 py-0.5 text-xs`, middle `min-w-0 grow`, right `text-sm text-indigo-600 hover:text-indigo-700`.
* **Row hover:** `hover:bg-slate-50`.

## Cards Grid

* **Card anatomy:** logo, name, meta, overflow.
  *Tailwind:* logo `size-8 rounded-lg`, name `text-sm font-medium text-slate-900`, meta `text-xs text-slate-500`, overflow `p-2 rounded-md hover:bg-slate-50`.

## Components

* **Primary Button**
  *Tailwind:* `inline-flex items-center gap-2 rounded-full bg-gradient-to-r from-indigo-500 to-indigo-600 text-white px-4 py-2.5 text-sm shadow-sm hover:from-indigo-600 hover:to-indigo-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-indigo-600`.
* **Secondary Button**
  *Tailwind:* `rounded-lg border border-slate-200 bg-white text-slate-700 px-4 py-2 text-sm hover:bg-slate-50`.
* **Badges**
  *Tailwind:* base `rounded-full px-2 py-0.5 text-xs font-medium`, success `bg-emerald-50 text-emerald-700`, danger `bg-rose-50 text-rose-700`, neutral `bg-slate-100 text-slate-700`.
* **Tabs & Pills Focus**
  *Tailwind:* `focus-visible:outline focus-visible:outline-2 focus-visible:outline-indigo-600`.
* **Links**
  *Tailwind:* `text-indigo-600 hover:text-indigo-700 underline-offset-2 hover:underline`.

## States

* **Loading**
  *Tailwind:* `animate-pulse`, tiles with `h-8 bg-slate-100 rounded`, list bars `h-4 bg-slate-100 rounded`.
* **Empty**
  *Tailwind:* container `rounded-xl border border-slate-200 bg-white p-8 text-center`, icon `mx-auto size-10 text-slate-300`, cta `mt-4`.
* **Error**
  *Tailwind:* `rounded-xl border border-rose-200 bg-rose-50 p-4 text-rose-700`, retry button secondary.

## Responsiveness

* **Mobile**
  Single column. Stats tiles stack: `grid-cols-1`. Pills scroll: `overflow-x-auto whitespace-nowrap -mx-6 px-6`.
* **Tablet**
  Stats `sm:grid-cols-2`, cards `sm:grid-cols-2`.
* **Desktop**
  Stats `lg:grid-cols-4`, cards `lg:grid-cols-3`.
* Keep primary button visible; on small screens move under title using `order-last sm:order-none`.

## Accessibility

* Landmarks: `header`, `main`, `nav`.
  *Tailwind helpers:* `sr-only` for hidden labels.
* Focus rings visible on all interactive elements: `focus-visible:outline-2 focus-visible:outline-indigo-600`.
* Badges include status text; icons with `aria-hidden="true"`.
* Contrast: use slate and indigo tones that satisfy AA.

## Content Rules

* Values use thousands separators; numerals `tabular-nums`.
* Deltas show leading sign and compact precision.
* Dates prefer “Today/Yesterday,” else `MMM D, YYYY`.
* Copy is neutral and concise.

## Performance

* Render header and stats first; stream lists.
  *Tailwind:* keep classes static to enable JIT pruning.
* Paginate long activity; use “View all”.
* Avoid heavy charts on home.

## Telemetry

* Track tab and pill changes, tile impressions, action link clicks, primary CTA.
* Monitor time-to-first-stat and block-level error rates.


# Page with sidebar navigation

* **Layout shell**
  Two-pane app: left sidebar rail + right content column.
  *Tailwind:* root `min-h-dvh bg-slate-50`, shell `flex`, sidebar `hidden md:flex md:w-72 shrink-0`, content `flex-1 min-w-0 flex flex-col`.

* **Sidebar (desktop)**
  Brand at top, primary nav, “Your teams” group, settings at bottom.
  *Tailwind:* wrapper `md:sticky md:top-0 md:h-dvh flex-col gap-4 bg-indigo-600 text-white p-4`, brand `h-10 w-10 rounded-xl bg-white/10 grid place-items-center`, nav list `space-y-2`, item `flex items-center gap-3 rounded-xl px-3 py-2 text-indigo-100 hover:bg-white/10 hover:text-white`, active `bg-white/20 text-white shadow-inner`, icon `size-5`.

* **Sidebar (mobile off-canvas)**
  Slides over content with backdrop.
  *Tailwind:* panel `fixed inset-y-0 left-0 z-50 w-72 bg-indigo-600 p-4 transition-transform duration-300 -translate-x-full data-[open=true]:translate-x-0`, backdrop `fixed inset-0 z-40 bg-slate-900/50 data-[open=false]:hidden`, close button `absolute right-3 top-3 rounded-md p-2 text-white/80 hover:text-white`.
  Use a hamburger in the header to toggle `data-open`.

* **Section groups and badges**
  Group label `px-3 text-xs uppercase tracking-wide text-indigo-100/70`, pill badge `ml-auto rounded-full bg-white/15 px-2 py-0.5 text-[10px]`.

* **Active state & current page**
  Mark the current link with `aria-current="page"` and the active styles above. Keep icon and label both highlighted.

* **Top header in content column**
  Search on the left. Alerts and user menu on the right.
  *Tailwind:* header `h-16 bg-white border-b border-slate-200 px-6 flex items-center justify-between`, search field `max-w-lg flex-1`, input `w-full rounded-xl border border-slate-200 bg-white px-3 py-2 text-sm placeholder:text-slate-400 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-500/20`, right cluster `flex items-center gap-4`.

* **Main content area**
  Padded canvas for pages.
  *Tailwind:* container `p-6`, card canvas `rounded-2xl border border-slate-200 bg-white min-h-[60vh]`.

* **Colors and elevation**
  Sidebar uses an indigo gradient variant if desired.
  *Tailwind:* `bg-gradient-to-b from-indigo-600 to-indigo-700`, separators `divide-y divide-white/10`, no heavy shadows.

* **Spacing and radii**
  Sidebar tiles `rounded-xl`, page cards `rounded-2xl`, internal gaps `gap-3` lists and `gap-6` sections.

* **Keyboard and a11y**
  `nav` landmark on sidebar, list items are `<a>` with clear names.
  Focus rings: `focus-visible:outline focus-visible:outline-2 focus-visible:outline-white` on dark sidebar; `focus-visible:outline-indigo-600` in content.
  Off-canvas trap focus when open; backdrop closes on `Esc`.

* **Responsive behavior**
  Mobile: sidebar hidden, open via hamburger; header remains `sticky top-0 z-40`.
  Tablet/desktop: sidebar `md:flex` and `md:sticky`.
  Content scrolls independently; keep sidebar fixed height with `h-dvh` to avoid layout shift.

* **Icons**
  Use stroke icons `stroke-1.5 text-indigo-100 group-hover:text-white`. Provide selected icon with filled/tint variant if available.

* **State examples**
  Disabled nav item `opacity-50 pointer-events-none`. Loading list item can show a shimmer bar `animate-pulse bg-white/10`.

* **Example class recipes**

  * Sidebar item base: `group flex items-center gap-3 rounded-xl px-3 py-2 text-indigo-100 hover:bg-white/10 hover:text-white`
  * Sidebar item active: `bg-white/20 text-white shadow-inner`
  * Team chip: `inline-flex size-6 items-center justify-center rounded-lg bg-white/10 text-xs font-medium`
  * Settings row: `mt-auto` section pinned to bottom of the rail.
