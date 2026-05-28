Return-Path: <linux-leds+bounces-8350-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCddHA1KGGpoiggAu9opvQ
	(envelope-from <linux-leds+bounces-8350-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 15:58:37 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 067A95F337A
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 15:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E410322CAED
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 13:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7122D8DB0;
	Thu, 28 May 2026 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WM0NCWkf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FF62C15A5
	for <linux-leds@vger.kernel.org>; Thu, 28 May 2026 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976317; cv=none; b=jCIPSetTSLM7jAWXCKXGL6syPUfzYv7sv1JczZSAyvmkjKwBCvBX40J19kgepdJdZCnzF5nkIV0/Ik332CFU8lkBeaYm5r1oRslg0Jj6uffDhR7NrqjV7OU8+owvGBITk4RmdbJBDcFqMwRracnzBmoB+Aa1a5dwMI3JnZz64UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976317; c=relaxed/simple;
	bh=GVDB20doAR1K3eUlSf2alRlQ5pVPpRgTdHeEwbkCl1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pcEFUEft5Uq1p5AXjT5c8K3gQaUao5t2/bXyJvt3d1+XVaYOzX9QC0HDGUOqwlPBJrhJvzFCT5CtMlRp2M50rVTgmKd6YD6sgoc9n++qZ8qadrdws6WE3FHmNFPuvUdGETTXU9245815x9NP/FdvjS+mamQFLIJqf/2whw+CoXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WM0NCWkf; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bd2e8931915so2554340366b.1
        for <linux-leds@vger.kernel.org>; Thu, 28 May 2026 06:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976313; x=1780581113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RF2xk6t5S9a3BXZ1svw/IWrQWbafQA9obLcpKPhSUU=;
        b=WM0NCWkfxxhAP1fs+Vo6mRLqj6NIobz/HNMMMFa+sRnSMxYkv/45NnT4Smn4bmOIVK
         KO+Qpf4eTYFykEuHrLoKOpIqvv11vwJBmKUnX77F9J9UC2x8b+ulhQLf3xdCsy6GMHke
         T1qZTr8x40LTNP3rixwb5g9MQzcMwrrBc1XRv/8DCe57fPbgTH0r+lz48UnUKGNDjknB
         /lNNdYQ3Z1/XyKGFvL8Ms2xg88uTaKaN9pyFuk01JIELKWVVmWgPQkwcHXPRbuxqNPeM
         Ls3k5okZp2MAEviLQbi+G1VIeL9umYlji8BxGasjL94HP5QCOl1qMVIPNzliRQkOZqAE
         wB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976313; x=1780581113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8RF2xk6t5S9a3BXZ1svw/IWrQWbafQA9obLcpKPhSUU=;
        b=rGst6OYyNbhjRa6GQG/OoEl1mzUc+bsEDHQpJxzgh7zFtlCM2gRpkKeRnVxhEenNDX
         cDe3kbNb15HwGSfqI+MXyo9+yqu+bPRYo44NIWiHz0V+ci1kFVpXyiQiEU5zWnnf1lB6
         hOj5zOJr4VsZul46UdXsjlsWD+ySst7s+3EyuTkpge03tVqJ5kQ2/DlFiwd9rk3zgpJY
         YybNNP0V6SKxheNBRovX5VSweJzOD2lQvRUI8VIBmBXHeO59Riw+fUS2AH2STE1sKtw7
         I2Ro21HwegvJ6nBjj0J/iHPgJs1ozkMei5/4CrBxgY9zHwvdqpNfIAv7fZhHgwsnSZLb
         xFXQ==
X-Forwarded-Encrypted: i=1; AFNElJ80XmLVjI8QSrupSzk5XS41Sz0zlDWOPRE+GbTRqy6EXnlgJ065y/H7hQjwyQ898lTM+bJfRxy8doth@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj4vKLnXKNmHrmiAFw/9w8N3AB74mNQHyNPORA6AeZLk4ys9PI
	zr+qmX4jgS6xjsPYONH7zTOdP5OSjcef/LPIqTMXi7FhFSgNzWh10k5O
X-Gm-Gg: Acq92OGWf+OVSFlVyCTkcXzqXFJCmytBKqWjUJMTlIiRdmLtnzVglEvw/uZpc6wspOo
	er5wnoOrBUCapJNeK7iNYI5KKoRXlbB970awTdDbAIC2q4dwC/l4Xlk59tL9P1QfCAa3ixeqnC1
	HTgtqjR6ckNNFlM8wkfzHn5rUfuxfL/pJbUoQhd8cBNnkUHWk9oIeyqqte+pnBtRUfbyneYd0L9
	w6uHzDginu+xr41BVz1jvD4nwQFdhoDyjEgwTkOBzfGBppHB+0lV35QvmHbYtfkMeRCa+QUp1p3
	OHljCibhH4+liJk+IiN8NNJuNTI9fhf/kgb0w2psTPg7IeULhDd2xI7S+f0BbugoqzAmK2d9NkD
	LwjLuLPgwakYXdAiGIn2wYicRnROdr7n6fvBvLx94iUotJAt3Qy3WFK/qVnYBKq8l7sPuaemc6i
	zbGyqck1h1FP7FAaTyjhAsTJ6ut2Rxs15NPQ==
X-Received: by 2002:a17:907:1b06:b0:bd5:b27:c02e with SMTP id a640c23a62f3a-be86d71c01amr114017466b.6.1779976313029;
        Thu, 28 May 2026 06:51:53 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc65da3bbsm723636566b.52.2026.05.28.06.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:51:52 -0700 (PDT)
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
Subject: [PATCH v2 3/6] mfd: lm3533: Add support for VIN power supply
Date: Thu, 28 May 2026 16:51:20 +0300
Message-ID: <20260528135123.103745-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260528135123.103745-1-clamor95@gmail.com>
References: <20260528135123.103745-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8350-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 067A95F337A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for 2.7V-5.5V VIN power supply.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c  | 23 +++++++++++++++++++++--
 include/linux/mfd/lm3533.h |  2 ++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 8495e9119871..519f8c16a3f3 100644
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
@@ -164,14 +165,25 @@ static int lm3533_set_lvled_config(struct lm3533 *lm3533, u8 lvled, u8 led)
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
@@ -324,7 +336,9 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 	u32 count = 0, reg;
 	int ret;
 
-	lm3533_enable(lm3533);
+	ret = lm3533_enable(lm3533);
+	if (ret)
+		return ret;
 
 	device_for_each_child_node_scoped(lm3533->dev, child) {
 		if (!fwnode_device_is_available(child))
@@ -493,6 +507,11 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
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
index 3aa962d4c747..d751773fc92d 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -21,6 +21,7 @@
 struct device;
 struct gpio_desc;
 struct regmap;
+struct regulator;
 
 struct lm3533 {
 	struct device *dev;
@@ -28,6 +29,7 @@ struct lm3533 {
 	struct regmap *regmap;
 
 	struct gpio_desc *hwen;
+	struct regulator *vin_supply;
 
 	u32 boost_ovp;
 	u32 boost_freq;
-- 
2.51.0


