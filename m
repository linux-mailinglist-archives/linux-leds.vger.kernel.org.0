Return-Path: <linux-leds+bounces-8415-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABf9LFSnHWpJcwkAu9opvQ
	(envelope-from <linux-leds+bounces-8415-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:37:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B39621DA9
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26CD130E769A
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2026 15:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E903DF019;
	Mon,  1 Jun 2026 15:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlWReqmt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801703DEFFE
	for <linux-leds@vger.kernel.org>; Mon,  1 Jun 2026 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327171; cv=none; b=f9qxIwqUZHp7B/n8nf7YO01hFWPd7QzaudfrLvPLmMxYQJ3ahiPxSXEdBeBF4OeSmLqbEfY1qUWnzoT4E7Bj+jL5GEIq1h3op+afZ/5MBLTy/PrGB8EqIjuE0ZNTv4M5llERtKxQ/EFPsQ2iEVS4wGbmt+MFCsbnI3DNnYpGiu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327171; c=relaxed/simple;
	bh=Gqs7G7t00pywVX3rRhClLifko2DwPlgtzGf6OODWNOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=APVOT5Ml8r72oFZTEqBsI0alUxCsJcZCa26KEfzrbIeJvL8nqD/oGeos27SnZw5qced6gSFPMGg80INWYNcOGcfVvegOlq9lVRxel1ix6tkIsT9JamAOVQCADsULkUUtF9uuLh2kOzu9bN06ySX9cEwZljt1QqBQLyNx9lrypXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlWReqmt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4908b92904fso50656355e9.0
        for <linux-leds@vger.kernel.org>; Mon, 01 Jun 2026 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327153; x=1780931953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33jV+tJR7Nm5ReUL1Jncj608Et9Ag1X54glyJfKp5cY=;
        b=SlWReqmtNBJgpuPqFBJ12rBdSTE7NTWat1EwcxNlvUeN/Q1Vmuq084pYnUVAPpNXTh
         K/7XijqDSNVP7JleW6xrVBhilYT/7pjmhsYeZF9ykncXIuFMw/AtI6IpMBZR6qIu4CtJ
         alpPerpSV5LkvxU/kBG54B0uhhRDRFWkd5FMNNar2kl+3CugOLVhYN6/sc2ugYKu+TAw
         GEE5AbOxDZlxbR00XBDHRloB4HW4NFOiKkUllyhnpOAiKzdCZtt3ofTzfdmmP4Uul2G0
         L0AR5zkgyJnyrnDlY7WwxlOVcK0V5rKis71rON1FV69F0QFYRmo/K1JgOYetuUizzmJG
         jEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327153; x=1780931953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=33jV+tJR7Nm5ReUL1Jncj608Et9Ag1X54glyJfKp5cY=;
        b=o72lGa9zkDVCfiT4r9i2AGlsnj5qWGAZCBSaErU1Hhbnq6SrokyeNrsFJ0RXBunbkc
         AbaaNOKZZbJPgsibyDZztFmxe71nZLzwTph+tDVHN39N9Guld0I2MVHMeh0DgnSEz7pz
         hUGzbupcjuajiebCDEIMVFW1VGjHws5UKxNGtDzbacjPHUxHdIna9R5Ij5HNe3oViMg5
         A3nvWrnshptlc0sC5lvtAoa26EfqhG7p1nwV6/c9ZJF4IiqHBLVFhhzVGfG51CyX+ciN
         bCbPrNeXDKPGtaujg+5Ir7MKH7hpu/C6ucpyGGxCZlzQh7bwCUq4wZ7qqWfltDzdOA3l
         +mKA==
X-Forwarded-Encrypted: i=1; AFNElJ+q/zNOTt0xvPAo4H/h7LCAhKt0U/U2QEW5JzX/RQhDSuXCEKW96OdcSipfSDKWSZ4yLOuGoE4uOCNA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoybk5GzIFHU65lcJRmcEufgBw0qEhc/YMejqxC6V1kDkrzfbT
	QhnnnaiUF5/W0W6TfbRgqkLUAUVdm+woYJoFZs2z/k3AOLspcu3O+Toa
X-Gm-Gg: Acq92OGVnufYhFRfY3mtwae+p3aeYW2nUzX8GruENB09NR5wib102AlQAQOWQqqk7Xa
	Om6dvNzaRmLsEfCRl/6y1hqWOCpMJhCe1WSm+/hapBuaofRc4mWjBChqIOx8tsQEZQo0LTWbSCb
	VUHFuuMjgmfYQZsHcFQz9CZ9OQ/8xjw0QwpFQEAXMpFiGMXDQICcR1X63Lpx6WpSZQf/BrXxCeS
	qTglgPIyHom91g1epjK1ytP1BWqlbSuiuSSSIs9BqwXUzSCR1VdbyAH4ZPp6+R+hEJjP/txH93G
	XpnoqWK6xaU8ZoxD+NZcaIVnBK7ybMi1jNTRMLnoN6aYtDfzCYs+d8VIVEJOxFpoubhQctcZ9Mw
	To19D12SOJTpXpDOVNJkhhYAsqFNyViVQAQAfaUEqOWYlbwFR/ZWrnqZhTDQ9HGwiaQOffp2Rgz
	1KBKzseY4749y4bjY1BpULBTHmW1ClNQ+9mg==
X-Received: by 2002:a05:600c:6385:b0:490:40f1:5314 with SMTP id 5b1f17b1804b1-490a290ec08mr258749965e9.1.1780327152708;
        Mon, 01 Jun 2026 08:19:12 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:19:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 10/11] video: backlight: lm3533_bl: Implement backlight_scale property
Date: Mon,  1 Jun 2026 18:18:30 +0300
Message-ID: <20260601151831.76350-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260601151831.76350-1-clamor95@gmail.com>
References: <20260601151831.76350-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8415-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 62B39621DA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since the device supports linear and non-linear modes, implement the
backlight_scale property to describe this state.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/lm3533_bl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index f0d88b7bc229..945625c54fc4 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -161,6 +161,7 @@ static ssize_t store_linear(struct device *dev,
 					const char *buf, size_t len)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
+	struct backlight_device *bd = bl->bd;
 	int id = lm3533_bl_get_ctrlbank_id(bl);
 	unsigned long linear;
 	int ret;
@@ -174,6 +175,9 @@ static ssize_t store_linear(struct device *dev,
 	if (ret)
 		return ret;
 
+	bd->props.scale = linear ? BACKLIGHT_SCALE_LINEAR :
+				   BACKLIGHT_SCALE_NON_LINEAR;
+
 	return len;
 }
 
@@ -309,6 +313,8 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	bl->linear = device_property_read_bool(&pdev->dev,
 					       "ti,linear-mapping-mode");
+	props.scale = bl->linear ? BACKLIGHT_SCALE_LINEAR :
+				   BACKLIGHT_SCALE_NON_LINEAR;
 
 	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
 					    bl, &lm3533_bl_ops, &props);
-- 
2.51.0


