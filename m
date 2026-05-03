Return-Path: <linux-leds+bounces-7954-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLPdDJp792kpiQIAu9opvQ
	(envelope-from <linux-leds+bounces-7954-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 18:45:14 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE9D4B68A4
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 18:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74421300D713
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 16:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A86B37FF48;
	Sun,  3 May 2026 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPHX4tN6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802E13793B5
	for <linux-leds@vger.kernel.org>; Sun,  3 May 2026 16:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826702; cv=none; b=YRiqcHQqR/PI78y+Zl2aebvuUHeS45VGwfCCOsZMVkvaNUDDG4pqa0n1+B3SM3eP8AA1DJVZPgdV8+nstMrdsbx/PVHmvFH3/0vz4+IzVR/elVevjsV01aCX9NNOAnTXGVcBCrCquvTnH4udRW4DLztgZnV/DWknW9bibVRs+XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826702; c=relaxed/simple;
	bh=/aTZ7FfNJUxGAerV0GyNvRYzlJf90me3mmU4zDgewOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sv/7glcEcj+xRPnuaMvxM1p1M80o0VeuanD+vr9wUO36sVRWK3BSSf8adFKc6T4w30HP6ZvcpUTZSmSGiRF4VNMr+UnbPdl1oE8zUKU8YDUva/NVWZpAIUEZ0Um5NcG7iWPU2rcsaL8pHdSTtvEPawXGECoPyuDHa/KyALODASg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPHX4tN6; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bb962ce4dcfso529906466b.1
        for <linux-leds@vger.kernel.org>; Sun, 03 May 2026 09:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826699; x=1778431499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqEpiDmgYxnJFJBZV5oyq8iX4ijdqmclDgeEbjUzvZU=;
        b=HPHX4tN6pvOtLFDE8vxYilTNjL4kyEPNuJ5YNSx0FG8Y9ArrtjSsmw1ntDJFrMtRkq
         juMCYBXOA/Zos9GUcZac0QC4hfOThUnqc0KHaRuIQnL1Gd5rwxsEQO23RD+SaymF/OSf
         2tqXZhwNrpZvHHCrjCd+MzQ1wlAUkWAsWqTuRFw+/GtTQ8AhbXbyEw45RHh+HPsVyVYv
         3s1Tziin/HKa726vlzP9+ljJofrAVWZOZinB18nYqr6Udr8usFXxdh7fQ5RLq97U2uOF
         lorIO4dIqf2BJ6RhCaT5swb2eOSyIBYPbe6B8tTzrbi1uvK+1cvzX69Vej6WXjP1DSnd
         FbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826699; x=1778431499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qqEpiDmgYxnJFJBZV5oyq8iX4ijdqmclDgeEbjUzvZU=;
        b=av9AuEf53TlBJOoi41jIpcHqkEw2s4CYVgHcWtX+I3/RUrJb+oFlNcAqzybIK9hUcs
         rXy3DAJOUk5m3GHesaNJxoGCRxMZ8e9TFiXrrDXUgCevvLOLzdKujTRlN355d54kqR/P
         sMbLmguFefpCTSDcyY1jE/D8n0o5ZftcdyPFnSaJ7CuEoJrEKyznIu2kjSZVMO3NDtS5
         fAYK+DFeJ7xQgZWMibvCjK1TUmG+zBLTxXKXQwGkJ59YgTTvqMbmfZRtigD7o2d3HaDu
         Kujuyyk3FTCGiWPo5Px92aK9fyCrsqACmoEHgvb3ib69w6ypl+L2iUhA5YjgV7DRIuOW
         KZUw==
X-Gm-Message-State: AOJu0YziWEE+ZryWY0Tu/iIscfAR6blDI8Qnq7DvUZUaglE2oRAR86e9
	iFwwjZ16x1sJ/V5/Kl3zfZoItLskB0yPIEczXPLg90Ag7fNdVc0EQvLZ
X-Gm-Gg: AeBDiethF7w5cJJhJKbtfjBvJKiygkiBJZc/aiIrzsPWt08gT6tIo2oG9inFfjeNq90
	84FT2uKMeEJZCtsZJgt7EfaSLFvMus0bj/a99YCdfWXu9S4Uw3aB6a+62LQRX/cquX5qhsjE3Sx
	aP5jRL98OQTWzxybOrcWq5ur0Zl9a/u1eyjbH+B+fKTk+7tKlrD+wxCQWYcTSfRKP7IcsL3Pry9
	RX4uIpZrO0/ou6Nm3kERAUfO/fZeQdm8blnDMp3NXGcePPYPJGzTm3NbaqIfzlvcUVPz5sYgvgH
	ZgYOuvsA1qhhGtljedzYSrVmZs4PqiWMLXI1G8gzTB8i0byeYl7p2LfSN3rB6OqbJlqFmMnAc2B
	r4NQbzkqY0pNKtLoYX0kJqEWA44uRKAjxtt0IZLqv7szIpmEYfDjamRLbxuTg/pgqky2ahsoHop
	uppigSQoYxfSIXsJXVPLRV28I=
X-Received: by 2002:a17:907:9455:b0:b9c:9594:e00 with SMTP id a640c23a62f3a-bbff9e28c78mr324860966b.1.1777826698801;
        Sun, 03 May 2026 09:44:58 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc237ef8297sm27430566b.57.2026.05.03.09.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:44:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v5 2/6] media: i2c: lm3560: Fix v4l2 subdev registration
Date: Sun,  3 May 2026 19:44:41 +0300
Message-ID: <20260503164445.215540-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260503164445.215540-1-clamor95@gmail.com>
References: <20260503164445.215540-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CDE9D4B68A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7954-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

The existing driver does not call media subdev registration, making it
invisible to the media framework. Since the LM3560 supports two
independent LEDs, register each LED as a separate media entity.

Because registering LEDs before device initialization may cause access
attempts before the hardware is ready, lm3560_init_device has been moved
before the subdevice initializations.

An additional helper, lm3560_subdev_cleanup, was added to release LED0 if
the initialization of LED1 fails, and to deregister both LEDs in the
remove function.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index f4cc844f4e3c..edfb07587cab 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -364,8 +364,15 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
 
-	return rval;
+	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
+	if (rval < 0) {
+		dev_err(flash->dev, "failed to register V4L2 subdev");
+		goto error_out_media;
+	}
 
+	return rval;
+error_out_media:
+	media_entity_cleanup(&flash->subdev_led[led_no].entity);
 err_out:
 	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
 	return rval;
@@ -391,6 +398,14 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 	return rval;
 }
 
+static void lm3560_subdev_cleanup(struct lm3560_flash *flash,
+				  enum lm3560_led_id led_no)
+{
+	v4l2_async_unregister_subdev(&flash->subdev_led[led_no]);
+	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
+	media_entity_cleanup(&flash->subdev_led[led_no].entity);
+}
+
 static int lm3560_probe(struct i2c_client *client)
 {
 	struct lm3560_flash *flash;
@@ -425,17 +440,19 @@ static int lm3560_probe(struct i2c_client *client)
 	flash->dev = &client->dev;
 	mutex_init(&flash->lock);
 
-	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
+	rval = lm3560_init_device(flash);
 	if (rval < 0)
 		return rval;
 
-	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
+	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
 	if (rval < 0)
 		return rval;
 
-	rval = lm3560_init_device(flash);
-	if (rval < 0)
+	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
+	if (rval < 0) {
+		lm3560_subdev_cleanup(flash, LM3560_LED0);
 		return rval;
+	}
 
 	i2c_set_clientdata(client, flash);
 
@@ -447,11 +464,8 @@ static void lm3560_remove(struct i2c_client *client)
 	struct lm3560_flash *flash = i2c_get_clientdata(client);
 	unsigned int i;
 
-	for (i = LM3560_LED0; i < LM3560_LED_MAX; i++) {
-		v4l2_device_unregister_subdev(&flash->subdev_led[i]);
-		v4l2_ctrl_handler_free(&flash->ctrls_led[i]);
-		media_entity_cleanup(&flash->subdev_led[i].entity);
-	}
+	for (i = LM3560_LED0; i < LM3560_LED_MAX; i++)
+		lm3560_subdev_cleanup(flash, i);
 }
 
 static const struct i2c_device_id lm3560_id_table[] = {
-- 
2.51.0


