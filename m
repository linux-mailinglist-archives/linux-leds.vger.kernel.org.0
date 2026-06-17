Return-Path: <linux-leds+bounces-8629-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kXSbGvlUMmr5ygUAu9opvQ
	(envelope-from <linux-leds+bounces-8629-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:04:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6C4697668
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:04:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HVF+bSHq;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8629-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8629-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25AA03094787
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 08:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FE33DA5DB;
	Wed, 17 Jun 2026 08:01:09 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1334C3C7E1B
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 08:00:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683268; cv=none; b=ACeMfYrrNYlaGIyOB52htWimz0SdnfD0p7frNSCz/kr2dpk4F5zksdOqcKCSgQPHh8JJROBTI/n42wbZjaAVyXStI11YTgVvk9m/x0pV2GHbNm5blC9cO9liuBDdt4fuu0rLMsUI03CRFP3yCCMo7Sjr70AovqzbKOD/d/xO+4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683268; c=relaxed/simple;
	bh=4WjmiWfFTCp+1bBNDrcHv5gGqTRg8YPvmqnJ/PwH9+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZCKlZo/QQPf5wqrZ6UaOFSfpFhkCAJbivjNcD14u5cLqEEKZCPkqeNoaRCaXpIp9f1UIiME6j7TmEpZvesw5Iaba4ZD/UoTCwDQf2p1D0hpVKh39gLq2JLTcuuRQnURiC1+C9xSsG9j2/NvLy7Su90jp0g3uvA6u1/66yOClBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVF+bSHq; arc=none smtp.client-ip=209.85.218.47
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-beb7f26ed62so648210866b.0
        for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 01:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683256; x=1782288056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDbkv4yENGcso8lbBuowMRR6EhhW3sM2nEWvZfEX0tI=;
        b=HVF+bSHqNdQvwqLcn9tqAERPwc90kPjvY1ZlbO9x4CEynUEdYqSkotKSHBTysqh1xa
         f0Nz9C1tt9TuXyQ0YZ13rtHlKkt2q23ZE22a0rO1zvJTB0ecXWc6xyp5tIu6Ju9YRBW3
         4U+gjnfRkDhoYlipuhzNKy6NfC+UXWTaWKzhknJeV4Atb5dU8wHDWScavvsAzrZ05stY
         F/SwjhQ+AX4yLCqOeHfW+ml3x+Lq8gz5WrV1eHpVV7iWuK2yn+nSwW2HrRGoj3XNT4pF
         K0/ltZ+jBPHoG8OIpo3bYyIMmjVqezRifhdb5Q6pLRk74EOfwjw1NS4lmoogwi6+jkWS
         88Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683256; x=1782288056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bDbkv4yENGcso8lbBuowMRR6EhhW3sM2nEWvZfEX0tI=;
        b=I8c6qjqa5N+p9aesSLPmoEPlcbHmK3cOb6JITyi3uSgEdWU/Yh+pKtU9cHyx7xds1X
         eYE4V4h55pRrOHx0F6nrR+FCUSsZtHD8c5CUEyXAZEofnW+CqiXVVaXZuDAaFyoPSTpr
         L7XQSzEzgsFjGuWLAehd4DXiLgsOuZcuxfpTR/7Ca6jb3RNZqFPcvn1Ht8Umbmu6Uavx
         kyJZ1ua92wEEEwiRyNjBdanZ/fAs8bE8bLF9e5F2Pe1faZe1XLDjzCRk4es9VFzx8Dz7
         3dKNCxoPPfHGXH54m6fuPHJzVTFQ8yPX+P9anjOQlwF3YCX1ktIVUO5qRzSCUcxVlZ+r
         JGVw==
X-Forwarded-Encrypted: i=1; AFNElJ/UgINVHd12ixemt4iZ0H2s/jnbtDeq+94J0yYgP5Zf74yM9qApGKRI2ECGeY0xm3ugwf9z8gxJ3OZt@vger.kernel.org
X-Gm-Message-State: AOJu0YyOOXfWfZuiF+YS5JG98EwWz2HTqugwEpp0qClH7+XS9ZIG12NH
	tyl/Iloi16CyAmGzIXy+mEUpYFYn3nloCJcGzSfXiBhBBbBy2T4oSN0q
X-Gm-Gg: Acq92OHxwqihOgJIAmRGHt05o2diAn/rjLuVYw5hgSkHuAO8/24Ssf03OtsYl02u4Id
	+cI/s5bkh4YSaRKlZON+7zQcwG2VJWoPQwK1+JA6xeLQNU6W2O96OS9xHUSmY/lz1JPUdXqxK8I
	PiuzkCwNlGTUI09TqZHYVY/ppfvpzQ6QHuL5O3xyYx3vTXgDVQ0s3bMVKafsrbyywtIlDaKwVxj
	nd9azZcN8Yb/LvvRSaBDik4MIL5ZenLgCpK0LqGbs3v0VEalen/iuHdpDJKHefLlT56ZCCzQEYe
	vV7DSH1gtyVEBzvuT6rLyG2q8j2kloMd0QTXCTKWahp9EVQB5sJmI6eeG7MmxN0waZv2+v55xuR
	qbr3tZA0WUcAzpSkBIorGYRK5Ffj+9jWSZKTrb2nx5PeafPS2jPD7yKyTdXej7pqjORrYBxZVL0
	fzSnUoLakHWODB
X-Received: by 2002:a17:907:94d6:b0:bec:b4e3:e930 with SMTP id a640c23a62f3a-c05a511f1ccmr158862466b.12.1781683255042;
        Wed, 17 Jun 2026 01:00:55 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:54 -0700 (PDT)
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
Subject: [PATCH v5 09/14] mfd: lm3533: Add support for VIN power supply
Date: Wed, 17 Jun 2026 11:00:26 +0300
Message-ID: <20260617080031.99156-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617080031.99156-1-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8629-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:clamor95@gmail.com,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF6C4697668

Add support for 2.7V-5.5V VIN power supply.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c  | 23 +++++++++++++++++++++--
 include/linux/mfd/lm3533.h |  2 ++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index a5aa7da9668b..4b5d94e9ed27 100644
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
@@ -333,7 +345,9 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 		}
 	}
 
-	lm3533_enable(lm3533);
+	ret = lm3533_enable(lm3533);
+	if (ret)
+		return ret;
 
 	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
 				 LM3533_BOOST_FREQ_MASK,
@@ -447,6 +461,11 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
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
index 5710e88da45d..8f72dd41e8f0 100644
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
2.53.0


