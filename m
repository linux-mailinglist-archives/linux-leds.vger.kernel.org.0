Return-Path: <linux-leds+bounces-7876-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Id/IYiT8GlvVAEAu9opvQ
	(envelope-from <linux-leds+bounces-7876-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 13:01:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3415348333D
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 13:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 866B13155F99
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 10:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7DA3FE359;
	Tue, 28 Apr 2026 10:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geLV98Ow"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3D13FE350;
	Tue, 28 Apr 2026 10:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372933; cv=none; b=Y9b3OD+lLBeDJJ48rjLeMvafzqA7FW53pfFSEL3x3H7LqETtu3xGMHciOUxZ42LsTx69U80RxhUYx7rkAyM8UTJuOuoY30n3pYzaEq3NJl/Kktpyp0wKCdBDx7Yi4t0F+58k5KRUFn4a0PEceMLf7fHNvu2rOJwwBF1tto22bX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372933; c=relaxed/simple;
	bh=PsFsicZF8LO/wwF+hIneruUq34uFUhSIcZFHEpZSb84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cP9NRhn17rafZlnC64TNHK21RWHj4EYFSATsO1p+nmnE+8Nr8/+ukbsZtGAJ0fgR7XwgQNbs9RQ6TXPsyYOnOAI3RQ0xf3T/djwwRPSBqDmdyi/ais4TUjO9k+whpsgQ8c8vclnIpVem+KYjDrOofTToLipAOtwBpCX3i5Gfbzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geLV98Ow; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFE2C2BCAF;
	Tue, 28 Apr 2026 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372933;
	bh=PsFsicZF8LO/wwF+hIneruUq34uFUhSIcZFHEpZSb84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=geLV98Ow0aFcqR7IRN+UhH1nvIiGwphIfIw/jmikOECXTIngFGztx8HvHsX4iUhIL
	 Ut9UEhqpXwy8ZJEBH62kDDQfAxtfHIjNFx6svRHNWoavRrHa/KS25w4qYQX/+ewo4x
	 kDCN9S6P1sfyanWcb9YIfOWcB1vh/1KL4FKIXfmgDAK5RpaYVmclKJXyzgWwbEzy9D
	 zIkh08mxXohamye/EZCs5I1DdTfZ6da0eNgLZO63b9BQ+mdNij/PXSbacGVNOty8R+
	 Mc680UV/ioc5i7RAeIBtIpz7Ouwyu5h/8P3RAl0Frg4z5AxFCYOKKelqdeCqtGePuR
	 Bu0zG0b84hqqg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	pavel@ucw.cz,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.18] leds: core: Implement fallback to software node name for LED names
Date: Tue, 28 Apr 2026 06:40:39 -0400
Message-ID: <20260428104133.2858589-28-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428104133.2858589-1-sashal@kernel.org>
References: <20260428104133.2858589-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3415348333D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,ucw.cz,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7876-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[lee.kernel.org:query timed out,dmitrytorokhov.gmail.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

[ Upstream commit 4f530c65487636dc1536b3fa1041f9a877a66a7f ]

If a software node defining an LED is missing explicit 'label', 'color',
or 'function' properties, led_compose_name() currently fails with
-EINVAL, because fallback to using node name in place of LED name/label
is only implemented for OF nodes.

Implement similar fallback for software nodes. Unlike OF nodes, which
use the short 'name' attribute of the device tree node to avoid
including the address block, use fwnode_get_name() directly since
swnodes do not include an address block and always have a valid name.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://patch.msgid.link/20260311-led-swnode-name-v1-1-798a49e041c6@gmail.com
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have enough information for a complete analysis.

# Analysis: leds: core: Implement fallback to software node name for LED
names

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: Subject line
Record: `[leds: core]` `[Implement]` `[fallback to software node name
for LED names]`. The verb "Implement" suggests adding missing
functionality, but the commit body describes fixing an -EINVAL failure,
making this a bug fix in substance.

### Step 1.2: Tags
Record:
- Signed-off-by: Dmitry Torokhov (author)
- Signed-off-by: Lee Jones (LED subsystem maintainer)
- Link: `https://patch.msgid.link/20260311-led-swnode-
  name-v1-1-798a49e041c6@gmail.com`
- No `Fixes:` tag
- No `Cc: stable` tag
- No `Reported-by` / `Tested-by` / `Reviewed-by` tags

### Step 1.3: Body text
Record: Bug description: "If a software node defining an LED is missing
explicit 'label', 'color', or 'function' properties,
`led_compose_name()` currently fails with -EINVAL." Author explicitly
describes a failure mode. Root cause: OF-only fallback. Fix: use
`fwnode_get_name()` for software nodes.

### Step 1.4: Hidden bug fix
Record: The verb "Implement" reads like a feature addition, but the
commit body explicitly says the existing code "fails with -EINVAL" -
this is a bug fix disguised as a feature implementation. Pattern "Handle
X properly" / missing error-path fallback.

## PHASE 2: DIFF ANALYSIS

### Step 2.1: Inventory
Record: 1 file changed (`drivers/leds/led-core.c`), 3 lines added, 0
removed. Single function modified: `led_compose_name()`. Scope: single-
file surgical fix.

### Step 2.2: Code flow change
Record: Before: if fwnode is software_node (not OF) and lacks
label/color/function properties → return -EINVAL. After: if
software_node, use `fwnode_get_name(fwnode)` as the LED classdev name
(same fallback pattern as OF nodes).

### Step 2.3: Bug mechanism
Record: Category (h) hardware-workaround-ish / (g) logic-correctness.
The `led_compose_name` fallback chain was incomplete: it handled OF-node
fallback (`to_of_node(fwnode)->name`) but didn't handle the
`is_software_node()` case, causing LED registration to fail for drivers
that describe LEDs via software nodes with only a `.name` field. Fix
adds the missing `else if (is_software_node(fwnode))` branch.

### Step 2.4: Quality
Record: Obviously correct - mirrors the OF pattern. Uses
`fwnode_get_name()` which for swnodes resolves to
`kobject_name(&swnode->kobj)` (always valid for registered swnodes). No
regression risk: only affects a path that previously returned -EINVAL.

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: git blame
Record: The `is_of_node(fwnode)` OF fallback was added by
`bb4e9af0348df` (Jun 2019, v5.4-rc1) - "leds: core: Add support for
composing LED class device names". The swnode gap has existed since 2019
but was latent until drivers began using swnodes for LEDs without a
"label" property.

### Step 3.2: Fixes: tag
Record: No Fixes: tag. Most relevant trigger commit: `4e0bcbd270e88`
("platform/x86: barco-p50-gpio: use software nodes for gpio-leds/keys")
merged in v6.18-rc1, which defined an LED swnode with only `.name =
"identify"` and no label/color/function properties. Verified via `git
describe --contains 4e0bcbd270e88` → `v6.18-rc1~82^2~2`.

### Step 3.3: Related recent changes
Record: `git log --oneline -- drivers/leds/led-core.c` shows last change
was `ee44a1def7ee4` in v6.16-rc1 ("leds: core: Bail out when composed
name can't fit the buffer"). No conflicting changes in stable range.

### Step 3.4: Author
Record: Dmitry Torokhov is a prolific input/driver maintainer; has
landed other swnode conversions recently (`4e0bcbd270e88` barco,
`b8754092dfed4` pcengines-apuv2). Strong familiarity with swnode
plumbing. Applied by Lee Jones (LED subsystem maintainer).

### Step 3.5: Dependencies
Record: `is_software_node()` and `fwnode_get_name()` have been stable
APIs in the fwnode infrastructure for years. No prerequisite patches.
Standalone fix.

## PHASE 4: MAILING LIST RESEARCH

### Step 4.1-4.2: Thread investigation
Record: Used `b4 mbox -o /tmp/b4-dig 20260311-led-swnode-
name-v1-1-798a49e041c6@gmail.com` to retrieve the thread (8 messages).
Patch is [PATCH 1/2] of "Fall back to using software node name as LED
name" series. Maintainer Lee Jones applied both patches: "Applied,
thanks! [1/2] commit: 4f530c65487636dc1536b3fa1041f9a877a66a7f [2/2]
commit: 91dc0c2a152373c4004df7e36de45190b82089ab". No NAKs. Initial
application failed due to conflict with patch 2/2 formatting changes -
author resent after rebase. No stable nomination in thread. Cover letter
motivation: "helpful when converting old boards using bespoke platform
data to software nodes/static device properties."

### Step 4.3-4.5: Bug report / stable discussion
Record: No `Reported-by:` tag, no linked syzbot/bugzilla. No explicit
stable discussion observed in the thread.

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1: Functions modified
Record: `led_compose_name()` only.

### Step 5.2: Callers
Record: `led_compose_name` is called by:
- `drivers/leds/led-class.c:498` (`led_classdev_register_ext`) - the
  main registration path used by dozens of LED drivers
- `drivers/pci/npem.c:498` - PCI NPEM LED registration

`led_classdev_register_ext` is called from ~70+ LED drivers via
`devm_led_classdev_register_ext`, including `drivers/leds/leds-
gpio.c:create_gpio_led` which is the specific path exercised by
barco-p50-gpio.

### Step 5.3: Callees
Record: `is_software_node()`, `fwnode_get_name()`, `snprintf()` - all
well-established.

### Step 5.4: Call chain / reachability
Record: Reachable from platform device probe paths. Specifically: `leds-
gpio` probe → `gpio_leds_create()` → `create_gpio_led()` (with
`template->name = NULL`) → `devm_led_classdev_register_ext()` →
`led_classdev_register_ext()` → `led_compose_name()`. Triggered on every
boot for affected hardware.

### Step 5.5: Similar patterns
Record: Verified `drivers/platform/x86/barco-p50-gpio.c` at v7.0 has
`identify_led_node` with `.name = "identify"` and `identify_led_props`
containing only `PROPERTY_ENTRY_GPIO` (no label/color/function). Other
swnode LED users (`meraki-mx100`, `pcengines-apuv2`, `x86-android-
tablets`) include `PROPERTY_ENTRY_STRING("label", ...)` so they work
without this fix.

## PHASE 6: STABLE TREE ANALYSIS

### Step 6.1: Code in stable trees
Record: The `led_compose_name()` function exists in all active stable
branches. Verified `git show v6.12:drivers/leds/led-core.c` and
`v6.6:drivers/leds/led-core.c` both have identical `else if
(is_of_node(fwnode)) { ... } else return -EINVAL;` pattern. The bug
(swnode fallback gap) exists in every version since v5.4. However, the
practical USER-VISIBLE bug (barco-p50-gpio LED not registering) only
appears starting in v6.18 (via `4e0bcbd270e88`). Before v6.18, barco
used `gpio_led_platform_data` with `.name = "identify"`, which bypasses
`led_compose_name` entirely (via the `if (template->name)` branch in
`create_gpio_led`).

### Step 6.2: Backport difficulty
Record: `git log --oneline v6.19..v7.0 -- drivers/leds/led-core.c` →
empty. File is stable. Clean apply expected for v6.18.y+ (where the
regression exists). For older stable trees (6.6, 6.12), the fix is a no-
op improvement (no driver there triggers the path) but still applies
cleanly.

### Step 6.3: Related fixes in stable
Record: None found. No other approach to the same bug observed.

## PHASE 7: SUBSYSTEM CONTEXT

### Step 7.1: Subsystem
Record: `drivers/leds/` - LED class core. Criticality: IMPORTANT (common
driver infrastructure used by many hardware drivers). Failure mode here
is driver-specific rather than core-kernel.

### Step 7.2: Activity
Record: `drivers/leds/led-core.c` receives only a handful of changes per
release. Mature, stable code.

## PHASE 8: IMPACT AND RISK

### Step 8.1: Affected users
Record: Users of hardware whose drivers describe LEDs via software nodes
without `label`/`color`/`function` properties. Concretely: Barco P50
board (`barco-p50-gpio`) in v6.18+ - identify LED fails to register.
Platform-specific (niche hardware).

### Step 8.2: Trigger conditions
Record: Triggered every boot on affected hardware. No privilege needed -
happens automatically during probe.

### Step 8.3: Failure severity
Record: LED fails to register (returns -EINVAL during probe). Severity:
LOW-MEDIUM. No crash, no data loss, no security issue. Functional
regression: identify LED on Barco P50 doesn't appear in /sys/class/leds.
For most users this is a minor annoyance; for Barco P50 appliance users,
the identify-button LED feature is broken.

### Step 8.4: Risk-benefit
Record:
- Benefit: LOW-MEDIUM (fixes functional regression on specific hardware,
  v6.18+ only)
- Risk: VERY LOW (3-line mirror of existing OF logic, only affects a
  path that previously returned -EINVAL)
- Ratio: Favorable - very cheap fix for real regression

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: Evidence
FOR backporting:
- Commit body explicitly describes an -EINVAL failure (bug fix in
  substance)
- Fixes a functional regression in v6.18+ (barco-p50-gpio identify LED)
- Small (3 lines), surgical, single file
- Mirrors existing OF-node fallback logic (obviously correct)
- Applied by the LED subsystem maintainer after review on the list
- Very low regression risk - only affects paths that previously returned
  -EINVAL
- Trigger is deterministic (boot-time probe) so any affected users hit
  it every boot

AGAINST backporting:
- No `Fixes:` tag linking to `4e0bcbd270e88`
- No `Cc: stable` tag
- No `Reported-by:` (no cited user complaint)
- Commit message framed as "helpful" for future conversions rather than
  "fix"
- Affected hardware is niche (Barco P50 appliance)
- Non-critical failure (no crash/corruption/security)

### Step 9.2: Stable rules checklist
1. Obviously correct and tested: YES - trivial mirror of existing OF
   branch, accepted by LED maintainer.
2. Fixes real bug: YES - barco-p50-gpio LED registration fails in
   v6.18+.
3. Important issue: BORDERLINE - functional regression but not
   crash/security/corruption.
4. Small and contained: YES - 3 lines, one file, one function.
5. No new features/APIs: YES - no new interfaces; fills a missing
   fallback.
6. Applies cleanly to stable: YES - the file is stable across recent
   versions.

### Step 9.3: Exception category
Record: Partial match to "hardware enablement / driver fix for existing
hardware". The fix makes an in-tree driver (barco-p50-gpio, present
since v5.16, swnode-converted in v6.18) actually work.

### Step 9.4: Decision
The commit fixes a real, deterministic functional regression introduced
into v6.18 by commit `4e0bcbd270e88`. Although the failure is not a
crash or security issue, it is a clean-cut boot-time driver probe
failure that users will hit every boot on affected hardware. The fix is
minimal (3 lines), obviously correct (mirrors the existing OF-node
fallback), safe (cannot break previously-working configurations since it
only covers a path that previously returned -EINVAL), and was accepted
by the subsystem maintainer.

The absence of `Fixes:`/`Cc: stable` tags is exactly what AUTOSEL exists
to catch. Weight of evidence favors backport, particularly to v6.18.y
and v6.19.y where the regression actually manifests. For earlier trees
the fix is a safe no-op improvement that still applies cleanly.

## Verification
- [Phase 1] Parsed tags from commit message: no `Fixes:`, no `Cc:
  stable`, no `Reported-by:`; only `Signed-off-by:` from author (Dmitry
  Torokhov) and LED maintainer (Lee Jones); `Link:` to
  `patch.msgid.link` for `20260311-led-swnode-
  name-v1-1-798a49e041c6@gmail.com`.
- [Phase 2] Read `drivers/leds/led-core.c` (617 lines, current v7.0):
  confirmed `led_compose_name` structure - `is_of_node(fwnode)` branch
  (line 581) falls back to `to_of_node(fwnode)->name`, `else return
  -EINVAL` (line 585). Diff adds 3 lines of `else if
  (is_software_node(fwnode))` branch using `fwnode_get_name(fwnode)`.
- [Phase 3] `git blame drivers/leds/led-core.c -L 574,592`: `is_of_node`
  fallback dates to `bb4e9af0348dfe` (2019, Jacek Anaszewski) - "leds:
  core: Add support for composing LED class device names".
- [Phase 3] `git describe --contains 4e0bcbd270e88` →
  `v6.18-rc1~82^2~2`: confirms barco swnode conversion landed in v6.18.
- [Phase 3] `git show
  4e0bcbd270e88^:drivers/platform/x86/barco-p50-gpio.c`: confirmed
  pre-v6.18 barco used `gpio_led_platform_data` with `.name =
  "identify"`, bypassing `led_compose_name`.
- [Phase 3] `git show v6.6:drivers/platform/x86/barco-p50-gpio.c`: still
  uses `gpio_led_platform_data`, not swnodes - so regression does NOT
  exist in v6.6.y.
- [Phase 3] `git log --oneline -- drivers/leds/led-core.c`: last change
  `ee44a1def7ee4` in v6.16-rc1; no churn in v6.18..v7.0.
- [Phase 4] `b4 mbox -o /tmp/b4-dig 20260311-led-swnode-name-v1-1-...`:
  retrieved 8-message thread. Lee Jones replied "Applied, thanks!" and
  listed commit hash `4f530c65487636dc1536b3fa1041f9a877a66a7f` for
  patch 1/2. Initial application failed (conflict with patch 2/2
  formatting), author re-submitted.
- [Phase 4] Read thread: no `Cc: stable` suggestion, no NAKs, no
  Reported-by reference; author frames the change as "helpful when
  converting old boards."
- [Phase 5] Read `drivers/leds/leds-gpio.c`: confirmed
  `gpio_leds_create()` passes `struct gpio_led led = {}` (name == NULL)
  into `create_gpio_led`, forcing the fwnode path with `init_data =
  {.fwnode = fwnode}` - the exact path that hits `led_compose_name` and
  fails without this fix.
- [Phase 5] Read `drivers/platform/x86/barco-p50-gpio.c` lines 83-101
  (v7.0): confirmed `identify_led_node` has `.name = "identify"` with
  `identify_led_props` containing ONLY `PROPERTY_ENTRY_GPIO("gpios",
  ...)` - no `label`/`color`/`function`.
- [Phase 5] Examined other swnode LED users: `pcengines-apuv2`, `meraki-
  mx100`, `x86-android-tablets/other.c` all include
  `PROPERTY_ENTRY_STRING("label", ...)` → unaffected by the bug.
- [Phase 5] Read `drivers/base/swnode.c` line 423-427 and
  `drivers/base/property.c` line 654-658: `fwnode_get_name(swnode)`
  returns `kobject_name(&swnode->kobj)`, always valid for registered
  swnodes. Safe to use here.
- [Phase 6] `git show v6.12:drivers/leds/led-core.c` and
  `v6.6:drivers/leds/led-core.c`: confirmed identical `is_of_node`
  fallback structure with `else return -EINVAL` - fix applies cleanly.
- [Phase 6] `git diff v6.17:...led-core.c v7.0:...led-core.c`: no
  difference → file is stable in the 6.18-6.19-7.0 range where the
  regression exists.
- [Phase 8] Trigger reachability: boot-time probe path, deterministic
  every boot on affected hardware.
- UNVERIFIED: Could not verify the patch's upstream commit SHA
  `4f530c65487636dc1536b3fa1041f9a877a66a7f` in the local 7.0 tree (tree
  HEAD is `028ef9c96e961 Linux 7.0`, likely predates the leds-next merge
  for this commit). This matches the AUTOSEL candidate context.
- UNVERIFIED: Did not confirm by dynamic test that barco-p50-gpio
  actually fails without this fix; conclusion based on code inspection
  of `leds-gpio` + `led_compose_name` + the barco swnode definition.

The fix is a small, surgical 3-line fallback that mirrors well-
established OF-node handling. It addresses a real regression introduced
in v6.18 (Barco P50 identify LED fails to register) and cannot cause
regressions because it only covers a previously-failing path. Accepted
by the LED subsystem maintainer. This is the kind of low-risk driver-
enablement fix that AUTOSEL is designed to pick up for recent stable
trees.

**YES**

 drivers/leds/led-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 59473f286b31f..8ce41b36c6455 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -581,6 +581,9 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 	} else if (is_of_node(fwnode)) {
 		n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
 			     to_of_node(fwnode)->name);
+	} else if (is_software_node(fwnode)) {
+		n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
+			     fwnode_get_name(fwnode));
 	} else
 		return -EINVAL;
 
-- 
2.53.0


