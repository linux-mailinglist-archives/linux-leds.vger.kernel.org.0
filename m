Return-Path: <linux-leds+bounces-8313-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEtANTNiFGoONAcAu9opvQ
	(envelope-from <linux-leds+bounces-8313-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 16:52:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D953A5CBF59
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 16:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 435983059FF4
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 14:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238C63B47CF;
	Mon, 25 May 2026 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqwHijrb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3953F0AA9
	for <linux-leds@vger.kernel.org>; Mon, 25 May 2026 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720464; cv=none; b=g6QK2nX8B0R5b9c4V9J+hIRNPkyjf1AtZ3/q1GIBE3Em+AB4OoXUZ7W2aBWqvGds8HGB4H1kR4Hfpfj9SAJU7y7r4bL0Q37H3vz1heedfXQL4N4bMuZ0jmG2cJ61hHEdaA6TroIGqStOwv9InARj8/Kvlq2NxOZLur6PpO1xMz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720464; c=relaxed/simple;
	bh=pjFlrB7uGN0vyMl1RGqGgvMd8ocGBWVXot5mcHQGLcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tOf9Kzya3409IzNaj9qXuCb5TalodOB/+a2yX3y4jg6xtwiE0YYPBe1ub5V5//xCuq5Q90y3tnewH8r9+sWotjpeq78Qwbtib8o7HWXkGSju8bj2ylLUp6tZgIQnj0Wo4TaNwYIb3SDPm62+0zZXrZ6pnxvvV69UslMByXpGzOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqwHijrb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3660ab73adbso6898630a91.1
        for <linux-leds@vger.kernel.org>; Mon, 25 May 2026 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720461; x=1780325261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qt5GF4ec4Tz+ThdSwkffpWxOTLLBMBcFoFVLeUcmmpQ=;
        b=pqwHijrb35hlGp/Z9U7y+lbVHEX5mXpcl4mrG/XyVwNd8RFb/oYj2bH29RKUZwu2Qy
         MXQs/iWVeUWpulfQpdKxXDYzHzsBAHrGHgazwgsM8okP9aCuRZAynvZOwca1N0qtGOen
         UFf0SQyTVzmaT4ohrlP7B7x8GvlhtezmCyyHhXRNpWJzC0rH0OTxqtazs4t3vUA6DjI9
         fk4iWCW4uGdQzftH9F9NLt192LzqkztJm4VZYnIUU5UNk9XR3fgEmfaw6SpZRWTvHM8V
         Ap8yVb9j3FqG45ZJl0GK+GzUm+Qr+CIK0Jtb0BbYT4t8ldlNaglYiiiyMeABx8aCgLF0
         ZJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720461; x=1780325261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qt5GF4ec4Tz+ThdSwkffpWxOTLLBMBcFoFVLeUcmmpQ=;
        b=dSqH+DVE+bJ5Tb/KcPmSbE9MYum2wMSnD8dwmyv8xkos7QVDxr/iZYY777t3OC4ftF
         qZnqM8dyIHEIP19t4h1Y8GUWEUj+yJ3QEniJUPZz40go3KouJoKeibukjq72LCqjPeku
         Fni0eq3zjqBl9yXKgpviQ18wM+4AqBa8tJ1N2JV2+VleEvhDnHsRPqQ3dJTJ1FwTRxwg
         BP069dl5udYIauZyBjIRI4MMgrNIJNdBeYNWtDx1VzjOaxxQH305uwuWTqv0Gt/gZE+O
         Ilgtq/kc3KEeE2YJgqZ+eCRtMr7PejWiIrAVRguIiN6UX0RIpvS/Qw9IWZHWpluan97U
         Ddaw==
X-Forwarded-Encrypted: i=1; AFNElJ99VIt+16Dk9e/2O98KPiQmfyOLufHt7IlmlaK7YrnPI669OZmjAExSw4aWEU7yPrJ3jsk7uaeR3dkm@vger.kernel.org
X-Gm-Message-State: AOJu0YyPYmXm/Oyp8yaB0X1I/17CHK0njU/jsG71kFG51tiwx4TCAeJu
	wun+PzSkLX4zYM4isHjhEv+554byfBOfimdUWOhS/2vyBxa9c2RjUoBO
X-Gm-Gg: Acq92OEieE/mpBmZvzcuBM3SzwivbYOzDAz6s4tRXHsurzqXeG56cvVRwOXXnz5M/8a
	4Bygv846NkgvUb3S8qnB+M7GQ9QPR+f/MSez009CJzT8QruDtWSs8RxsOyGvaUaZXfL1qNHBnUd
	UqIyZRSYTW1eV1XR7VWEvaTAFYqT2SCFmwwTxCkUwR8ndj+nerA3xhMWeZ1gGzvXq/91iwr5d+z
	z4ixaV9cYleIM7HVCyFaQOtTTlLPX8hWluR+G4Q3gQepRBPotQWn8U2t2syQ+z+qUGaT1VGIkle
	leV4lP+1bm7iKVnSeY1pXxZrXkf8L1tYFXOgfDeimufvCgPtCR9EOfaPNVgYjh88mckbothikjr
	iMGQrZpbmsidoYeadDak7cx0fEIJ0nsVYRCX2vsG91EIYi7WILxUV6bAhcAOz3EVO6NS2vvDJrv
	lRYtMSDhx8um3UCfPQ/biib/bqRXQoXE+zi1QF8/4=
X-Received: by 2002:a17:90b:3e4f:b0:365:8fd4:925c with SMTP id 98e67ed59e1d1-36a6c65330amr11990238a91.8.1779720460900;
        Mon, 25 May 2026 07:47:40 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:40 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Tony Lindgren <tony@atomide.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Romain Perier <romain.perier@gmail.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Peter Rosin <peda@axentia.se>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 3/6] gpiolib: of: add quirk for IS31FL319X shutdown line
Date: Mon, 25 May 2026 22:46:09 +0800
Message-ID: <20260525144629.498630-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8313-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,atomide.com,axis.com,sartura.hr];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	FREEMAIL_CC(0.00)[gmail.com,ucw.cz,kernel.org,hisilicon.com,glider.be,axentia.se,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lumissil.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D953A5CBF59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to the IS31FL319x datasheet[1], the SDB pin is active‑low.
However, existing device tree incorrectly configure it as active‑high.

Add a fixup to force the consumer active low for legacy device trees.

[1] https://lumissil.com/assets/pdf/core/IS31FL3196_DS.pdf

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ef1ac68b94b7..8a79aaadc9ea 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -194,6 +194,16 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		{ "himax,hx8357",	"gpios-reset",	false },
 		{ "himax,hx8369",	"gpios-reset",	false },
 #endif
+#if IS_ENABLED(CONFIG_LEDS_IS31FL319X)
+		/*
+		 * According to the IS31FL319x datasheet, the SDB pin is active‑low.
+		 * However, existing device tree incorrectly configure it
+		 * as active‑high.
+		 */
+		{ "issi,is31fl3199",	"shutdown-gpios",	false },
+		{ "si-en,sn3190",	"shutdown-gpios",	false },
+		{ "si-en,sn3193",	"shutdown-gpios",	false },
+#endif
 #if IS_ENABLED(CONFIG_MTD_NAND_JZ4780)
 		/*
 		 * The rb-gpios semantics was undocumented and qi,lb60 (along with
-- 
2.54.0


