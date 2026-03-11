Return-Path: <linux-leds+bounces-7268-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DTBM/3osGkSogIAu9opvQ
	(envelope-from <linux-leds+bounces-7268-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 05:01:01 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D4025BC68
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 05:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B76E3308AF72
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 04:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A30D301704;
	Wed, 11 Mar 2026 04:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TdKZSic8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7F118A6D4
	for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2026 04:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773201649; cv=none; b=mF0tVZ2aLjiDHhPTqUhR+7GxJp4axm4WHVQ4YCsEvdELQQRtI6vywANgthWab/glx7Vk4a7otSnHGMdwRGLkUntMKT7LtLeXUUal7W/IrMRvbTiHEE7S0WBMRx1W1DG+RzZrl2qxpE7k9Kd4Vc68tIPG2514VcSMWuj/IBOTbWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773201649; c=relaxed/simple;
	bh=ZvZcJwf6UNxXQbN0h7ibdXj+y4PHrwoJvvNmA+GpjK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oWE/OecrYmpfrFnJzD2lJbrS8IADeo7gxqE4idDl34XkoLc/Ra4Jf5wvlTwrxG03avYdBe6xIxY0BFZSbD5j9uNDrKl6jYOIhhVFSL50FIF6/3NdR3+dF1dxbMLr9W6CtbDPGf18HPHn7En2ah+jJevWPq9D+UWfxFnMFZ/cKAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TdKZSic8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48540355459so21918005e9.3
        for <linux-leds@vger.kernel.org>; Tue, 10 Mar 2026 21:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773201645; x=1773806445; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZoWCr+BRYQvuE8DXa9YjC7QPti3UnL9FTGPdpkKDX0=;
        b=TdKZSic8DOl3IG5ZoxdosJaV2yEFeBxrOXBLrbyH91ybzN3CV3oUloEtrXLaphozs0
         +MkJrN9o8fpKH1LSbndFYqkblPegwANKGK3POKw6wTJL7RAjkLwiiY1fK3pTzu+Z+ajE
         qQf+iKzT895GIyK7kGiQTrsaAQtXvtKiFiWwqSNB/Lwe2MljJuakUxx6GL6wAzu+C/wR
         X2O8QV+Bw+WihJt6vjnu2rxUjQeT0sRzg2221OKhCfQWXSq8oDe1Oaexfw6n8kImL5D/
         6/V5ZTrulyVQV/1I1uOslBlH1re97OZluKPvfpbuM9ztCsMexP9Y7BAW3EE/cwg7KpSm
         1dOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773201645; x=1773806445;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZoWCr+BRYQvuE8DXa9YjC7QPti3UnL9FTGPdpkKDX0=;
        b=Ht70DGQaTjm7c9pVfoaTSfw9OxLUqkYtKVQW+6gLAF+MW/gUeTcRx3ui1Lg+qexA6D
         ySEwLy9/MDNH71QT5gvVhz1xNJPXtnQ9+yYH+2flAI7nHluus47VSmICrrO9iTzq6wnZ
         /boXkKkiM6Cc3r71+dZUK/e61TeNGsh2JZFLzVx10JSxOgOCWFBiqQSbhTRJqyfhFKtR
         lxnURSyR8wfp5i+dHRabbZk27EzW9I55yaJN4ZlterAqaI47XJwMmMACFl4wS1i47hUz
         Mc1llFYwuJEwNooi4amhHFBpXFsZzgaRNzxtvcIrONvIEvBFOAoOmr5X7K455uenUFGg
         LxMg==
X-Forwarded-Encrypted: i=1; AJvYcCWsQIaOFMqSLezgXJxocg66250kDV3/YulrtuBA0zekFhlXG5Sx2leNMluZuNW78+7SU37EQd7WvfnC@vger.kernel.org
X-Gm-Message-State: AOJu0YzgWyBOy8sgnVRGAPEtV7eYLDaY/upT8M9G+ViOZ5vYfAn1Qejd
	D/+ULmGDrKSHxrAIKYMtNhQ3ID5dD3Pxih0K/2qgP9ie1NpxBOeAD8eVKF4CpUoPuvo=
X-Gm-Gg: ATEYQzwiUV/3xl7kzeNpE7UYE/8qfwBHhNI9nkJypoTqff7DKhYbhi+gg+LtLF7SwFB
	JXxAi1PBCaqiTuwMQtxd/gVQNAdgFPIbFuTOiVrCTmzujdzK/m925l26tbphznPMOM48MGh2qXG
	IZEmPJzaGb4U0+yEU2RnIC/H27RD1g7RQbbnkixVAC/mzm9Ogcw60jk3VSHz1JGxwnfT94g1L7O
	1NCaBd+aEf842c/PQlmom5niUtv39lbzC+8xiZDoxVlN6VsEVqZa1NBVkr9dHV8mGTmiHdJLMEu
	qt+/CIeNgNfioNzWJ4EoycmR3S0gtJ711du0WiNUiHU5hb5IAr4LC1P6afqLMZMzqSv9U7NXPFr
	tFtNd0q1zUvw6GIaMR1hCBR1QqpQvBZVbdTusud927ZXECpAKlyTVrynNJ0wlR3y/YiFbCnnOTv
	dZDlnut219kMcWhW71cp+HYIZIXWFhL1zCH8MMvdk/WgTNpP9veGGz4QxX+NPf1Goh2w==
X-Received: by 2002:a05:600c:8483:b0:485:3c8f:e4ce with SMTP id 5b1f17b1804b1-4854b10093bmr16309895e9.18.1773201645487;
        Tue, 10 Mar 2026 21:00:45 -0700 (PDT)
Received: from r1chard (36-228-122-64.dynamic-ip.hinet.net. [36.228.122.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae22287dsm7641795ad.12.2026.03.10.21.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 21:00:44 -0700 (PDT)
Date: Wed, 11 Mar 2026 12:00:41 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>
Subject: [PATCH] leds: lm3642: use guard to simplify locking
Message-ID: <20260311040034.25937-1-richard.lyu@suse.com>
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
X-Rspamd-Queue-Id: 38D4025BC68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7268-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard.lyu@suse.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The mutex_lock()/mutex_unlock() pattern requires explicitly pairing
lock and unlock calls. Use guard(mutex) instead so the lock is
automatically released when the scope exits.

Convert to guard(mutex) in lm3642_torch_brightness_set(),
lm3642_strobe_brightness_set(), and lm3642_indicator_brightness_set().
Add #include <linux/cleanup.h> to support scoped guards.

Signed-off-by: Richard Lyu <richard.lyu@suse.com>
---
 drivers/leds/leds-lm3642.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index 61629d5d6703..ee957d4da882 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -12,6 +12,7 @@
 #include <linux/fs.h>
 #include <linux/regmap.h>
 #include <linux/platform_data/leds-lm3642.h>
+#include <linux/cleanup.h>
 
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


