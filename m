Return-Path: <linux-leds+bounces-8290-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBf6ExM4EGoaVAYAu9opvQ
	(envelope-from <linux-leds+bounces-8290-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 22 May 2026 13:03:47 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDC75B2ABA
	for <lists+linux-leds@lfdr.de>; Fri, 22 May 2026 13:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57A81309C26B
	for <lists+linux-leds@lfdr.de>; Fri, 22 May 2026 10:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17343A8736;
	Fri, 22 May 2026 10:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="U4zpU1H9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160573CBE6D
	for <linux-leds@vger.kernel.org>; Fri, 22 May 2026 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446556; cv=none; b=lSxOWspTrA+geAqoTvGUVk+0iLglqNIrdZeJ+ujo0yNzUfnhYPZfz199m7Mo1e4dD//3ysvgXK1OJ0Y4kV6vrSVC0QpB4XFlfB8L1SqmYJ/teUTzdsQcIHyjzkBvIXFMX1qvXy2qrRDeQ00nKjYbhyg9cQdBlacUCVknZM5U88I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446556; c=relaxed/simple;
	bh=qC3NuzTC+Y9zM4l8C18q05G5ygUJ6l+SqsLs5fdLOJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hYmQX6dYMp3e7H6iwqEib4PZhcsDA2LY3buq9Lbfld6fE5/GJQ/7JGXZ2camSccClQ0zpBgyvEYnGzTtqDphAtHLRAuJtUzKmvXnVfakkDCcFe3cHhDFhpVRSjHM9kwgdrvzllEHZJUGxRhvcrx2VbXU7HlCaroi4zjRvk64uJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=U4zpU1H9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso62995855e9.2
        for <linux-leds@vger.kernel.org>; Fri, 22 May 2026 03:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779446551; x=1780051351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=twu4tUvSU+IUPoNbWGa7MQ6UoJQHEIJodbppCLFcH9o=;
        b=U4zpU1H9SjfqPeWoehQ9D4xlOZRvMz+rVBX7iCVBoMLUVOYLs0Ju5r/kgbqMtfg/J5
         JxO28rNl1eNaKs8FPs5f2DvMwmj5n+XmpGVIcCOLUHDqBeHLtPRdH0C31w9b3BtQhNa3
         H7XBzVMrf0VJeH1gJCfLtwu3DGjrb+SzmutBvmeVA6qdgmeUW3I9wB7HBJIMeZT8OVtw
         /sjhoK52939gwS6AJ+XOLWSzmSLmSnYJ/6LrzAJjSJOQ9xZ24n1ZutbNBaB/K0jMYcQd
         73iQrpj/3TS2OxoJsjK5vEz2TTd58OUtU5AyAL1AJ+MtG6BDA4BRhfz90ynUqXxUu5Wj
         KQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779446551; x=1780051351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twu4tUvSU+IUPoNbWGa7MQ6UoJQHEIJodbppCLFcH9o=;
        b=RmCJofsHCCT9FhwMkeyymxTh5W+5+RUNFbm2to2O8QgvFm2AwBJ+94auu7IBKZ9Byl
         HCW9uuQdnLjieX0N2D9Lq7GfvQSaNFjgeJKUyMgG3SyMG1XRXkzMDzYK5Miu73CrFAg/
         RmPleQQtjLB7VZyKp+kZgWqfxb4R0ZfPFyGOqDUgIKK0LqcrYAKH/MNbU94DnF5t7iA2
         rtMOfdOPTWbBGSsIxpt9QOcmtBDI/Sn6HN4WdRZf4FIVONkmVtDXSzPwyoAYeIY1WfaB
         JKq3Ec/FX4UtBuPysO5LLGvMipRKSSK+VDv63bKfG/ARX2glS+QWBAdCXuRihlSZqYXb
         uAhA==
X-Forwarded-Encrypted: i=1; AFNElJ+H4o7J7LXNS6zPmmx6O9y89KlG7JJdqzWZbwDtPyfE0y9JxhjPH5Ac1hw04UtZ2O+XB9ZXEhppr8oR@vger.kernel.org
X-Gm-Message-State: AOJu0YzKLzoJtVFZ31NWI/bFS86hjTfjPCtvxLigcQboVCqdh5gRduVf
	9vu/9Ps8IcmQHtF7jSacIpGPBkx1wEf0VO+Jt7lQO274pCdQlIIPgpy1fTTdfporAZk=
X-Gm-Gg: Acq92OEKpG5ymm5HEaM/XRKgaO3cGV5yc2WdpxUFj/6eJMXhRdK+vuz7eQiZ0b7Xg6m
	T32iMtf0WUToAZN4aSaC206k6TRweu9aaVxQ+BR337bIG8CDZzfj0cgi8TTx0KFgY8EEhSToGJA
	AIcGIqxka+OkQ8ujxrykv4A+0hoAuDKdPFhdPfWdE/RciHzqZaIkLGSrCddqLOiIKP0xdWwsPYc
	6f6TsXuj+iktia9o+yWxn7Im/2mHSOdSqcOUb/jxPESEDTYjNFWkRsJsRaeScePn0SdFEfYzcFx
	ijuTCGpxy/omtH5Yl2sIBVMKbNI+RnI7vom3dwIvAL86cF6/ipKC2k35Z4wGExRWEhvs4U5m6qx
	H486XzeuSpV5UVDXzS2CIUP7WT3xahj84A24sPllJGB/sSq/G1hwUVNmjtHT4eFVxuCIrUv+cDg
	vHSK4ejTF7qOShCW5qIVdG7ZGfR91/dGT9EyD3l7c9YZcv2SCqxuBCBFUS/kJTTttjx/+53sU7g
	zvevDqU8hLFidPdM5jFR/+hFA==
X-Received: by 2002:a05:600c:6208:b0:48a:599a:3716 with SMTP id 5b1f17b1804b1-490428d92a4mr37497985e9.23.1779446551173;
        Fri, 22 May 2026 03:42:31 -0700 (PDT)
Received: from localhost (p200300f65f47db041c3ec60b7ac1bfbb.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1c3e:c60b:7ac1:bfbb])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490428d698fsm12565705e9.19.2026.05.22.03.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:42:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Lukas Timmermann <linux@timmermann.space>,
	Jan-Simon Moeller <jansimon.moeller@gmx.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jonathan Cameron <jic23@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: Use named initializers for arrays of i2c_device_data
Date: Fri, 22 May 2026 12:42:22 +0200
Message-ID: <20260522104222.4081017-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=26650; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=qC3NuzTC+Y9zM4l8C18q05G5ygUJ6l+SqsLs5fdLOJs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqEDMODLcdI7BgKOtZhMgfn1vTwPb4GhB7NygJL E6xmbEc2TeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahAzDgAKCRCPgPtYfRL+ ToVyB/oCoXGbD52ccUArighfGzYTLu9rdp3uZFXIQ8pR8my+LoDeDu8HU8Gk0QLuZ4eQpx3idrG tNukDD9VtoIlhP3vRiYjHmzUy5bptAIlHtFKQVVv40+yQeMOXo5OtCNrwW7FCZBAFojKdGaKpwT bmi2HJlC6CyPwLT1UpWgtzDptuNJy/IluRBi2armR7qHJQGLsWTs+qNo0a563TYd7tEc4dYjvQa JfQBNJptM6bwulRpXM+V9ae9lP9ovymBw3wgQnwkn6qKo0huenFg8+WlcvSG37ZVw6kFuwiVt4y L7Mblu8xH5KGTllDw36QLMLNP0rM0aSkiBrf3rmm3d6wXsrB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8290-lists,linux-leds=lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,timmermann.space,gmx.de,gmail.com,iki.fi,kernel.org,ideasonboard.com,vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim]
X-Rspamd-Queue-Id: 4EDC75B2ABA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
i2c_device_id that replaces .driver_data by an anonymous union.

While touching all these arrays, unify usage of whitespace and commas.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

Changes since v1 (available at
https://lore.kernel.org/linux-leds/20260515163325.471175-2-u.kleine-koenig@baylibre.com):

 - s/  / / in leds-lp8501.c
 - also convert drivers/leds/leds-as3668.c which I missed due to not
   having
   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b24e1049a5a53f0912046a8f4112d2d43dec74e7
   in my tree.

Thanks to Alexander Sverdlin for pointing these out.

Best regards
Uwe
---
 drivers/leds/flash/leds-as3645a.c |  2 +-
 drivers/leds/flash/leds-lm3601x.c |  4 ++--
 drivers/leds/leds-an30259a.c      |  2 +-
 drivers/leds/leds-as3668.c        |  2 +-
 drivers/leds/leds-aw200xx.c       | 10 +++++-----
 drivers/leds/leds-bd2802.c        |  2 +-
 drivers/leds/leds-blinkm.c        |  4 ++--
 drivers/leds/leds-is31fl319x.c    | 22 +++++++++++-----------
 drivers/leds/leds-is31fl32xx.c    | 18 +++++++++---------
 drivers/leds/leds-lm3530.c        |  4 ++--
 drivers/leds/leds-lm3532.c        |  4 ++--
 drivers/leds/leds-lm355x.c        |  6 +++---
 drivers/leds/leds-lm3642.c        |  4 ++--
 drivers/leds/leds-lm3692x.c       |  4 ++--
 drivers/leds/leds-lm3697.c        |  2 +-
 drivers/leds/leds-lp3944.c        |  4 ++--
 drivers/leds/leds-lp3952.c        |  4 ++--
 drivers/leds/leds-lp50xx.c        | 12 ++++++------
 drivers/leds/leds-lp5521.c        |  2 +-
 drivers/leds/leds-lp5523.c        |  4 ++--
 drivers/leds/leds-lp5562.c        |  2 +-
 drivers/leds/leds-lp5569.c        |  2 +-
 drivers/leds/leds-lp8501.c        |  2 +-
 drivers/leds/leds-lp8860.c        |  2 +-
 drivers/leds/leds-lp8864.c        |  4 ++--
 drivers/leds/leds-pca9532.c       |  8 ++++----
 drivers/leds/leds-pca955x.c       | 12 ++++++------
 drivers/leds/leds-pca963x.c       |  8 ++++----
 drivers/leds/leds-pca995x.c       |  8 ++++----
 drivers/leds/leds-st1202.c        |  2 +-
 drivers/leds/leds-tca6507.c       |  2 +-
 drivers/leds/leds-tlc591xx.c      |  6 +++---
 drivers/leds/leds-turris-omnia.c  |  2 +-
 drivers/leds/rgb/leds-ktd202x.c   |  6 +++---
 34 files changed, 91 insertions(+), 91 deletions(-)

diff --git a/drivers/leds/flash/leds-as3645a.c b/drivers/leds/flash/leds-as3645a.c
index 2f2d783c62c3..5fefcaef3714 100644
--- a/drivers/leds/flash/leds-as3645a.c
+++ b/drivers/leds/flash/leds-as3645a.c
@@ -741,7 +741,7 @@ static void as3645a_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id as3645a_id_table[] = {
-	{ AS_NAME },
+	{ .name = AS_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, as3645a_id_table);
diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/leds-lm3601x.c
index abf6b96ade3d..8d00510c8967 100644
--- a/drivers/leds/flash/leds-lm3601x.c
+++ b/drivers/leds/flash/leds-lm3601x.c
@@ -465,8 +465,8 @@ static void lm3601x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3601x_id[] = {
-	{ "LM36010", CHIP_LM36010 },
-	{ "LM36011", CHIP_LM36011 },
+	{ .name = "LM36010", .driver_data = CHIP_LM36010 },
+	{ .name = "LM36011", .driver_data = CHIP_LM36011 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm3601x_id);
diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index a42cc4bc6917..4654a732d1b1 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -331,7 +331,7 @@ static const struct of_device_id an30259a_match_table[] = {
 MODULE_DEVICE_TABLE(of, an30259a_match_table);
 
 static const struct i2c_device_id an30259a_id[] = {
-	{ "an30259a" },
+	{ .name = "an30259a" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, an30259a_id);
diff --git a/drivers/leds/leds-as3668.c b/drivers/leds/leds-as3668.c
index b2794492370e..46427fe752a8 100644
--- a/drivers/leds/leds-as3668.c
+++ b/drivers/leds/leds-as3668.c
@@ -175,7 +175,7 @@ static void as3668_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id as3668_idtable[] = {
-	{ "as3668" },
+	{ .name = "as3668" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, as3668_idtable);
diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index fe223d363a5d..0d90eeb6448f 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -637,11 +637,11 @@ static const struct aw200xx_chipdef aw20108_cdef = {
 };
 
 static const struct i2c_device_id aw200xx_id[] = {
-	{ "aw20036" },
-	{ "aw20054" },
-	{ "aw20072" },
-	{ "aw20108" },
-	{}
+	{ .name = "aw20036" },
+	{ .name = "aw20054" },
+	{ .name = "aw20072" },
+	{ .name = "aw20108" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw200xx_id);
 
diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
index 2a08c5f27608..9732f41a1143 100644
--- a/drivers/leds/leds-bd2802.c
+++ b/drivers/leds/leds-bd2802.c
@@ -776,7 +776,7 @@ static int bd2802_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(bd2802_pm, bd2802_suspend, bd2802_resume);
 
 static const struct i2c_device_id bd2802_id[] = {
-	{ "BD2802" },
+	{ .name = "BD2802" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bd2802_id);
diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index 577497b9d426..42188926b2bb 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -805,8 +805,8 @@ static void blinkm_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id blinkm_id[] = {
-	{ "blinkm" },
-	{}
+	{ .name = "blinkm" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, blinkm_id);
diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index e411cee06dab..80f38dba0fba 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -565,17 +565,17 @@ static int is31fl319x_probe(struct i2c_client *client)
  * even though it is not used for DeviceTree based instantiation.
  */
 static const struct i2c_device_id is31fl319x_id[] = {
-	{ "is31fl3190" },
-	{ "is31fl3191" },
-	{ "is31fl3193" },
-	{ "is31fl3196" },
-	{ "is31fl3199" },
-	{ "sn3190" },
-	{ "sn3191" },
-	{ "sn3193" },
-	{ "sn3196" },
-	{ "sn3199" },
-	{},
+	{ .name = "is31fl3190" },
+	{ .name = "is31fl3191" },
+	{ .name = "is31fl3193" },
+	{ .name = "is31fl3196" },
+	{ .name = "is31fl3199" },
+	{ .name = "sn3190" },
+	{ .name = "sn3191" },
+	{ .name = "sn3193" },
+	{ .name = "sn3196" },
+	{ .name = "sn3199" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, is31fl319x_id);
 
diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..6c8d6b833260 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -616,15 +616,15 @@ static void is31fl32xx_remove(struct i2c_client *client)
  * even though it is not used for DeviceTree based instantiation.
  */
 static const struct i2c_device_id is31fl32xx_id[] = {
-	{ "is31fl3293" },
-	{ "is31fl3236" },
-	{ "is31fl3236a" },
-	{ "is31fl3235" },
-	{ "is31fl3218" },
-	{ "sn3218" },
-	{ "is31fl3216" },
-	{ "sn3216" },
-	{},
+	{ .name = "is31fl3293" },
+	{ .name = "is31fl3236" },
+	{ .name = "is31fl3236a" },
+	{ .name = "is31fl3235" },
+	{ .name = "is31fl3218" },
+	{ .name = "sn3218" },
+	{ .name = "is31fl3216" },
+	{ .name = "sn3216" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, is31fl32xx_id);
diff --git a/drivers/leds/leds-lm3530.c b/drivers/leds/leds-lm3530.c
index e44a3db106c3..481e9c0a41e7 100644
--- a/drivers/leds/leds-lm3530.c
+++ b/drivers/leds/leds-lm3530.c
@@ -478,8 +478,8 @@ static void lm3530_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3530_id[] = {
-	{ LM3530_NAME },
-	{}
+	{ .name = LM3530_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm3530_id);
 
diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 24dc8ad27bb3..b51496910b08 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -722,8 +722,8 @@ static const struct of_device_id of_lm3532_leds_match[] = {
 MODULE_DEVICE_TABLE(of, of_lm3532_leds_match);
 
 static const struct i2c_device_id lm3532_id[] = {
-	{ LM3532_NAME },
-	{}
+	{ .name = LM3532_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm3532_id);
 
diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
index f68771b9eac6..2b7cf42141e4 100644
--- a/drivers/leds/leds-lm355x.c
+++ b/drivers/leds/leds-lm355x.c
@@ -504,9 +504,9 @@ static void lm355x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm355x_id[] = {
-	{LM3554_NAME, CHIP_LM3554},
-	{LM3556_NAME, CHIP_LM3556},
-	{}
+	{ .name = LM3554_NAME, .driver_data = CHIP_LM3554 },
+	{ .name = LM3556_NAME, .driver_data = CHIP_LM3556 },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, lm355x_id);
diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index 36246267b096..2a893399e05f 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -388,8 +388,8 @@ static void lm3642_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3642_id[] = {
-	{ LM3642_NAME },
-	{}
+	{ .name = LM3642_NAME },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, lm3642_id);
diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 1d64ceb5ac85..95b850a3b31c 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -503,8 +503,8 @@ static void lm3692x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3692x_id[] = {
-	{ "lm36922", LM36922_MODEL },
-	{ "lm36923", LM36923_MODEL },
+	{ .name = "lm36922", .driver_data = LM36922_MODEL },
+	{ .name = "lm36923", .driver_data = LM36923_MODEL },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm3692x_id);
diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 7ad232780a31..933191fb2be0 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -354,7 +354,7 @@ static void lm3697_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3697_id[] = {
-	{ "lm3697" },
+	{ .name = "lm3697" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm3697_id);
diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
index ccfeee49ea78..8e95dcedce40 100644
--- a/drivers/leds/leds-lp3944.c
+++ b/drivers/leds/leds-lp3944.c
@@ -417,8 +417,8 @@ static void lp3944_remove(struct i2c_client *client)
 
 /* lp3944 i2c driver struct */
 static const struct i2c_device_id lp3944_id[] = {
-	{ "lp3944" },
-	{}
+	{ .name = "lp3944" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, lp3944_id);
diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
index 17219a582704..0a1af284f52b 100644
--- a/drivers/leds/leds-lp3952.c
+++ b/drivers/leds/leds-lp3952.c
@@ -266,8 +266,8 @@ static int lp3952_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp3952_id[] = {
-	{ LP3952_NAME },
-	{}
+	{ .name = LP3952_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp3952_id);
 
diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index e2a9c8592953..64303faa1a8a 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -600,12 +600,12 @@ static void lp50xx_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp50xx_id[] = {
-	{ "lp5009", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5009] },
-	{ "lp5012", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5012] },
-	{ "lp5018", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5018] },
-	{ "lp5024", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5024] },
-	{ "lp5030", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5030] },
-	{ "lp5036", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5036] },
+	{ .name = "lp5009", .driver_data = (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5009] },
+	{ .name = "lp5012", .driver_data = (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5012] },
+	{ .name = "lp5018", .driver_data = (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5018] },
+	{ .name = "lp5024", .driver_data = (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5024] },
+	{ .name = "lp5030", .driver_data = (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5030] },
+	{ .name = "lp5036", .driver_data = (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5036] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp50xx_id);
diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 7564b9953408..4937fc968011 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -253,7 +253,7 @@ static struct lp55xx_device_config lp5521_cfg = {
 };
 
 static const struct i2c_device_id lp5521_id[] = {
-	{ "lp5521", .driver_data = (kernel_ulong_t)&lp5521_cfg, }, /* Three channel chip */
+	{ .name = "lp5521", .driver_data = (kernel_ulong_t)&lp5521_cfg }, /* Three channel chip */
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp5521_id);
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 4ed3e735260c..39cb26d343c1 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -346,8 +346,8 @@ static struct lp55xx_device_config lp5523_cfg = {
 };
 
 static const struct i2c_device_id lp5523_id[] = {
-	{ "lp5523",  .driver_data = (kernel_ulong_t)&lp5523_cfg, },
-	{ "lp55231", .driver_data = (kernel_ulong_t)&lp5523_cfg, },
+	{ .name = "lp5523",  .driver_data = (kernel_ulong_t)&lp5523_cfg },
+	{ .name = "lp55231", .driver_data = (kernel_ulong_t)&lp5523_cfg },
 	{ }
 };
 
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 14a4af361b26..9e6056821eb5 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -395,7 +395,7 @@ static struct lp55xx_device_config lp5562_cfg = {
 };
 
 static const struct i2c_device_id lp5562_id[] = {
-	{ "lp5562", .driver_data = (kernel_ulong_t)&lp5562_cfg, },
+	{ .name = "lp5562", .driver_data = (kernel_ulong_t)&lp5562_cfg },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp5562_id);
diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
index a252ba6c455d..199db3efca65 100644
--- a/drivers/leds/leds-lp5569.c
+++ b/drivers/leds/leds-lp5569.c
@@ -514,7 +514,7 @@ static struct lp55xx_device_config lp5569_cfg = {
 };
 
 static const struct i2c_device_id lp5569_id[] = {
-	{ "lp5569",  .driver_data = (kernel_ulong_t)&lp5569_cfg, },
+	{ .name = "lp5569", .driver_data = (kernel_ulong_t)&lp5569_cfg },
 	{ }
 };
 
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index ee4ff4586bc0..8009689db7b4 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -130,7 +130,7 @@ static struct lp55xx_device_config lp8501_cfg = {
 };
 
 static const struct i2c_device_id lp8501_id[] = {
-	{ "lp8501",  .driver_data = (kernel_ulong_t)&lp8501_cfg, },
+	{ .name = "lp8501", .driver_data = (kernel_ulong_t)&lp8501_cfg },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp8501_id);
diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 7a436861c4b7..69f064781f69 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -333,7 +333,7 @@ static int lp8860_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp8860_id[] = {
-	{ "lp8860" },
+	{ .name = "lp8860" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp8860_id);
diff --git a/drivers/leds/leds-lp8864.c b/drivers/leds/leds-lp8864.c
index 3afd729d2f8a..204727f2f350 100644
--- a/drivers/leds/leds-lp8864.c
+++ b/drivers/leds/leds-lp8864.c
@@ -270,8 +270,8 @@ static int lp8864_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp8864_id[] = {
-	{ "lp8864" },
-	{}
+	{ .name = "lp8864" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp8864_id);
 
diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 0344189bb991..54fd344adc74 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -67,10 +67,10 @@ enum {
 };
 
 static const struct i2c_device_id pca9532_id[] = {
-	{ "pca9530", pca9530 },
-	{ "pca9531", pca9531 },
-	{ "pca9532", pca9532 },
-	{ "pca9533", pca9533 },
+	{ .name = "pca9530", .driver_data = pca9530 },
+	{ .name = "pca9531", .driver_data = pca9531 },
+	{ .name = "pca9532", .driver_data = pca9532 },
+	{ .name = "pca9533", .driver_data = pca9533 },
 	{ }
 };
 
diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 2007fe6217ec..273383351ba0 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -764,12 +764,12 @@ static int pca955x_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pca955x_id[] = {
-	{ "pca9550", (kernel_ulong_t)&pca955x_chipdefs[pca9550] },
-	{ "pca9551", (kernel_ulong_t)&pca955x_chipdefs[pca9551] },
-	{ "pca9552", (kernel_ulong_t)&pca955x_chipdefs[pca9552] },
-	{ "ibm-pca9552", (kernel_ulong_t)&pca955x_chipdefs[ibm_pca9552] },
-	{ "pca9553", (kernel_ulong_t)&pca955x_chipdefs[pca9553] },
-	{}
+	{ .name = "pca9550", .driver_data = (kernel_ulong_t)&pca955x_chipdefs[pca9550] },
+	{ .name = "pca9551", .driver_data = (kernel_ulong_t)&pca955x_chipdefs[pca9551] },
+	{ .name = "pca9552", .driver_data = (kernel_ulong_t)&pca955x_chipdefs[pca9552] },
+	{ .name = "ibm-pca9552", .driver_data = (kernel_ulong_t)&pca955x_chipdefs[ibm_pca9552] },
+	{ .name = "pca9553", .driver_data = (kernel_ulong_t)&pca955x_chipdefs[pca9553] },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pca955x_id);
 
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 050e93b04884..e3a81c60ee27 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -88,10 +88,10 @@ static struct pca963x_chipdef pca963x_chipdefs[] = {
 #define PCA963X_BLINK_PERIOD_MAX	10667
 
 static const struct i2c_device_id pca963x_id[] = {
-	{ "pca9632", pca9633 },
-	{ "pca9633", pca9633 },
-	{ "pca9634", pca9634 },
-	{ "pca9635", pca9635 },
+	{ .name = "pca9632", .driver_data = pca9633 },
+	{ .name = "pca9633", .driver_data = pca9633 },
+	{ .name = "pca9634", .driver_data = pca9634 },
+	{ .name = "pca9635", .driver_data = pca9635 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pca963x_id);
diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 6ad06ce2bf64..59951207fd04 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -188,10 +188,10 @@ static int pca995x_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pca995x_id[] = {
-	{ "pca9952", .driver_data = (kernel_ulong_t)&pca9952_chipdef },
-	{ "pca9955b", .driver_data = (kernel_ulong_t)&pca9955b_chipdef },
-	{ "pca9956b", .driver_data = (kernel_ulong_t)&pca9956b_chipdef },
-	{}
+	{ .name = "pca9952", .driver_data = (kernel_ulong_t)&pca9952_chipdef },
+	{ .name = "pca9955b", .driver_data = (kernel_ulong_t)&pca9955b_chipdef },
+	{ .name = "pca9956b", .driver_data = (kernel_ulong_t)&pca9956b_chipdef },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pca995x_id);
 
diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 4e5dd76d714d..03518bf60f6c 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -390,7 +390,7 @@ static int st1202_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id st1202_id[] = {
-	{ "st1202-i2c" },
+	{ .name = "st1202-i2c" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, st1202_id);
diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index fd0e8bab9a4b..9afe2722986c 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -182,7 +182,7 @@ struct tca6507_chip {
 };
 
 static const struct i2c_device_id tca6507_id[] = {
-	{ "tca6507" },
+	{ .name = "tca6507" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tca6507_id);
diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 6605e08a042a..2f272cfd2e91 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -214,9 +214,9 @@ tlc591xx_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tlc591xx_id[] = {
-	{ "tlc59116" },
-	{ "tlc59108" },
-	{},
+	{ .name = "tlc59116" },
+	{ .name = "tlc59108" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tlc591xx_id);
 
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 25ee5c1eb820..ed6a47bbb44f 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -532,7 +532,7 @@ static const struct of_device_id of_omnia_leds_match[] = {
 MODULE_DEVICE_TABLE(of, of_omnia_leds_match);
 
 static const struct i2c_device_id omnia_id[] = {
-	{ "omnia" },
+	{ .name = "omnia" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, omnia_id);
diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index e4f0f25a5e45..143020945e23 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -605,9 +605,9 @@ static void ktd202x_shutdown(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ktd202x_id[] = {
-	{"ktd2026", KTD2026_NUM_LEDS},
-	{"ktd2027", KTD2027_NUM_LEDS},
-	{}
+	{ .name = "ktd2026", .driver_data = KTD2026_NUM_LEDS },
+	{ .name = "ktd2027", .driver_data = KTD2027_NUM_LEDS },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ktd202x_id);
 

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
prerequisite-patch-id: 7779c63f16ef6f7247cdb71c89e66b27e299eb74
prerequisite-patch-id: 6f920b6f8c31dc0ad1689200c37680755c20ce8b
prerequisite-patch-id: 1fd68e883664147052540eea19769ea9e92d0138
prerequisite-patch-id: fff07090df18a39a361bbb091a3f17223b4606b4
prerequisite-patch-id: a935aab66aa9896437ab9d757ef9fdc859d22495
prerequisite-patch-id: d0d54f7acecd560cdeb6ea0c0e5ae77a50695d68
prerequisite-patch-id: d7876560b3bb9b05ac462d0a9b09b50efeb9b5e1
prerequisite-patch-id: 65531f0504ac1885c6c4ed6be0e6a206a9795d5b
prerequisite-patch-id: ec83e7e18d66da9ca677b5c8180a22bf3717c8fb
prerequisite-patch-id: 545255900bc9c5a1402e26e32523ddcc5947f2ac
prerequisite-patch-id: b8d09d24670a6def5076be7a05e851c136cf71ee
prerequisite-patch-id: ff57d37412168e99439ce2b91781237cfddbed48
prerequisite-patch-id: 6818ab804b0dc66b10c22f9769de618dbc5e2dc6
prerequisite-patch-id: 04f78cbdfcf59c3264b9087df78bbcd183884905
prerequisite-patch-id: 48cc5f2055e2261f1735ae1b92936802a80c5a7e
prerequisite-patch-id: e33193d1a91f5819128db924c080caf1c5198667
prerequisite-patch-id: e4f329aabb40b2ee21276a9de2e593e951ab3fdb
prerequisite-patch-id: b35846424036eee7a181b3cb42a1d8be9eed4883
prerequisite-patch-id: ea2e7f63746276a249d3e66b15dc40e954139ba2
prerequisite-patch-id: 175a1fb4a25ac9979a5e75109a8195863473616a
prerequisite-patch-id: 4d99948f9dcb45e70d8bcf0317ebddd691c581d6
prerequisite-patch-id: 6ba1df859ce78f0fe0df10ef2ba537b22667087a
prerequisite-patch-id: a59a578f49eb5147623aab9fdcacba405b9c8353
prerequisite-patch-id: 5eef512b8a5a1ec1848a939928168dbb719ca72e
prerequisite-patch-id: 04746bfdfe146af71d0c41e225978fb42ce977f5
prerequisite-patch-id: f8aeb0b768ae718aa0dab188fbad671aa4c76501
prerequisite-patch-id: 8e0b48a5d5f8bb91933d440eda8f065590e5ca97
prerequisite-patch-id: 5ca261e980415013434edc099b6f741b7a96c7a8
prerequisite-patch-id: 848e20609fb40b26f6226e1ed51e2c34249c0455
prerequisite-patch-id: 163706bd956499ec431a6e01904d03b747e2f631
prerequisite-patch-id: 09a95efff7875781ceed199c60204a2603960f4f
prerequisite-patch-id: c4897ca0762d01cd5e8cb6e761e5ad95eb9de918
prerequisite-patch-id: eb0120090b9fd1e1f668919cf1d81cdf1b684b20
prerequisite-patch-id: 239c0e25dae78755bb553eb9049190f6ed6c056a
prerequisite-patch-id: d988f27ca0fac3a2b06cc8e465aef5e0a4f09bd3
prerequisite-patch-id: 8916058071bcbde1a4d06c6a8981c443132168f7
prerequisite-patch-id: 7f29acd91e1c8b8d4f21152cbcb8a8b0bdb6f963
prerequisite-patch-id: 76d499a624150588f7ef07dc087e70eca6f33419
prerequisite-patch-id: 709d7522981c00761cb3925bc5ac05e6e4ba90a5
prerequisite-patch-id: dfc243f8059213db846a734ca0d2327d82fd7880
prerequisite-patch-id: 888939c3f34cb982ab0fde2b1433562b8c23f9ef
prerequisite-patch-id: 374997ffd4967f5639fcde351c1f7557585327ce
prerequisite-patch-id: 36a7e5ad7ae3b6403dd13a1a07a4065b9bdad349
prerequisite-patch-id: 594a12814d62a5c5d6789d2dd21442586507148b
prerequisite-patch-id: c3516bb964c8d5b12f151cafe775bfe5717051d8
prerequisite-patch-id: 1e24711cbc0bf4008678cce865bb0c445a11f11e
prerequisite-patch-id: af7a6f148e15703c552ad4ffbb74d8ddd15e088f
prerequisite-patch-id: 6e4fc248e8f2f8b00fea6332f6a1ba6166ea05ef
prerequisite-patch-id: 128d35bbe8f010fd07dba03a156749ebd76a8392
prerequisite-patch-id: 0666a828d0cc1efa0e8a01a64517cec9400439dd
prerequisite-patch-id: 9a8bdecc1e33c2366746e487fcef5c1ac9388a41
prerequisite-patch-id: 45fbe87f3807b0e12953e03e67f41b44a0f38f7c
prerequisite-patch-id: 49bf6a8132d0de53987b667bacad80f33885a59d
prerequisite-patch-id: 0ac0339ddd7235e64b75821948b343b216618439
prerequisite-patch-id: e749351c5f56f5829fbe779b68f18d773fcb903c
prerequisite-patch-id: a884ca9d304b266e484b2d75b9bd12e77157a57f
prerequisite-patch-id: f636ad3cf274155496104c0c0b4cdce97a654e5b
prerequisite-patch-id: ae86949fb3951c8d1d87962292d85d40e50271e4
prerequisite-patch-id: 42bccdd17bb53a029922c8e9c40b0c1c9b92e966
prerequisite-patch-id: 0e248d8d6630d04ff09dcb8e3e350920918af898
prerequisite-patch-id: 5d3255de18f377ac63d1c8270c13e5cb7266c765
prerequisite-patch-id: c5d7bf2c0dcba7a743d376919099e3e77ce34815
prerequisite-patch-id: 3ed3938534510c263943eff03ec10853d655ccb1
prerequisite-patch-id: fa1489f35edfc7be73a01460536b6f09457c35f5
prerequisite-patch-id: f4554b1bf777e80aeb5f23e389d03e2418786d46
prerequisite-patch-id: 0474eab65ed27d79736e7c4b7dd70fbaca22174f
prerequisite-patch-id: f8ce785b3d2b0df05fab10c146f558a7a8bed1eb
prerequisite-patch-id: d6c6f37c177d78c20d655aaffdbaa31df85cca7a
prerequisite-patch-id: 4d6c4107b9f54126e189e7c1edb8028a2e2c93ea
prerequisite-patch-id: d49d32d6e262b34792342fa4a573645df7b633d7
prerequisite-patch-id: 3a5f83ed00e5396c5c2f4399ee501f9c075ae96d
prerequisite-patch-id: 67d1cb282deebdfc79b6cbb96fa7e59c06447e38
-- 
2.47.3


