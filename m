Return-Path: <linux-leds+bounces-8997-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VzKBCmCZUGru2AIAu9opvQ
	(envelope-from <linux-leds+bounces-8997-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 09:04:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 697E2737E54
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 09:03:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="c52/M0At";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8997-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8997-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D01CE302C6E4
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 07:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750A63BBFB4;
	Fri, 10 Jul 2026 07:02:07 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067023BE652
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 07:01:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666923; cv=none; b=e1eCV93oL6pw3DTX3jFAcIu5fGPCkkFv1EUrlL3NlfnQvDmn1elI4R12DJM+0W4Jrr4IkHuxuC+efQFD09Wvsq/XHcIHS1ABOBIgbbudwck8pt6PpvHLRmjD9rwigWiEltr1vfbAtRzOd0sDETuzdRo+fFs7oB6hQuC0wWH8nQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666923; c=relaxed/simple;
	bh=Sa+ZMM5dTNjCDBOF2MATzUebRnFH0dCZpZVATJCDrms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Smq6hp9vg6iZ6JRefqp4M7VxU38MIV7g4/BtFVhUZLnbAWOyQHNtt0K/K75ND+ykaG0v9wLZz/IusdyLoQ7s1MWsw8yp1pLsmqppk15Esq3R+y7QfY9otTaL/8z04fB90ecRGUkKMr9dFf4jzOJCUr6TAiAVgDRtRrGWEJ7FFU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c52/M0At; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493ed9d8c5cso3601995e9.1
        for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 00:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783666914; x=1784271714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KiDkE10v4AFJNJVFDsx15gyYeOOnHnd5nJ5DdCHOga8=;
        b=c52/M0AtYHCt4A4mpXCzRxUMWSrQTiBMZvwthstSEIB0CgkZWvQzVdqLLEpMxjYeFB
         RdVou8ykYChLgBI8lBeP47hPme5JjwijCumbldghHwpJ8imGxCLiNaXC1o8EJGmBXSMy
         C4JTIpGQM7USho9FMz0LRec3Dj8WvibME8IvmPBJVCUFwInb39oH1U+BtqgZ1VFs6ifn
         0NgLQKcnpMwDCjJzUzwDs6FRfgwDlRLayIkUt6VSgGNz0U4DGq8GJm6E+ah03IdmstWP
         cl1oyT+9s0vWAKBnHjcCzVGLKUjRp37e96jLNv1Vc7Ap2sm9ph+DoB2kMAtu7UKzjYWu
         MHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666914; x=1784271714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KiDkE10v4AFJNJVFDsx15gyYeOOnHnd5nJ5DdCHOga8=;
        b=AvYyHrwhHs7q5mi8ER5Dxg1Iyr4zODOHxUxyKGk52kDSSULr4/ed46D68qDYdLWXHB
         N/RoOpaClgxtIVOxkXTqyUguv1J49J+9Zbi5aZp49OC2U3xr6N3adZK0tAVsYZM6q+Tw
         ndxzOLMtMFZLSDUtlHk+ax4SlY5mq47vmlly4VyJ+HWBLk+Y/jBD5v5bQgY2Ak/ABwR4
         GlXPrEErC6agAtUrjyn0Ypx0nmfN3qfx2VLUSCVVPWJt5NaaJNAH5RtWt4ZVEF175mlH
         EelcvR4VXBiUFpdJbz384dYRRNtgNv+a/0dFp/YZW3I2rvTpCKmK5d+ibX+sMB41TSwl
         fEGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqW1MNRCUjhoACI8k6gJwugr2IZjSqp6r6I0xC9lRENJ+nFFLY8ySWGTcBUJE51sW8yjYYWfRDIJaUE@vger.kernel.org
X-Gm-Message-State: AOJu0YwEM7DZ4HU+O7L6AaMbN9fJjSpsR37f+qqrdoV4+QyAC8Csie7v
	yyhdGSMuQxpoxuCoFPROhiwMgZf2W9nir2fvxICp6MgksiEppjizsP21
X-Gm-Gg: AfdE7cnVON+sXap4e5SSve973YJQsTYMIiSkGIOtt8t6THYq6L1VBF/eBAnfWlCWX9y
	iq6s/vII42t4buJndtlnrxrYyrAxpqMY6vbDwmh3cozWEzBi+aEYbO01ALffHaNDoz0UCUnP4X4
	VY9OFDxx3R3+hyrLWmU+3LlktExIPDg9oKx+tGWTNWkqRlGbGcw8hse+Azx9V3sUez8EdOPDnv1
	oRIWMDR6GyECFpDIeB3i0IfouiTHKAHL/TvXnUOoFIcvh8VOECj/FLRKbfHn+Sr3UyQBXwQ2Gyc
	RVB9jyNgPMicDWeYdHEi5Di7EF5eIcKbqdrc2Gbp78Cu8fxbsFJQCbcQk/gatJJZb+gfi76Ebe8
	rYbNCa9YjTOrX3zEi8MMvMaw6Od+QJMCExK+74wcQKxz02+C7qCenveacFGxdN+BHDczq9Qk4DM
	OmGddB/ypbj9CJtfhTteKQXCgv0LWdzkFF9dmyDWIwgeynuvdaYRthVDBntEuyvhMBsa9IieCV1
	tsb/3u5aQ67ClNRB7s=
X-Received: by 2002:a05:600c:3e11:b0:493:df1d:7488 with SMTP id 5b1f17b1804b1-493e6904b5dmr108220295e9.16.1783666913698;
        Fri, 10 Jul 2026 00:01:53 -0700 (PDT)
Received: from workstation.speedport.ip (p200300d5070afe7db3148fa84ed2ac78.dip0.t-ipconnect.de. [2003:d5:70a:fe7d:b314:8fa8:4ed2:ac78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb742d0esm114245665e9.13.2026.07.10.00.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:01:53 -0700 (PDT)
From: Mert Seftali <mertsftl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mert Seftali <mertsftl@gmail.com>
Subject: [PATCH v3] leds: pwm: Annotate leds[] with __counted_by()
Date: Fri, 10 Jul 2026 09:01:41 +0200
Message-ID: <20260710070141.37214-1-mertsftl@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8997-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-leds@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mertsftl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 697E2737E54

Add the __counted_by() attribute to the flexible array member leds[] in
struct led_pwm_priv so the compiler and runtime (e.g. FORTIFY_SOURCE,
UBSAN_BOUNDS) can bounds-check accesses against num_leds.

For the annotation to be correct, num_leds must equal the number of
allocated elements before leds[] is accessed. Even taking the address
&priv->leds[i] is bounds-checked against num_leds under UBSAN_BOUNDS. The
driver allocates device_get_child_node_count() elements up front, so set
num_leds to that count right after allocation.

While here, pass the led_pwm_data element into led_pwm_add() instead of
the whole led_pwm_priv, so the helper no longer needs to index the array;
the caller walks a led_pwm_data pointer over priv->leds.

No functional change intended.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Mert Seftali <mertsftl@gmail.com>
---
Changes in v3:
- v2 followed the review suggestion to pass the element and increment
  num_leds in the caller. That is exactly what Sashiko caught: with
  __counted_by(num_leds), &priv->leds[num_leds] is bounds-checked, so
  incrementing num_leds from 0 as the loop runs trips UBSAN_BOUNDS on
  probe. num_leds is now set to the full count up front and the caller
  walks a led_pwm_data pointer, which keeps the element-passing and the
  dropped index variable, just without the running counter.

Changes in v2 (per Lee Jones review):
- Pass the led_pwm_data element into led_pwm_add() so it drops the priv and
  index arguments.

Build-tested only (no PWM-LED hardware). The __counted_by bounds behaviour
that motivated v3 was verified with a standalone UBSAN reproducer on gcc and
clang.

 drivers/leds/leds-pwm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 6c1f2f50ff85..d1116a5cb2b2 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -36,7 +36,7 @@ struct led_pwm_data {
 
 struct led_pwm_priv {
 	int num_leds;
-	struct led_pwm_data leds[];
+	struct led_pwm_data leds[] __counted_by(num_leds);
 };
 
 static int led_pwm_set(struct led_classdev *led_cdev,
@@ -81,10 +81,9 @@ static int led_pwm_default_brightness_get(struct fwnode_handle *fwnode,
 }
 
 __attribute__((nonnull))
-static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
+static int led_pwm_add(struct device *dev, struct led_pwm_data *led_data,
 		       struct led_pwm *led, struct fwnode_handle *fwnode)
 {
-	struct led_pwm_data *led_data = &priv->leds[priv->num_leds];
 	struct led_init_data init_data = { .fwnode = fwnode };
 	int ret;
 
@@ -167,12 +166,12 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		}
 	}
 
-	priv->num_leds++;
 	return 0;
 }
 
 static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 {
+	struct led_pwm_data *led_data = priv->leds;
 	struct led_pwm led;
 	int ret;
 
@@ -193,7 +192,7 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 
 		led.default_state = led_init_default_state_get(fwnode);
 
-		ret = led_pwm_add(dev, priv, &led, fwnode);
+		ret = led_pwm_add(dev, led_data++, &led, fwnode);
 		if (ret)
 			return ret;
 	}
@@ -217,6 +216,8 @@ static int led_pwm_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->num_leds = count;
+
 	ret = led_pwm_create_fwnode(&pdev->dev, priv);
 
 	if (ret)
-- 
2.55.0


