Return-Path: <linux-leds+bounces-8519-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zNutNyKqI2qUwgEAu9opvQ
	(envelope-from <linux-leds+bounces-8519-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 07:03:30 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EB364C78B
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 07:03:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MeuMLo6d;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8519-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8519-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A2E330AFD87
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2026 04:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1573A30E82C;
	Sat,  6 Jun 2026 04:58:36 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459CF30DD2F
	for <linux-leds@vger.kernel.org>; Sat,  6 Jun 2026 04:58:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721916; cv=none; b=DXIhsEZymznylvGOHo2dNvjRaPixozdLsKRGEMlbrRFkfy/kSRXTxQWGmv+xtff61jwf3gl1nfBdW092u4k6f+Dhq/LD4vGp2qPvzX6LlTL4ETdwExxkkGMXwS6UAr+mjjvvnqLeJRx6ln3ZKORYCfsMn93el7I82dotSoSQ2VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721916; c=relaxed/simple;
	bh=1nFZau3RQUxnCZgOYDCBt3epgx5xe5YIlqUb8E8u0UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lg3kS8gXKQw+hHhUic/QHjBUNUZ5oydeLkLW2jsqwLJaS1ZoWRymtS5tQ0WpXtKjEzv+OYepsjCAVK0VeH2MjZ059Ua0YyTf2rKI6DzAnsWSdEmmyQvNehscFkKP54S+D47VGJvUHzwGEvcWE3l5JNUnFhwKM4Gj+/I2fUXcZUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeuMLo6d; arc=none smtp.client-ip=209.85.218.42
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bef1e6423e7so261913866b.1
        for <linux-leds@vger.kernel.org>; Fri, 05 Jun 2026 21:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721912; x=1781326712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlI5mUz8s798lOZfnX8f9JGZtNvnkftPBfqwbzzNVuw=;
        b=MeuMLo6ddRVm4igBW3Yn2OS7xsV+kQTx3p48MhwdrnG77458i4pHAqhN6OK2U1I5c0
         iQPBtpxS/+vZX8/eMqS0fv0LAGGXQVdHzaObof2MDhEnYB4C4gY1zJP2NrqXq4QCuvJ9
         3lyivExzhuIbC58zbI/2pV91uiunbu+avjuZ1oJoa7hrJL5tMSCs8LuMAmmPKu8KPe9a
         ekgkxNrfhoAn6pm/CZ513lgWxyA/RbFh2aBcLMVUxBXYx5O2YSJnYKWkKlL1D3ZnwVqS
         Izd8MJGGAyuGsvOg5RRk3yEiPaXi8TWJBMINw3HQHGzuisu+mwEDGqY/UJQLFtY0L5+Y
         cDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721912; x=1781326712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RlI5mUz8s798lOZfnX8f9JGZtNvnkftPBfqwbzzNVuw=;
        b=e70RXxkGBckL/Kqmde4FP5Urh+xkJ+R2sRInU2WPZQZv4ChrVvAg2uE9y3xjk5yeh3
         sIVcMHQFR5a6uYnkUBzMxm7xMgoqwAtnNz8C8iIY1LnirFp0TyjiZSsNtk78O10kIBFg
         BRLrnpvsBtrB6fFI5Tk9lDcONIUdjBrX3dDj5T1vB1/V2vBJ4SxdX41VWT6lMHQLSRsZ
         8Xf9e+xOxMkjUfNjpkkDm8HbRLKissPl+LhkMHtLPD/3iOp9QqgmudvchWx7Ex5vRtew
         ZxIYMmny3Qym4GwlVh9851tQqjrwVW2j3kSxwVywGN9WcIptqpdmNgSiczeaRN+63GKK
         4xbQ==
X-Forwarded-Encrypted: i=1; AFNElJ93PMVLIgQ9PKUijBYGenfNHKUxEvAMLVdXiZMOvZD2Kbx6PGjjz6VuTH+4Fkjw3sq6OqVwyaNx5LPn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6d3RZpRR8h7zGcPLROEMP03I9u+MMhItMafp0CZwWprXDXIiQ
	zwN7M54/WRNR18dyzNP6DH073n7VUzDPqZ5T6e4A1Hvsk5NnHF8Y4Lyu
X-Gm-Gg: Acq92OE/g1U3uRcgRof68cQxa09b5dXxngALBmTbD3JhTAcn0LVgHj3OtOlLot9EUmL
	jBv96nHWNUl2Dib/ApgegMWNsWSBRVIoVAXXnJpoYKFBuP1ncqmyXayIDJGk7goFNjMUPj7kN5E
	MZCbLkkRhq4DXjOPY9wHsVjwVfexvdK73RQ1F9Z1hgyoUFJX3Ixb51wyPfR5yxnIB/BlDvRORIY
	3tBQFXbFhDzARk4Y8CNkbYEFC+kCe9gtXX2d/GiplgODRTgXstvYP1WlmPfS9sVAaR6ejdPZKKf
	i5zjlo8F8XPz9p0rIboUBcAWuG+0hE1FABw213ObFyXXNyUOqPzZOEWNZh7eTYQjQ92wkxqO0+5
	F3c5xbrNWm6IS3D8MPVZ8Ycne7jXbJBhAXA7ZKkCvQmv1BHQYKZgEtxHLAVO13cUxAqbt7lKOk3
	YqFmfcNr310I3WVLpusdcITdE=
X-Received: by 2002:a17:907:c247:b0:bed:6e53:bb16 with SMTP id a640c23a62f3a-bf3743e5c7dmr350247866b.43.1780721911635;
        Fri, 05 Jun 2026 21:58:31 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:30 -0700 (PDT)
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
Subject: [PATCH v4 09/14] mfd: lm3533: Add support for VIN power supply
Date: Sat,  6 Jun 2026 07:57:33 +0300
Message-ID: <20260606045738.21050-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606045738.21050-1-clamor95@gmail.com>
References: <20260606045738.21050-1-clamor95@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-8519-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55EB364C78B

Add support for 2.7V-5.5V VIN power supply.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c  | 23 +++++++++++++++++++++--
 include/linux/mfd/lm3533.h |  2 ++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 5af1d5476d3e..500cec3cceba 100644
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
@@ -332,7 +344,9 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 		}
 	}
 
-	lm3533_enable(lm3533);
+	ret = lm3533_enable(lm3533);
+	if (ret)
+		return ret;
 
 	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
 				 LM3533_BOOST_FREQ_MASK,
@@ -456,6 +470,11 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
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
index d3f7b07dbefc..3f9f4c9ef9f3 100644
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


