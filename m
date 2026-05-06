Return-Path: <linux-leds+bounces-8015-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ9LCfHk+mmGTgMAu9opvQ
	(envelope-from <linux-leds+bounces-8015-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 08:51:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2704D6D08
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 08:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 032BF3086B00
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2026 06:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9C936D9F5;
	Wed,  6 May 2026 06:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioIPtAWd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C1C36B055
	for <linux-leds@vger.kernel.org>; Wed,  6 May 2026 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050152; cv=none; b=lhs2xmZ1uVLFlzu/wmBw0yrafTfSrZO+a77dGwVo3eg/zqlrdgDC7FLKPJczQAwnkO3ZfwzXujubzG4KHRwusr1LZpV+bOifPZanGUAAzIRCzD/wjtP1V8MPVnKfCAzVkRSd5bYJRZOzfPu19hhAoyT/4w98kM7izZFRs6wtiCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050152; c=relaxed/simple;
	bh=/aTZ7FfNJUxGAerV0GyNvRYzlJf90me3mmU4zDgewOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8l6TWNZ9uyVSr0RAEuwKqqjvQrSv10de0Ro3b5rBg/QiCvx3eVXtFYULVu4Ba1OX7yuzYEj6++MTHgERrjG4lQowMegKH+XzE5wqLtoUPysVDhFtD/DYg8T/UFlkf+BzDehFztVogDXadCHH7jEh+pryBCD/IWwyZebvmBU5/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioIPtAWd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so86234585e9.0
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 23:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778050147; x=1778654947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqEpiDmgYxnJFJBZV5oyq8iX4ijdqmclDgeEbjUzvZU=;
        b=ioIPtAWdgpZO/HahDRHEtmCPXbnoFdJHICYIPBbqRhmIe2dtghDjWcdCcQY95MJ7bd
         g6MMnSHIx1n7/PZ18GV1YUY6HvyiNrAz63CKKSlxyBFOspkLcJuk4Rloee5eyC1vuZlk
         TRElA42ngbe+yp8QMptnbUzKqxVFsjIWtKtCHibbolAP90DEDFfj8fHv8QBt72z/RnQp
         H1t7VcTtTOVxr/hRTVY3wM0E+XGKbvPEnadNHUnjZ00RBw0msSFJ3Mu1nnBh8W6FoT3c
         KwcbFbUqXRfMkbqEsMzCfNlcSP2XVNMq7BRx+d3eRydGb++jWlJLBP/A2VMuPyeJHjBe
         5XjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778050147; x=1778654947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qqEpiDmgYxnJFJBZV5oyq8iX4ijdqmclDgeEbjUzvZU=;
        b=TFGAPhLNjGPZo3bhuwETShzG06Ovo7FXmbTAFxTB1/gYzgkVujt0ohPK/nsZwo8eeQ
         +jN/ibBB9S9/g+RcrFejCI8M7JijUFvWeGXyrYBZDL6/Tvjr18NntAvqp4wD/Q8Bt+Ds
         2qJtZZEm7kyNlMsftRZhBSoOGeKid/aJqz1mfhIQ6T14G1QYUoQLCCj0Iv+RHwP5eGcY
         of5s4ErrEsWI6dj8Roohp3j0sZKdvEh/ZulxnBgcfilq29g3mBNFA8xt2xgAWnRv9hSM
         fVUav+CqkxO9bORgBjyH/HnS23tgVy06eLXtkgDZq/mwbEHuuY8xJM0/jt6XcVacocmP
         hbjw==
X-Gm-Message-State: AOJu0Yx40b5xFXscOUCxzdeD+eEYRua5L0oQqgERQtJAJcsBbNod5yta
	bsW4X95rwj03E7oZMeTXlw9o316oGDogqLvClturePdn4xRmenpEMmOt
X-Gm-Gg: AeBDietVSdPI189rvp4bu4Y4dNi6ofnn+WdanWBivAy4VDTvAyeASgItvNk6u+niRin
	A+P0a9Fj2O/iT8Eb+3VkR8qS7VSvZErQ0vfp8g+k8eKxVQoPaUveo9w/HI5PDtaZfbrNPTfN2GP
	p/rPJFJL94lfa7GuBSGiLQV1cEA7oIiweZTWXuMzi4aeOOvyRJ13SOkQEpUuUqoXmWRa3H7NRFJ
	CLAqy4PwHu/rEjO0ueEPHgkJUdMvBbtm34pJffvGhIEl9sz8lwg1phbw9QbZfk/l7ZRiLpWFgSB
	8zlhXThtkqbIK3UxhXamb6V6lLuRVaWM8OARXz8onc4piVDTUD0E+cGki+R1OVM84WVvEr0bLUH
	42JEVfCCrMtasUIz8U/nW9QsR7SzPvWj+qO33+aIEeVndLbT3aVgwOl7ad0Q32zTRPd4/4ldsEs
	Zzlikbt3MDRQ6ZzcBsuZyvAvI=
X-Received: by 2002:a05:600c:3e05:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-48e51f2a997mr38200825e9.10.1778050147183;
        Tue, 05 May 2026 23:49:07 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891d62sm38398835e9.1.2026.05.05.23.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 23:49:06 -0700 (PDT)
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
Subject: [PATCH v6 2/6] media: i2c: lm3560: Fix v4l2 subdev registration
Date: Wed,  6 May 2026 09:48:43 +0300
Message-ID: <20260506064847.37795-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260506064847.37795-1-clamor95@gmail.com>
References: <20260506064847.37795-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DA2704D6D08
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
	TAGGED_FROM(0.00)[bounces-8015-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
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


