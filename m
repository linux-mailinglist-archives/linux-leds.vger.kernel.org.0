Return-Path: <linux-leds+bounces-4746-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25822AD0578
	for <lists+linux-leds@lfdr.de>; Fri,  6 Jun 2025 17:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 752363B1E45
	for <lists+linux-leds@lfdr.de>; Fri,  6 Jun 2025 15:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C3B19D071;
	Fri,  6 Jun 2025 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3IWSPpP"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70094193077;
	Fri,  6 Jun 2025 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224532; cv=none; b=d2XdiKSRpEaKLs0bicJ06Oy+oS1qq0GBt5zzJF7jXA6J2m9M2YwpyLqZ6i/qpGFa3onpDp4Cy/4vACjO34BtvaowCNjF9aXv18xAmHmOY83sBukCahquCWeTw5dCFV7pwzf9Oly6U0gAXZSElCPZl5jB5yQXiLhJuH8ijE18s78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224532; c=relaxed/simple;
	bh=Q/9t3W0Akn7JDP7lgH6Ojq2c7DcD93Wg1AQsXJMpUXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gtT2a0cfFDGZYNcI2EvnZHUHQ8lWSdhUIL3rCO93ouGeVcuLujTMH0ts2IAECqY6rb7do1qbWVoIqIfnfgrhPKvtTsk/6OP8AnqGAL9suiVZsw4zQZPhE/j12AfnuoPMBGhHEabJqK0yJkoLFz0VGo/gObgEcje5nZaBMZ5Ijps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3IWSPpP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F7EC4CEF1;
	Fri,  6 Jun 2025 15:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749224532;
	bh=Q/9t3W0Akn7JDP7lgH6Ojq2c7DcD93Wg1AQsXJMpUXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F3IWSPpPASOyoVrj2eJKMXClJyNL9h/LzjDuP06l64iKb3udB7Gv7+vQam+SmqoGW
	 Xwldr7HBHm5CBAxWldnIeuylh7rN2ziRNdwnjlSdM6CK5KCJyHrltd4WGE0tMY9B0m
	 icdgddygSxI+oKrGu+FBvCH2w8T33Fk0f22reHhXAQzLpDVGs8jwQIyekU31sh6QW6
	 PCdlGN7wSqYnJ037n8onDuxrzatVRgQnBlQA6qeK4tCHEdrH9w0HQI7lLQJQ+McFwQ
	 7+HED7YBvahaUPa3+ET0DeshuIz2MQgtobDPM2K27XjZVWSgbDtRfrURNutLQdqxTk
	 n4/39o0oz6EfA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Tobias Deiminger <tobias.deiminger@linutronix.de>,
	Sven Schuchmann <schuchmann@schleissheimer.de>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	pavel@kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 16/21] leds: multicolor: Fix intensity setting while SW blinking
Date: Fri,  6 Jun 2025 11:41:41 -0400
Message-Id: <20250606154147.546388-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250606154147.546388-1-sashal@kernel.org>
References: <20250606154147.546388-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15.1
Content-Transfer-Encoding: 8bit

From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>

[ Upstream commit e35ca991a777ef513040cbb36bc8245a031a2633 ]

When writing to the multi_intensity file, don't unconditionally call
led_set_brightness. By only doing this if blinking is inactive we
prevent blinking from stopping if the blinking is in its off phase while
the file is written.

Instead, if blinking is active, the changed intensity values are applied
upon the next blink. This is consistent with changing the brightness on
monochrome LEDs with active blinking.

Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Tobias Deiminger <tobias.deiminger@linutronix.de>
Tested-by: Sven Schuchmann <schuchmann@schleissheimer.de>
Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Link: https://lore.kernel.org/r/20250404184043.227116-1-sven@svenschwermer.de
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Now I have a complete understanding of the commit. Let me analyze this
commit for backport suitability:

**YES**

This commit should be backported to stable kernel trees for the
following reasons:

## **Bug Analysis:**

**The Problem:** In the multicolor LED driver, writing to the
`multi_intensity` file unconditionally calls `led_set_brightness()` at
line 62. When software blinking is active (`LED_BLINK_SW` flag set),
this can incorrectly stop the blinking if the LED is currently in its
"off" phase during the blink cycle.

**The Fix:** The commit adds a check `if (!test_bit(LED_BLINK_SW,
&led_cdev->work_flags))` before calling `led_set_brightness()`. This
ensures that when software blinking is active, the intensity changes are
deferred and applied on the next blink cycle instead of immediately
stopping the blinking.

## **Backport Suitability:**

1. **Bug Impact:** This fixes a clear user-visible regression where
   adjusting multicolor LED intensity incorrectly stops blinking - a
   functionality that users would expect to work consistently.

2. **Code Quality:** The fix is minimal, surgical, and follows
   established patterns in the LED subsystem. Looking at the LED core
   code (`/home/sasha/linux/drivers/leds/led-core.c`), similar checks
   for `LED_BLINK_SW` are used in `led_set_brightness()` to handle
   software blinking properly.

3. **Risk Assessment:** The change is extremely low-risk:
   - Single line addition with a simple conditional check
   - No architectural changes
   - Uses existing, well-tested flag (`LED_BLINK_SW`)
   - Consistent with established LED core behavior patterns

4. **Subsystem Scope:** The change is confined to the multicolor LED
   class interface, affecting only multicolor LEDs, not the broader LED
   subsystem.

5. **Backport Indicators:** The commit has explicit support from
   maintainers with multiple "Acked-by", "Reviewed-by", and "Tested-by"
   tags, indicating thorough review and validation.

6. **Consistency:** This aligns with similar commits marked as backport
   candidates (like Similar Commit #4 which was marked YES for fixing
   LED core blinking regression).

## **Historical Context:**

From the similar commits analysis, LED blinking fixes that restore
expected behavior (like Similar Commit #4) are consistently backported,
while new features or documentation-only changes (Similar Commits #1,
#2, #3, #5) are not.

This commit clearly falls into the "restore expected behavior" category
- multicolor LED intensity adjustment should work consistently
regardless of blinking state, just like it does for monochrome LEDs.

The fix ensures behavioral consistency between multicolor and monochrome
LEDs during blinking, which is exactly the type of user-facing bug fix
that stable trees are designed to address.

 drivers/leds/led-class-multicolor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
index b2a87c9948165..fd66d2bdeace8 100644
--- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -59,7 +59,8 @@ static ssize_t multi_intensity_store(struct device *dev,
 	for (i = 0; i < mcled_cdev->num_colors; i++)
 		mcled_cdev->subled_info[i].intensity = intensity_value[i];
 
-	led_set_brightness(led_cdev, led_cdev->brightness);
+	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
+		led_set_brightness(led_cdev, led_cdev->brightness);
 	ret = size;
 err_out:
 	mutex_unlock(&led_cdev->led_access);
-- 
2.39.5


