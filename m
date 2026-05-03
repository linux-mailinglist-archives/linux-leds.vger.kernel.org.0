Return-Path: <linux-leds+bounces-7951-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMNjJe349mkyawIAu9opvQ
	(envelope-from <linux-leds+bounces-7951-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 09:27:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D69DC4B4B3C
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 09:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0A4813001CF9
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 07:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CD63815F1;
	Sun,  3 May 2026 07:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRDzQElm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ABB3A875E
	for <linux-leds@vger.kernel.org>; Sun,  3 May 2026 07:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777793243; cv=none; b=ku5SKds2QqoBLW7Z56sVGztlx+haDjtW9uL7E6Zw0zf95/urd5OHEJ/pECMqx6sj/MdxL5m1iqInqYoS7wwOIWvBOqbSc1mYXTurQzzAb1QK0rNL/+M2Akh9+QzPkjHC0Z5wmB0yoiRS9ZFwwjOKPIG85VrsA1xC4oQhpcNKXrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777793243; c=relaxed/simple;
	bh=BmEGzsHJ8K+3+vN7Jro/PlahKcA+d5OK7rUba+0zggo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIkGDzQwp3NE5iE7zqQhPP2IhTceZNIhPABThGgHG6Th4S3OD8R1ukGPULUOlM9XUTJDzoeoB7I9CthDBY9RRnnNZ2n+calBCGQOabhUO9eGfzBk9N/utprOiCNsV5/cCA2kl0KRv51Eyb1QzmUa109gx7nB2O4wnu2rrZMspc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRDzQElm; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso18178135ad.1
        for <linux-leds@vger.kernel.org>; Sun, 03 May 2026 00:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777793241; x=1778398041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHEBdikQ6bf/NgnoLrg9r5ETcVwJT7U135E6QfMQij0=;
        b=CRDzQElmSnOLZ20jG9/rdGe/kRwaBZPJGYouCXNUEkPI9SE0Uka0IIivsKi92U6QmK
         J9AOgM169KZ/U3Qk2vFOpmQZ3OjKqZIKz6pKkFwvbK1MPI3ivdLd6H6mZT45rsIuVKn5
         FimPOKoY8fv+9RMN9JVFYWV1whFX1KWdmuJjJgQFkl1VatdePS9psMRHHIDDlubujLUl
         oUTl78/ww1ktq5r2/y+gI+V6gL9xqaGATYL9nIDLf4URlrurQ2PNVmNZVjK9Dv7Z9Gdi
         BkxtynNIjP3CQv/t0VLauSd4Fm/ZprEloVzd+iQFR8eUDI1jbxCpeikLK+Z4+60G+kgM
         mN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777793241; x=1778398041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OHEBdikQ6bf/NgnoLrg9r5ETcVwJT7U135E6QfMQij0=;
        b=atKDUl0yaYRuU+5u/5tpe4DDP6BCbnlR8BY42baI4jMPilV99IvSjglbL3XzHAF5x2
         e8Rx6O0xk+opHFROlzolCFp1dzmB+oMqbWehKbt+IS3WHzB2Z6Qz0vOEbRhKeXBDl8g7
         MmsS1m1UtsYQH/w0x9m6OEfIV3NYV9izUqhqw+0ej+Oogr9EJQipKy2HQNcCDVhcDGNj
         2lpKJGD9rbtdZUa3XYkvI/6h20FJ93ZC1KwT5N4at3y0z26vpsKeDCjFZ7gYTksU632M
         d3P1yvuh5Geho4yybOcTp1QkrhSZi7MZQKU6IM1VH82OmZysvFlp4CDW8FlEaLwSh1wQ
         k7iA==
X-Forwarded-Encrypted: i=1; AFNElJ/EiWKW+djiiApIBuOpmVKZAaiZQMm+J2dNVjWwUlIPidG4Hn/t3XXrjL9rLMByE/L2DFfi/J/lYWx/@vger.kernel.org
X-Gm-Message-State: AOJu0YzLi0ofoiAdSFgR35bHePh4LKmRjD9wVuu7OSSfziAMfE0Mc18r
	P6DWwqB9tGtL1CcMn34ByJkYpPw58/8cTf+1PH/V0/2B4Omd4yR8/BOq
X-Gm-Gg: AeBDievnW60ipX5o5K+Jr666myIn1LpKszC+j3vEKtXpQ2xSO2kpGz1W2g7B2McYHqn
	sbT1RjTloXfaCHaurgKmXRwSCIN0aQ+WFy2OVxpDQdI0NELo+FG4PYs/7eePYxNrCMIS98xdLlx
	UYbX/K6rgyEqWXxInoaFnj9GKui6Bh8QjLwRkLqfGx1x+Od+OQmVAu7F6fl/dhG1Pl+xu7QZfMT
	AwrDu8TDeNOBaG1P2PeeH+gNJh40MWHpw3NOnEsfTTdk03n7HKyYo6OVs4az0VADEPx42abLPW+
	q+j69xlxmCmO0Cbse1d/rSs1tdiuyZ1hgxf7rQNs6prI5f4fECv6umI1zc2OhE+oEAys+T3NLXs
	VV+j1IauplP1IBNl3We1mbddV0d7Yv3j/+6I5vRAHJnJY0TWijQzhxyDPBO83eySMtA0bMfXs5k
	87piu+kN+IUy/dZAIF3LXK6Bj4/A891URvL5It8ohQANXtlgQ/XdgDjoqqVpd9eA4e7pZrPg==
X-Received: by 2002:a17:902:cecd:b0:2b0:ba14:fc55 with SMTP id d9443c01a7336-2b9f2837cdfmr53882545ad.29.1777793241487;
        Sun, 03 May 2026 00:27:21 -0700 (PDT)
Received: from tranquility.wa.lan (60-241-74-71.static.tpgi.com.au. [60.241.74.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae16a9esm64942945ad.50.2026.05.03.00.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 00:27:21 -0700 (PDT)
From: James Ye <jye836@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	lee@kernel.org,
	pavel@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	denis.benato@linux.dev,
	James Ye <jye836@gmail.com>
Subject: [PATCH 6/6] leds: led-class: mark classdev as unregistering early
Date: Sun,  3 May 2026 17:26:43 +1000
Message-ID: <20260503072643.2774762-7-jye836@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260503072643.2774762-1-jye836@gmail.com>
References: <20260503072643.2774762-1-jye836@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D69DC4B4B3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-7951-lists,linux-leds=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jye836@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

The classdev was marked as unregistering after disabling the trigger.
Disabling the trigger attempts to turn the LED off, and the device may
already be inaccessible. This generates a "Setting an LED's brightness
failed" log, which is avoided by changing this order.

Signed-off-by: James Ye <jye836@gmail.com>
---
 drivers/leds/led-class.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 9e14ae588f78..a00986ffd9f6 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -601,6 +601,8 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	if (IS_ERR_OR_NULL(led_cdev->dev))
 		return;
 
+	led_cdev->flags |= LED_UNREGISTERING;
+
 #ifdef CONFIG_LEDS_TRIGGERS
 	down_write(&led_cdev->trigger_lock);
 	if (led_cdev->trigger)
@@ -608,8 +610,6 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	up_write(&led_cdev->trigger_lock);
 #endif
 
-	led_cdev->flags |= LED_UNREGISTERING;
-
 	/* Stop blinking */
 	led_stop_software_blink(led_cdev);
 
-- 
2.54.0


