Return-Path: <linux-leds+bounces-8410-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEGeA6WlHWr5cgkAu9opvQ
	(envelope-from <linux-leds+bounces-8410-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:30:45 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64745621BDB
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEC5030F757A
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2026 15:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20653D9DD1;
	Mon,  1 Jun 2026 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rIfDSjI6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86D33DD518
	for <linux-leds@vger.kernel.org>; Mon,  1 Jun 2026 15:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327157; cv=none; b=lELOZKTjDJh+mi1JzIyxOV/qGCpvXbZk6rfmwruU9we2TioNzHBsOiyXJ1r58mkkdAtlWYwGWV/O1a0JzGzn0j0T+j6/nwgDFAKQEYy1Dvylk25xiKcDS1vbTkD8oszD+L9uCy/903M8M+LI5WLwm4xveroT2mRRNB1hQf/8okk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327157; c=relaxed/simple;
	bh=1i1ud9qKyYnaqS2Sm7wFXRXPLupGr8dxgdr5XwdPNHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IpaKg5JWNS7+slF7fN0M+JJItDTQpppc5JvX76zB66RwzuNoxwGUwH7BZFqWX1lP9PCcKcb/1yg9/G6Mw7rIWJ94/xHFW3LvgIRgPu9Fff2h+9IcjtYHMAzdhRWikcBqeJpJxeX1NVAUKRZ/vf1Bclylykiz4KgnpEqRc/0JynA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rIfDSjI6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45fd464d51fso796395f8f.3
        for <linux-leds@vger.kernel.org>; Mon, 01 Jun 2026 08:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327147; x=1780931947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1lcsLIobScldpWx6WSR7/N2rSVozhhuMPVVUCbPDt4=;
        b=rIfDSjI6/z7rwVmbqWC0I2U5pgX6TdSdLHrpyRURtet3XqpmAYtKwW8Vdlo3XdqCf4
         W+UbSlRgSjszlfiAz3KANIuFsuuvJLxyFqO9ZtdrpiuRWGKbwe+0Kj6pCy+YV3iaeXJK
         BkfIcd7hFMkjXtoueKHt2hEJuA4zHRSd+mwv9mGQQlNiLWMI5796uMOzPeUTZ9/AyHCg
         AES8+CKpaGFJGqbLQPNLlEMH1tmy5Eaj3hWZGwSuP6XHZps/KvA7VFcgJtD5MUlRIrqf
         uMlWInZ4BoWZRF5vqHxKKpVGWPIBreE8BYxFi8C5IHyvgTRAnQRwn01CreithjA9vlAY
         JZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327147; x=1780931947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u1lcsLIobScldpWx6WSR7/N2rSVozhhuMPVVUCbPDt4=;
        b=q+nG4IF8v7Pt4bR7z6D/jLlO/UxNgPu9Wg+vdFuw85eseNqvP3cgNRU/R7ZKcquJWh
         hAzoP1vu51upBq+Ls/o5gfydpmpESI3GMYJPVQXbDkteQ9swhSVPxm1sQPirYLeT3wx0
         9z/XhKqkCS/fvZxqEMfm65Ae6KwoW+qbuUvTCJSOHVfWJEl/1xW2dyHm4jR80L6WyaQT
         8Lhalz0dOukzvWTeWQa4y7ZEAVyFyjhHT8lZ/M8Y9K+Rc5L8n41Kfn010s9vvyjU7jiS
         GbWwRqYYvgIPKARDt15H7bvoo7CfKJm4gLgfWUOH5t31J8sQ8dNtpxSVWc1OnyfH/fhT
         zMqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tKQQlGETdvZ/G0xZRmEh3RmZlc7VN4rX4JYafJdPhAFk2xiW5rVVC862hG05FoYegkpIgJecPBfuX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8lBa9yIoqFdGOaXUHVtTcSIipTdRazvBfQ7iMiGxGxZTK+bui
	qiWDlgTPUYqwq6nZ1L/SkkBZWpQkgNjUMBdpjDwhCFebka+RWei8BFAP
X-Gm-Gg: Acq92OG5OvmEWQN5JmACyTSzHPkD19HC9Zq+sLsnuDGDSsYKmEzv+anw8SuQPutxguF
	hJOL0q5V0n+9L3Cy7pV97wPAKKia00ItdZvIJDUoVyWd726RD8+H7oeYr8z6invUfc9iznsS+1D
	k3DMZw7EJNL7Rl9b4yD4+749VNh+T5TYdPSU/j33rYlpHubS/ZeXuYuQcexJurUcpCDUWXnJC7s
	E6FRDVGabI+UOpjC6/OEEV3ID3X+eWboezGOLRBI5nWHocwmrcGTjjtru0inblWG6jHvjgQ1JP6
	440rZiR11RopX0SBCOxDOuIz0i1Kh2ouUAVG48bDmn1VtqdS/pjB6f35xvjxpzdc/bNtyZS4iFp
	in3sTT/00TikITD72oUwiAg6K1O4Zgha2hCYL6fyH/5wHHRYv+1AlncH0j0VKGhId3wAeQ+AK+6
	RxTch9fkTNNH9YmpDp8n0AIW8=
X-Received: by 2002:a05:6000:40c7:b0:460:cfc:eb24 with SMTP id ffacd0b85a97d-4600cfced10mr13759481f8f.22.1780327146823;
        Mon, 01 Jun 2026 08:19:06 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:19:06 -0700 (PDT)
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
Subject: [PATCH v3 06/11] mfd: lm3533: Add support for VIN power supply
Date: Mon,  1 Jun 2026 18:18:26 +0300
Message-ID: <20260601151831.76350-7-clamor95@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-8410-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: 64745621BDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for 2.7V-5.5V VIN power supply.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c  | 23 +++++++++++++++++++++--
 include/linux/mfd/lm3533.h |  2 ++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index d57c2cdf11c5..4dca5641b774 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -17,6 +17,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -113,14 +114,25 @@ static int lm3533_set_lvled_config(struct lm3533 *lm3533, u8 lvled, u8 led)
 	return ret;
 }
 
-static void lm3533_enable(struct lm3533 *lm3533)
+static int lm3533_enable(struct lm3533 *lm3533)
 {
+	int ret;
+
+	ret = regulator_enable(lm3533->vin_supply);
+	if (ret) {
+		dev_err(lm3533->dev, "failed to enable vin power supply\n");
+		return ret;
+	}
+
 	gpiod_set_value(lm3533->hwen, 1);
+
+	return 0;
 }
 
 static void lm3533_disable(struct lm3533 *lm3533)
 {
 	gpiod_set_value(lm3533->hwen, 0);
+	regulator_disable(lm3533->vin_supply);
 }
 
 enum lm3533_attribute_type {
@@ -334,7 +346,9 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 		}
 	}
 
-	lm3533_enable(lm3533);
+	ret = lm3533_enable(lm3533);
+	if (ret)
+		return ret;
 
 	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
 				 LM3533_BOOST_FREQ_MASK,
@@ -458,6 +472,11 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen),
 				     "failed to get HWEN GPIO\n");
 
+	lm3533->vin_supply = devm_regulator_get(lm3533->dev, "vin");
+	if (IS_ERR(lm3533->vin_supply))
+		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->vin_supply),
+				     "failed to get vin-supply\n");
+
 	device_property_read_u32(lm3533->dev, "ti,boost-ovp-microvolt",
 				 &lm3533->boost_ovp);
 
diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index 3fd8d4737ea5..9ee99be93d9b 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -22,6 +22,7 @@
 struct device;
 struct gpio_desc;
 struct regmap;
+struct regulator;
 
 struct lm3533 {
 	struct device *dev;
@@ -29,6 +30,7 @@ struct lm3533 {
 	struct regmap *regmap;
 
 	struct gpio_desc *hwen;
+	struct regulator *vin_supply;
 
 	u32 boost_ovp;
 	u32 boost_freq;
-- 
2.51.0


