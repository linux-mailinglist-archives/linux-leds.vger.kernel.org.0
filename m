Return-Path: <linux-leds+bounces-7406-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEcNCBzFvGkY2wIAu9opvQ
	(envelope-from <linux-leds+bounces-7406-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 20 Mar 2026 04:55:08 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4E92D5A3C
	for <lists+linux-leds@lfdr.de>; Fri, 20 Mar 2026 04:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F41C301AAB3
	for <lists+linux-leds@lfdr.de>; Fri, 20 Mar 2026 03:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F97C2E6CA6;
	Fri, 20 Mar 2026 03:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fA2LG8xa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779161A9F8D
	for <linux-leds@vger.kernel.org>; Fri, 20 Mar 2026 03:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773978902; cv=none; b=jMjdU+6r7OH8v1B/vORAqpSJuZlRrLWAFNUQzde7NptzH4f2WaOE+FmMvPDGrppAJWkkGSqNeU+yF2jjUNTsHp8dLiY+/FzFwSAe6CzCaEERzDYdjN8cVmmhrvhWFeqWxldv+uJjeKiyvvqrJ/3r2pMW9npbKOXJ/rin0cDsn7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773978902; c=relaxed/simple;
	bh=81BNlKOq7HXsOqhkN/MlVRcuihbkxdhNzCRuIrb0v34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MZljlMUJMRvMn1sU129dReAfwEdDzmkiMH9UXvX+Z4w9NlWrEpaOgHKS3wLgt2vcBQGYu0yC6RVHVhiRawqomDT9F8/VdVfUZ+YdDim/HJvyJ0uDe/5XfXZsVS+iFra9/GZP/tBPwoCUAblBcP50vz46tN8K1IvKu+Maqw25D6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fA2LG8xa; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486507134e4so18891955e9.0
        for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 20:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773978898; x=1774583698; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FZPeaElYrVk/ldeIQ29YBPboU4/yGlx0Qb+/RBeWqLs=;
        b=fA2LG8xamLvU8UQrd4mqzISmLDpr5IGKHjsMxWu00t04h3AkVuTwk3R7AWnlTeGm2H
         +3gVpWWjZzV4Ydra9q5yvDvclWOtInu1mS6aCtDmiy7nLRa3bzk67ns1DdVM+EabQsK6
         I/smW3a20tRQzjhUaXati1/M4UmSIBNM154FFk6i94n/SxSfo8Q4nSWwTPzFZxxd+1Le
         lC5XmByBzobPfs+6bRWXH/NNT4e0iu+yiTjCoc5OJ1rkE4ArutFs0xmp4e/hqdCBJ3qS
         /5xriXBUGxJMWoFqRWyxT1+ol/pmvzBKBvqmKMRX+1xWrF2Kj+Fyb9WN9N0uvgzdIDiV
         RHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773978898; x=1774583698;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZPeaElYrVk/ldeIQ29YBPboU4/yGlx0Qb+/RBeWqLs=;
        b=iuNSaqI55V0Cy3SsVP9caw81vm326zJfDxOtEONLvJfuIXjj/2un4Ayty2BUpLcUb7
         mIQBJJZLGkb0Yd7KEEiNlI9QL2bMOq7Xw6mNiqmmaTbV3Owpo07BaB+myykm/P2znsob
         c0NpbCQyTNSLPXDCoPTuZF9KHZQgo2we0RWSPS/SiwTfRr6sDmxs1sqIIPxO8Mx97Uy0
         Zc52hVxIVO6onI3Lcc1nfc391NXpLGR+5zhUQPFihOU3+vadr5Sd0hbSFvtSjMMwfSTU
         rTBqmENjRP7NA9L3lfhM1MnVln1e3qJARUCgTFwpS1Y4/l9OCUJOidLqiYgFhUIKtdEt
         j9HA==
X-Forwarded-Encrypted: i=1; AJvYcCWAxJ76IFk7aX3hoUo2ncWtP0btW6DPSUYRA8+GX4C6+WzYcghZHMCmcDi8o8NSfzlN+7SWr97UF/YT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+arYh2xtQQWlz1lJJ0afCIzaLgmrbs3z9vGy072OzrvBjQZOq
	k/orMXoqiBGbKYmjp2/giKZ3ivfm7qwPS5CW6Vg6yMEd6V72CrrT1hN0MaH1/qHBR2Y=
X-Gm-Gg: ATEYQzyfFBUSILLqyQ8uynhddKnXKo6Bp38BTaQ8X3TG8sWZcmca/Xu8gwzmz9H7My1
	MOxT4ShzdFXfsZPDhafGDwpUCb+t7J41xmN5VbrggigP5FQJQTX1ln5vJqC3/Tqs6G2UaHiEUqb
	SsA/hPMrSsdODQpDoWK0prLj6zSOi0x1WC/HEhqHw40+7se78Gqbw55jCV42zPnv8pFPKk5A3Lw
	8OGqdnIfmgWSGQhR9huqrQGhzzhQl+/3erPyCDG+ZoHYdqs46wToN+aHFY3tlGQzIT+oPF8BX49
	JyNaAJuKemCtEIMy4IXp1Xcr7u+YEtOHJPyTffR8Um38GLbMz/CqT9LWKsMVWjgbbyKGymYjOWP
	PFhL9q0WwCHexz/PIP9qnqpOnNk4h9uglXzigofPCohU/tX1tllzPG109OK3tL74KcLms89uGjF
	PsZ6hAAr0nL/L3jHK1eLgsmRQeIJ3rdJ0HT4XzU0trY/CtrUm8qg==
X-Received: by 2002:a05:600c:8b61:b0:482:eec4:76d with SMTP id 5b1f17b1804b1-486fee12d23mr19037215e9.17.1773978897653;
        Thu, 19 Mar 2026 20:54:57 -0700 (PDT)
Received: from r1chard (1-164-68-48.dynamic-ip.hinet.net. [1.164.68.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3370sm7236965ad.78.2026.03.19.20.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 20:54:56 -0700 (PDT)
Date: Fri, 20 Mar 2026 11:54:52 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>
Subject: [PATCH v2] leds: lm3642: use guard to simplify locking
Message-ID: <20260320035451.31071-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.0
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7406-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard.lyu@suse.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: 8B4E92D5A3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The mutex_lock()/mutex_unlock() pattern requires explicitly pairing
lock and unlock calls. Use guard(mutex) instead so the lock is
automatically released when the scope exits.

Convert to guard(mutex) in lm3642_torch_brightness_set(),
lm3642_strobe_brightness_set(), and lm3642_indicator_brightness_set().
Add #include <linux/cleanup.h> to support scoped guards.

Signed-off-by: Richard Lyu <richard.lyu@suse.com>
---
v2:
- Sort includes alphabetically as requested by Lee Jones.
- Rebase this patch on top.
- Link: https://lore.kernel.org/all/20260319151539.GO554736@google.com/
---
 drivers/leds/leds-lm3642.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index 61629d5d6703..36246267b096 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -3,15 +3,16 @@
 * Simple driver for Texas Instruments LM3642 LED Flash driver chip
 * Copyright (C) 2012 Texas Instruments
 */
-#include <linux/module.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
+#include <linux/fs.h>
 #include <linux/i2c.h>
 #include <linux/leds.h>
-#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/platform_data/leds-lm3642.h>
 #include <linux/platform_device.h>
-#include <linux/fs.h>
 #include <linux/regmap.h>
-#include <linux/platform_data/leds-lm3642.h>
+#include <linux/slab.h>
 
 #define	REG_FILT_TIME			(0x0)
 #define	REG_IVFM_MODE			(0x1)
@@ -202,10 +203,9 @@ static int lm3642_torch_brightness_set(struct led_classdev *cdev,
 	    container_of(cdev, struct lm3642_chip_data, cdev_torch);
 	int ret;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	chip->br_torch = brightness;
 	ret = lm3642_control(chip, chip->br_torch, MODES_TORCH);
-	mutex_unlock(&chip->lock);
 	return ret;
 }
 
@@ -249,10 +249,9 @@ static int lm3642_strobe_brightness_set(struct led_classdev *cdev,
 	    container_of(cdev, struct lm3642_chip_data, cdev_flash);
 	int ret;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	chip->br_flash = brightness;
 	ret = lm3642_control(chip, chip->br_flash, MODES_FLASH);
-	mutex_unlock(&chip->lock);
 	return ret;
 }
 
@@ -264,10 +263,9 @@ static int lm3642_indicator_brightness_set(struct led_classdev *cdev,
 	    container_of(cdev, struct lm3642_chip_data, cdev_indicator);
 	int ret;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	chip->br_indicator = brightness;
 	ret = lm3642_control(chip, chip->br_indicator, MODES_INDIC);
-	mutex_unlock(&chip->lock);
 	return ret;
 }
 
-- 
2.51.0


