Return-Path: <linux-leds+bounces-347-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1500C80F9A4
	for <lists+linux-leds@lfdr.de>; Tue, 12 Dec 2023 22:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B06E01F2170B
	for <lists+linux-leds@lfdr.de>; Tue, 12 Dec 2023 21:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A64764145;
	Tue, 12 Dec 2023 21:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3TKEoD2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DF864157;
	Tue, 12 Dec 2023 21:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDE0C433C7;
	Tue, 12 Dec 2023 21:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702417543;
	bh=61xu+OcPj5V/1U8yttDpwKsOSr89T9ROKbwgf4LauZA=;
	h=From:To:Cc:Subject:Date:From;
	b=T3TKEoD2DFoTDRZykH5hmLSR6hlqT0AnBgKiI3oIuSwoqnWxisE4jV/vsLrsRXeEK
	 0WZtTjZAjZYgIYHeFiTT6MIU2qeh0t8gVZ0/oco5JFhrqOFVIjTSoeQNoQVqzFKqbk
	 elZeBAu284TS6ifRfnpUQjTqccQO9uuxZM4P0IJ+QVYDnm2MYgYYU/QZ3etN4oPOVY
	 NLgzc8OcdUVl3a+jVOD2dXqNTDKTZLDSfwS3V7zvb8dnY6bAboBZ8Tu3wcUnHnRYz+
	 1vo7iRWVaKZ6M/VqexWF3wTR8ah4R0yZZ0lg45/S2pFBrVNkSpLF2TQDTqEElGPxPM
	 rTZwO2qzO3u/w==
From: Arnd Bergmann <arnd@kernel.org>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] leds: sun50i-a100: avoid division-by-zero warning
Date: Tue, 12 Dec 2023 22:45:22 +0100
Message-Id: <20231212214536.175327-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_COMMON_CLK is disabled, e.g. on an x86 randconfig compile test,
clang reports a field overflow from propagating the result of a division by
zero:

drivers/leds/leds-sun50i-a100.c:309:12: error: call to '__compiletime_assert_265' declared with 'error' attribute: FIELD_PREP: value too large for the field
        control = FIELD_PREP(LEDC_T01_TIMING_CTRL_REG_T1H, timing->t1h_ns / cycle_ns) |

Avoid the problem by adding an explicit check for the zero value here. Alternatively
the assertion could be avoided with a Kconfig dependency on COMMON_CLK.

Fixes: 090a25ad9798 ("leds: sun50i-a100: New driver for the A100 LED controller")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/leds/leds-sun50i-a100.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-sun50i-a100.c b/drivers/leds/leds-sun50i-a100.c
index e4a7e692a908..171cefd1ea0d 100644
--- a/drivers/leds/leds-sun50i-a100.c
+++ b/drivers/leds/leds-sun50i-a100.c
@@ -303,9 +303,13 @@ static void sun50i_a100_ledc_set_timing(struct sun50i_a100_ledc *priv)
 {
 	const struct sun50i_a100_ledc_timing *timing = &priv->timing;
 	unsigned long mod_freq = clk_get_rate(priv->mod_clk);
-	u32 cycle_ns = NSEC_PER_SEC / mod_freq;
+	u32 cycle_ns;
 	u32 control;
 
+	if (!mod_freq)
+		return;
+
+	cycle_ns = NSEC_PER_SEC / mod_freq;
 	control = FIELD_PREP(LEDC_T01_TIMING_CTRL_REG_T1H, timing->t1h_ns / cycle_ns) |
 		  FIELD_PREP(LEDC_T01_TIMING_CTRL_REG_T1L, timing->t1l_ns / cycle_ns) |
 		  FIELD_PREP(LEDC_T01_TIMING_CTRL_REG_T0H, timing->t0h_ns / cycle_ns) |
-- 
2.39.2


