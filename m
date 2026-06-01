Return-Path: <linux-leds+bounces-8409-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMgEECClHWr5cgkAu9opvQ
	(envelope-from <linux-leds+bounces-8409-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:28:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB78621B37
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45AED304FCDA
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2026 15:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DD23DE44D;
	Mon,  1 Jun 2026 15:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvW4Y97o"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF9B3DA5C0
	for <linux-leds@vger.kernel.org>; Mon,  1 Jun 2026 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327152; cv=none; b=NQ9HUUyTZj4Pz1Y66A87qft38MCheWsNQCfLcJTxAiWBRmZUa6icbJfzyXY2/6aEPV1ZiH5aixKb0gnfojlM3zgdbfmx6OT1ozpFkgqJeBTP3nH3MCmwmq0M4Xfnhr7nwZNAV7S6RmyGheE7YPX4Bv3C/l0C/cvyzxfKKWFcWOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327152; c=relaxed/simple;
	bh=JALmBwQQvVIGcgHB3eyuOJRgqo+XiRn3ZwSnYM+2DMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+Z73FHj7AZgZ2pMiXusi60oLghLjm51xApvX5xYji4KwkOhLw6dQ3//wnnrXTs0ZkHHgOSm2NdH1INbseCY38HRtgxS99GTJ8nzaMw9uP/z9a2bls0MVHznnP3iABJOOy37Gn/r0o56xOFYQmeue5xreyBy7ysY+adnsb3A90U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvW4Y97o; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49050bfe053so71456105e9.3
        for <linux-leds@vger.kernel.org>; Mon, 01 Jun 2026 08:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327144; x=1780931944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHipHX0fj9UFI6kqkRtr6SnJM0WlhcDH4RQJ2Kh7RME=;
        b=IvW4Y97ophhmqt4XxMHLdh1gLDGtbOqT+OdFsZOzhu7GJHt4vFrtSG2IedcR77PLxE
         O761zpZ5pUZzK1CQqP6WL/kvw4KIckjUVXCAu1jXVO2LhkhDmEz6tqxKw4Cer+Hz8/Xm
         67puVzY5GHziIvAaJSb8KZ4Atba79E5rp4sq5NnTZlvEbmqZU4gf280Ic598i93jS/z7
         M30NpnPAhWSN1q+VDv5Cxs3gb28XlLz3zMcsqzHm8pmOKDLT4CaMJy/SKz1mp3X+4a6X
         uiDaEZXVwjcg+VKzesel8hwijPgkxWbm90hqpOci5HtG/85+Q48RyZBlV2rLR3GuLWc6
         j9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327144; x=1780931944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kHipHX0fj9UFI6kqkRtr6SnJM0WlhcDH4RQJ2Kh7RME=;
        b=Be/PrgJjWcTv0dzuCAfj4yoXTtnmyzG1WEctR7peBbAdKFFGtJGgvh/9vToUxnxp3i
         UpGsaUJDuLe1C77NdNPqQxADQcdzqKvOBwpQXilxfgR4v5pnF1ui3beAfXmtkYInumrl
         0cquZD3OaPWMWyUzoCy6UPcL9CvhrBs9VEffNOxlyMb081LyYKfpOJJ+XShuYgvt/eiv
         yPn8kMdAA3iR7M+Uplxx79DfEgxaxDUJcJnzb1Xy9r4lOZwLUrxHiK+TNkIiKYuqtdFu
         dpXInm8FhbA/ScW6GQ52Xoj+GbTiW5FJAOMG8OwGrFPZTRhPOSQtOjgkk4Kx7RY2SNNJ
         Lnjg==
X-Forwarded-Encrypted: i=1; AFNElJ8mNRB8JQ+tE4xFljdYGZJpFLEzeNQWzEop8+hM6HJKTZ1sek0i3nG1BeW0NX6AdxL7Km3heflJFEkn@vger.kernel.org
X-Gm-Message-State: AOJu0YzB6b/XxZCrSen/rvz3jzUWB3uriiX5vGkBUASKB4cKTw/Oz3f5
	vjNF+LeFe2lJV0ZhpkUhUq4j7yb/TzAcXM11yJQ+xeszfy1vSAvRIJLK
X-Gm-Gg: Acq92OG8sGCyYzvmxT9+2zwG6Z/NlObp0tsCMPhPFNz4afPDmgur6bKoJjAUhY1OICI
	j+aabLKtYVeVJQhrQie2L9O1GwNX7LM6jHyG5qmKd5SC/zjm6XyLN8jmHhh4Yf17x0w4eC3TAv1
	uDUw4tRNodru33vrUhBzBuiu98zbwhF2zhvTg4AG7hpVkpvGGGA12DpTdyWX6I/KMeHmYmlYwNj
	b2aIE/c12NoSugV1hZVfjpKiz541RuQNTfPSyUvRxFZPSy+uPcu76RSKOH4mS40LP8Od1lGZAZV
	6g+q1OzHk4qMzGTlCxNptLT/WkNhY6IYJ5Nv3t9muBG5DkU9pbP7KpPaQFfMJVB+CSUdMTEHBmi
	V9Cb4x7Nd+dA8jPpzDoNXQotYL2pc8ruScWFD532vhouBrty1lEZ7Zqm9Uk+9uXeLSS/piHQi84
	K3DbnY50Xpoq73MRes4PeFww0=
X-Received: by 2002:a05:600d:8444:20b0:490:7136:ad02 with SMTP id 5b1f17b1804b1-490b078f2d5mr5481165e9.7.1780327143862;
        Mon, 01 Jun 2026 08:19:03 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:19:03 -0700 (PDT)
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
Subject: [PATCH v3 04/11] mfd: lm3533-core: Remove redundant pdata helpers
Date: Mon,  1 Jun 2026 18:18:24 +0300
Message-ID: <20260601151831.76350-5-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8409-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3FB78621B37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The lm3533_set_boost_freq and lm3533_set_boost_ovp functions are used only
in lm3533_device_setup, which in turn is only called by
lm3533_device_init. Incorporate their code directly into
lm3533_device_init to simplify driver readability.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c | 57 ++++++++++-----------------------------
 1 file changed, 14 insertions(+), 43 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index f9bdc0a1d9be..45e7f7481aa0 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -80,35 +80,6 @@ static struct mfd_cell lm3533_led_devs[] = {
 	},
 };
 
-static int lm3533_set_boost_freq(struct lm3533 *lm3533,
-						enum lm3533_boost_freq freq)
-{
-	int ret;
-
-	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
-				 LM3533_BOOST_FREQ_MASK,
-				 freq << LM3533_BOOST_FREQ_SHIFT);
-	if (ret)
-		dev_err(lm3533->dev, "failed to set boost frequency\n");
-
-	return ret;
-}
-
-
-static int lm3533_set_boost_ovp(struct lm3533 *lm3533,
-						enum lm3533_boost_ovp ovp)
-{
-	int ret;
-
-	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
-				 LM3533_BOOST_OVP_MASK,
-				 ovp << LM3533_BOOST_OVP_SHIFT);
-	if (ret)
-		dev_err(lm3533->dev, "failed to set boost ovp\n");
-
-	return ret;
-}
-
 /*
  * HVLED output config -- output hvled controlled by backlight bl
  */
@@ -406,18 +377,6 @@ static int lm3533_device_led_init(struct lm3533 *lm3533)
 	return 0;
 }
 
-static int lm3533_device_setup(struct lm3533 *lm3533,
-					struct lm3533_platform_data *pdata)
-{
-	int ret;
-
-	ret = lm3533_set_boost_freq(lm3533, pdata->boost_freq);
-	if (ret)
-		return ret;
-
-	return lm3533_set_boost_ovp(lm3533, pdata->boost_ovp);
-}
-
 static int lm3533_device_init(struct lm3533 *lm3533)
 {
 	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
@@ -437,9 +396,21 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 
 	lm3533_enable(lm3533);
 
-	ret = lm3533_device_setup(lm3533, pdata);
-	if (ret)
+	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
+				 LM3533_BOOST_FREQ_MASK,
+				 pdata->boost_freq << LM3533_BOOST_FREQ_SHIFT);
+	if (ret) {
+		dev_err(lm3533->dev, "failed to set boost frequency\n");
 		goto err_disable;
+	}
+
+	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
+				 LM3533_BOOST_OVP_MASK,
+				 pdata->boost_ovp << LM3533_BOOST_OVP_SHIFT);
+	if (ret) {
+		dev_err(lm3533->dev, "failed to set boost ovp\n");
+		goto err_disable;
+	}
 
 	lm3533_device_als_init(lm3533);
 	lm3533_device_bl_init(lm3533);
-- 
2.51.0


