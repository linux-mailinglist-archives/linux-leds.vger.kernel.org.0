Return-Path: <linux-leds+bounces-7875-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDpFCjmP8GnKUwEAu9opvQ
	(envelope-from <linux-leds+bounces-7875-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 12:43:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B813A482DA6
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 12:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0A3930193F0
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 10:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4763F54B6;
	Tue, 28 Apr 2026 10:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyQD/A/c"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920643F54AD;
	Tue, 28 Apr 2026 10:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372905; cv=none; b=fu4dDkYn65hDucp4SMfb6/yWEcKaR+lY66TfJmUPUcnTiiKICc0qhmjpcLVzZQUF5U05ICXRVZiMwePMuUsekpRj8ts7/FRn/206OEAIJUw0047v3KVX2H8GUtnTePzNAYdkiJzFCnbU2JSESamGLjdjVrxQA2UrWFUdgpoahe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372905; c=relaxed/simple;
	bh=UJEiywJu4TgdPsL2ia5AJpskby7pS/0abowLF4EVvqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IZg9DjmmayVuCTHhTpMcPsZqYl8y+drorsFuYDVZFC+uwdFjYeLkNqz9S7OLa1/VjgStwiCJ4lp29gOm7hc/CZnlKjMgJ3mYDvsM5GPK1ZoTirxbVoQMSmCEE1x5+H5bHwtH2d0PGpmjiQ59Gn3L2gwVYeL9kRUDGa/xXsj4GGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyQD/A/c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63FCC2BCB8;
	Tue, 28 Apr 2026 10:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372905;
	bh=UJEiywJu4TgdPsL2ia5AJpskby7pS/0abowLF4EVvqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hyQD/A/cx7949Mq2eNfwbSEppxl1xIg+2O/nOB41X56POBaxxDq8SKxKXbHgx/k5h
	 X2y7DHDpg167QKFm2U4hP4ZYK9P5IpLeD2MwbEVErQtKXl9ewLZuCImt+yqmz108ya
	 h/COto9bJJ4zYvo85Lz6tYyME2Nvli3sXUGnKbOn/VCBPnbL7QmhVbypTlLbCby1zI
	 C18zSouei24ZzpMv9PsY2B0XzYF9BCcbwaefX7iSo3dgHVeuRbCxt24vvGA05SzD1z
	 m5Zd+XrvcQq2N1S938OcH3ErQUaFioB8Q9Ck2QzxmN1SnCe31L/sNeea8oepJ3a7Dq
	 Rk3HN1i0VTsfg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Lukas Kraft <rebootrequired42@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	pavel@ucw.cz,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.15] leds: lgm-sso: Fix typo in macro for src offset
Date: Tue, 28 Apr 2026 06:40:19 -0400
Message-ID: <20260428104133.2858589-8-sashal@kernel.org>
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
X-Rspamd-Queue-Id: B813A482DA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,ucw.cz,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7875-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,msgid.link:url]

From: Lukas Kraft <rebootrequired42@gmail.com>

[ Upstream commit 0e2287999f0432b51a54c235db660789ca657f53 ]

Replace unused argument pinc with used argument pin.

Signed-off-by: Lukas Kraft <rebootrequired42@gmail.com>
Link: https://patch.msgid.link/20260312210958.48467-1-rebootrequired42@gmail.com
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have enough information to do a complete analysis. Let me write it
up.

## Commit Analysis

### PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject line parse**
Record: Subsystem: `leds/lgm-sso`; Action verb: "Fix"; Summary: Fix typo
in macro parameter name (`pinc` -> `pin`).

**Step 1.2: Tags**
Record:
- Signed-off-by: Lukas Kraft (author - first-time contributor based on
  git log)
- Link: https://patch.msgid.link/20260312210958.48467-1-
  rebootrequired42@gmail.com
- Signed-off-by: Lee Jones (subsystem maintainer, committer)
- No `Fixes:` tag (expected - that's why it needs review)
- No `Cc: stable@vger.kernel.org`
- No `Reported-by:`, `Tested-by:`, or `Reviewed-by:`

**Step 1.3: Commit body**
Record: Minimal message: "Replace unused argument pinc with used
argument pin." No explanation of user-visible impact, no reproduction
steps, no stack traces. Author appears to have noticed this through code
inspection.

**Step 1.4: Hidden bug fix detection**
Record: The subject explicitly says "Fix typo". The body describes it as
replacing "unused argument pinc with used argument pin" - this IS a real
bug fix (not hidden), but the commit undersells the impact. The typo
means the macro body references `pin` from the caller's scope instead of
the macro argument, producing incorrect register bit positions.

### PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
Record: 1 file (`drivers/leds/blink/leds-lgm-sso.c`), 1 line changed (1
deletion, 1 addition). Surgical, minimal scope.

**Step 2.2: Code flow change**
Record:
- Before: `#define GET_SRC_OFFSET(pinc)    (((pin) * 6) + 4)` —
  parameter `pinc` is unused; `pin` in body is resolved from the
  enclosing scope at macro expansion time.
- After: `#define GET_SRC_OFFSET(pin)    (((pin) * 6) + 4)` — parameter
  `pin` now matches the identifier in the body, so the macro argument is
  used.

**Step 2.3: Bug mechanism**
Record: Category (g) "Logic / correctness fix." The macro has a single
call site at line 226: `low = GET_SRC_OFFSET(off);` inside
`sso_led_freq_set(struct sso_led_priv *priv, u32 pin, int freq_idx)`.
The function has a local parameter named `pin`. With the buggy macro,
`(((pin) * 6) + 4)` captures the function's `pin` parameter instead of
the macro argument `off`. This produces completely different values:
- Buggy: for pin=25, computes 25*6+4 = 154
- Fixed: for off=1 (pin 25 in group 1), computes 1*6+4 = 10

The `low`/`high` values feed into `GENMASK(high, low)` and `freq_src <<
high` at lines 228-229, used by `regmap_update_bits()` to set clock-
source bits in the LED_BLINK_H8_0/1 register. With `low > 32` the
shift/GENMASK produce undefined/wrong values, so the clock source for
hardware LED blinking is written to wrong register bits (or not written
at all).

**Step 2.4: Fix quality**
Record: Trivial correctness fix. Zero regression risk - the old macro
parameter `pinc` was unused, so no caller relied on its name. The
callsite passes `off`, and the fix makes the macro correctly use that
argument.

### PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame**
Record: The buggy line was introduced in commit `c3987cd2bca34` ("leds:
lgm: Add LED controller driver for LGM SoC") by Amireddy Mallikarjuna
reddy, dated 2020-12-10, first appearing in **v5.12-rc1**. Bug has been
present for ~5 years in all stable trees.

**Step 3.2: Follow Fixes: tag**
Record: No `Fixes:` tag in commit, but blame identifies introducing
commit as `c3987cd2bca34ddfec69027acedb2fae5ffcf7a0` - present in v5.12
and every subsequent release including all active LTS trees.

**Step 3.3: File history**
Record: Recent changes are unrelated refactors (GPIO callback renames,
error-code propagation, clock-handling fixes). The macro has been
untouched since the initial driver commit.

**Step 3.4: Author context**
Record: Lukas Kraft is apparently a first-time contributor (no other
commits under this email in the repo). The committer/maintainer Lee
Jones applied it directly via b4 tooling (see the "Applied, thanks!"
reply in the mbox).

**Step 3.5: Dependencies**
Record: No dependencies. Standalone, single-line change.

### PHASE 4: MAILING LIST RESEARCH

**Step 4.1: Original submission**
Record: `b4 dig -c 0e2287999f04` resolved to https://lore.kernel.org/all
/20260312210958.48467-1-rebootrequired42@gmail.com/. Single revision
(v1). The maintainer (Lee Jones) replied with "Applied, thanks!"
directly via `b4-ty`. No review comments or feedback.

**Step 4.2: Reviewers**
Record: Thread shows submission to `lee@kernel.org` (Lee Jones, LED
maintainer) and `pavel@kernel.org` (Pavel Machek, LED maintainer), CC to
linux-leds and linux-kernel. Applied by Lee Jones.

**Step 4.3: Bug report**
Record: No `Reported-by:` or bug report linked. Author discovered via
code inspection.

**Step 4.4: Related patches**
Record: Standalone patch, not part of a series.

**Step 4.5: Stable mailing list**
Record: No prior stable discussion found.

### PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1: Key functions**
Record: `GET_SRC_OFFSET` macro; used only in `sso_led_freq_set()`.

**Step 5.2: Callers of affected code**
Record: `sso_led_freq_set()` is called from:
- `sso_led_blink_set()` (line 315) - the LED class `.blink_set`
  callback, invoked from userspace via
  `/sys/class/leds/*/delay_on|delay_off`
- `sso_led_hw_cfg()` (line 331) - called from `sso_create_led()` during
  probe, only if `desc->hw_blink` is set (DT property `intel,sso-hw-
  blink`)

**Step 5.3: Callees**
Record: The function calls `regmap_update_bits()` to set bits in the
LED_BLINK_H8_0/LED_BLINK_H8_1 hardware registers.

**Step 5.4: Call chain reachability**
Record: Reachable from userspace via sysfs if `intel,sso-hw-blink` DT
property is set. Also executed at probe time for every LED configured
with hw_blink. Triggers on pins 24-31 only (group 0 returns early at
line 205).

**Step 5.5: Similar patterns**
Record: The adjacent macro `GET_FREQ_OFFSET(pin, src)` is correct,
making the typo in `GET_SRC_OFFSET` clearly a one-off error. I confirmed
the bug with a small C test program: `GET_SRC_OFFSET(off=1)` returns 154
(buggy, using pin=25) vs. 10 (fixed). The fixed value is coherent with
`GET_FREQ_OFFSET`'s result of 8 - they sit next to each other in the
register bitmap.

### PHASE 6: CROSS-REFERENCING STABLE TREES

**Step 6.1: Does buggy code exist in stable?**
Record: Verified bug present in v5.15, v6.1, v6.6, v6.12 (all active LTS
trees) - the macro has identical buggy form. The file path
`drivers/leds/blink/leds-lgm-sso.c` has been stable since introduction.

**Step 6.2: Backport complications**
Record: File structure in the area of the patch is unchanged across
stable trees. The fix should apply cleanly to all active LTS trees
(5.15.y through 6.12.y) and current 6.17+/6.18+ trees.

**Step 6.3: Related fixes in stable**
Record: No related fix is already in stable for this issue.

### PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1: Subsystem criticality**
Record: `drivers/leds/blink/` - LED blink drivers. PERIPHERAL
criticality. Affects only systems using Intel Lightning Mountain (LGM)
SoC, a networking SoC used primarily in home routers and gateway
devices.

**Step 7.2: Subsystem activity**
Record: Low-to-moderate activity. Recent changes are treewide refactors
affecting this driver as a bystander (GPIO callback renames, platform
driver API changes).

### PHASE 8: IMPACT AND RISK

**Step 8.1: Affected population**
Record: DRIVER-SPECIFIC. Only systems with CONFIG_LEDS_LGM=y (or =m) AND
Intel LGM SoC AND `intel,sso-hw-blink` set for LEDs on pins 24-31. A
narrow but real user population (Intel LGM-based routers/gateways).

**Step 8.2: Trigger conditions**
Record: Triggered at LED probe (hw_cfg path) if hw_blink is enabled in
DT, or at runtime when userspace writes to
`/sys/class/leds/*/delay_on|delay_off` for an LED with hw_blink. No
privilege required for the sysfs path. Not a race - deterministic
behavior.

**Step 8.3: Failure mode severity**
Record: MEDIUM (low). Incorrect register bits are programmed for clock-
source selection of hardware LED blink, meaning LEDs may blink at the
wrong rate, wrong clock source, or fail to blink via the hardware path.
No crash, no data corruption, no security issue. Purely
functional/hardware-correctness issue.

**Step 8.4: Risk-benefit**
Record:
- BENEFIT: Low-to-medium. Fixes real hardware register miscalculation on
  LGM systems. Narrow user base but real correctness fix.
- RISK: Very low. 1-line macro parameter rename; the old parameter was
  unused; call site is single and clearly correct with the fix.
- Ratio: Benefit >> risk, but benefit is not high in absolute terms.

### PHASE 9: SYNTHESIS

**Step 9.1: Evidence**
- FOR: Clear, obvious bug fix; fixes a real register-computation error;
  trivial 1-line change; zero regression risk; applies cleanly to all
  stable trees; confirmed with a reproduction test; bug has existed
  since v5.12 in all LTS trees.
- AGAINST: No user reports; no Cc: stable; no Fixes: tag; narrow
  hardware (Intel LGM SoC); severity is "functional correctness" not
  crash/security/corruption; commit message undersells/doesn't explain
  the real user impact; single-line commit with no Reviewed-by.
- UNRESOLVED: None material.

**Step 9.2: Stable rules checklist**
1. Obviously correct? YES - trivial typo fix, verified by reproduction
2. Fixes real bug? YES - macro silently uses wrong value
3. Important issue (crash/security/corruption/deadlock)? NO - only
   incorrect LED hardware blink programming
4. Small and contained? YES - 1 line
5. No new features/APIs? YES
6. Applies cleanly? YES

**Step 9.3: Exception categories**
Record: Could qualify as a "build/correctness fix" for a specific
driver, similar to a hardware quirk fix. Not a pure exception category,
but a trivially correct bug fix.

**Step 9.4: Decision**
This is a genuine, trivially-correct bug fix for incorrect register-bit
computation affecting hardware LED blink on Intel LGM SoCs. The fix is 1
line with zero regression risk, applies cleanly to all stable trees, and
has been in a buggy state since v5.12. The user-visible impact is narrow
(LGM-based networking hardware with hw_blink) and the failure mode is
non-critical (wrong LED blink behavior, not
crashes/corruption/security). It doesn't meet the "important issue"
threshold strictly, but it is exactly the category of "small, obvious
bug fixes" that stable rules welcome.

## Verification

- [Phase 1] Parsed subject/tags: single `Signed-off-by: Lukas Kraft` +
  committer Lee Jones; no Reported-by/Tested-by/Fixes/Cc: stable.
  Confirmed by reading the commit header.
- [Phase 2] Diff analysis: confirmed single 1-line change to macro
  parameter name in `drivers/leds/blink/leds-lgm-sso.c` line 28.
- [Phase 2] Semantic analysis: compiled a small C test
  `/tmp/test_macro.c` demonstrating that the buggy macro produces 154
  (using the captured `pin=25`) while the fixed macro produces 10 (using
  argument `off=1`).
- [Phase 3] git blame -L 28,28: buggy macro introduced by
  `c3987cd2bca34` ("leds: lgm: Add LED controller driver for LGM SoC"),
  2020-12-10, first release v5.12-rc1.
- [Phase 3] git describe --contains c3987cd2bca34 → `v5.12-rc1~17^2~9` -
  confirmed v5.12 is the origin.
- [Phase 3] git log --author="rebootrequired42@gmail.com": no prior
  commits by this author - first-time contributor.
- [Phase 3] git log on file: no dependencies; standalone patch.
- [Phase 4] b4 dig -c 0e2287999f04: found original submission at https:/
  /lore.kernel.org/all/20260312210958.48467-1-
  rebootrequired42@gmail.com/
- [Phase 4] b4 dig -a: v1 only, no evolution.
- [Phase 4] Read /tmp/leds-lgm/thread.mbox: confirmed Lee Jones (LED
  subsystem maintainer) applied it directly via b4-ty without additional
  review comments; no reviewer objections or stable suggestions.
- [Phase 5] grep GET_SRC_OFFSET in the file: single caller at line 226
  inside `sso_led_freq_set`, which has `u32 pin` as function parameter
  (confirming the macro body references this parameter in the buggy
  form).
- [Phase 5] Traced call chain: `sso_led_freq_set` → called from
  `sso_led_blink_set` (sysfs blink_set callback) and `sso_led_hw_cfg`
  (probe-time setup when hw_blink is set).
- [Phase 6] git show v5.15:drivers/leds/blink/leds-lgm-sso.c | grep
  GET_SRC_OFFSET: confirmed bug present in v5.15 with identical form.
- [Phase 6] Same verification for v6.1, v6.6, v6.12 - all have the
  identical buggy macro and file location.
- [Phase 8] Failure mode: `GENMASK(h, l)` with l > BITS_PER_LONG is
  undefined; `val << high` with high > 31 on u32 is also undefined per C
  standard. Verified the computed low/high values are out of 32-bit
  register range for all LGM-valid pins (24-31) via my test program.
- UNVERIFIED: I did not build and boot on LGM hardware to confirm the
  LED blink misbehavior in practice; my assessment relies on code
  analysis of the register interactions.

## Summary

This is a real, trivially-correct 1-line bug fix for a 5-year-old macro
typo in the Intel LGM SoC LED driver. The macro parameter name (`pinc`)
didn't match the identifier in its body (`pin`), so the macro silently
captured the function's `pin` parameter instead of the argument passed.
This causes incorrect register-bit computation in `regmap_update_bits()`
during hardware LED blink setup, affecting LEDs on pins 24-31 of the
Intel Lightning Mountain SoC.

The fix is obviously correct, zero-risk, applies cleanly to all stable
trees (5.15.y, 6.1.y, 6.6.y, 6.12.y), and the bug exists in all of them.
The impact is narrow (specific SoC hardware) and severity is moderate
(incorrect hardware register programming, not
crashes/security/corruption), but the patch is exactly the small,
obviously correct fix that stable policy welcomes.

**YES**

 drivers/leds/blink/leds-lgm-sso.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index 8923d2df47049..99cfb8c1bb3f8 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -25,7 +25,7 @@
 #define LED_BLINK_H8_0			0x0
 #define LED_BLINK_H8_1			0x4
 #define GET_FREQ_OFFSET(pin, src)	(((pin) * 6) + ((src) * 2))
-#define GET_SRC_OFFSET(pinc)		(((pin) * 6) + 4)
+#define GET_SRC_OFFSET(pin) 		(((pin) * 6) + 4)
 
 #define DUTY_CYCLE(x)			(0x8 + ((x) * 4))
 #define SSO_CON0			0x2B0
-- 
2.53.0


