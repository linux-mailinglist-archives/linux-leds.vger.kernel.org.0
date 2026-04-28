Return-Path: <linux-leds+bounces-7891-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BkLELTU8GkSZQEAu9opvQ
	(envelope-from <linux-leds+bounces-7891-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 17:39:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CAD488118
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 17:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E85B30684EC
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 15:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29223BD648;
	Tue, 28 Apr 2026 15:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3Q0+Ha3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC7B3939BF
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390606; cv=none; b=f8ytzun5CzVZtJ8+fQa6qCwRgZWpX18XlkbqIPLKF20wzXZNor3rDcoOXtwsp3AzKmaAqoT8qV/7P4GEaFLzEQ/0CSsaWSnB96eu5+f6uFjOLK93lVe3cpIJNsdJI5RWFG++VC08sT5+7wwMk9rej2/nV64KOwuWHLy7P5/Xy/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390606; c=relaxed/simple;
	bh=w1dOcGnTI59GCQNhwQP6xzsT4wAulf/UcemmHchCPqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fzgTuAE6tOg4uGpHedVzzpDnHSqmtwPaIcMzrMjhW1HXDsONRZ8jKIpSbzXILqoJ7IYcf91TAlEd6+FKdkAKGQGQJS1MQLKM3ZTEEYa5tVWRkvfvAAFbzg4jGFUA5F64Mz+WktjFq/6iHCOpr1eR8X8Yj23AyrvSZMb7rx+s0fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3Q0+Ha3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso120999415e9.1
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 08:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777390601; x=1777995401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53/v+YSG+6GYj3ywOiaHOLUwr98tdqBSh9I2cLizLtg=;
        b=C3Q0+Ha3niA+phA2/JO6CfVgc1Z+kbW/DmXN3FUc5Qch7M5fzGHyJ+DwXZf7qo6zcU
         Xudbu/FyVlr8RqaQYfJQpBtchVqDKSerH8tthnh/4qi1qN+CBE3/8yOZeUrEU0qVQSgS
         bu0N9t1a60RgDhr+Fh0MpaL3aMskjuq/bG4VUv5QHv0RwyeSIgDpFiNPRjwworGND5RT
         ixBEacwrdMKArQTg2ioFkkarciD/vyozMPjSF6QFw38Iz2HUmq0eyXXo14+oCy15qZXi
         9QMEPjlifBACQe1tXZitXLIX4Z6/aLhYg1vBpQ+lutnm1vhZvFQiu88pfDjamEQ2G/9Z
         KIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777390601; x=1777995401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=53/v+YSG+6GYj3ywOiaHOLUwr98tdqBSh9I2cLizLtg=;
        b=a75fQV77RxuKTmvYSHL6V0kEAhAws1f+Ph1CxnHAkGs8WpBL2oojyVXwoK53kGAfT1
         qTZMuqUK+akvm2thJ3r+9lHc35Eqy+Za2cCoJ7U46O9P7yfBZjTrIyHZt5uLSzuKK85U
         3tGsGECkIESd+mcON2PBX/D38pYHIy4OcTM/3B/70kzkckLmxAOkjjuRJlyGfVA0X1ub
         4ygK6CLRlHKCQgZzmZDUdQVurC8DZ8OGf64+2Zbp6egQVrRWSf21fPcuLapWsSFk26bx
         rjMhCvMUq/85uBwbvMlWyCJuCcWjiTEpVTtpUYkqR0gaMEA0hQjLgw23zUDdXvavsfkG
         jNeg==
X-Forwarded-Encrypted: i=1; AFNElJ+J7hqCv8sB3GvevQRfXe0Mu1pyIoYo09BaBQMwy0vslEDTPAcYJqnb1fQ4KV2zk9jTW4yg0BFU08hO@vger.kernel.org
X-Gm-Message-State: AOJu0YyvxM3qQCHvEeRBiCBLq5gwozJa9YjfAoRuFta24cP1FSEz8unh
	1aViLsfmbnVJZd0Vhe3unXQj62J354pxqJIY1YyHqkG+Xjlab1p7S8lC
X-Gm-Gg: AeBDieviRNHeps/adlm7TcpDN7aGo8NYphfW54dO4mFJR33q8M4tJs207jiMuGzvzsO
	ZUGZ6wMBIdX4edW5y0MJz3uhvPSNsdgFircyeysIx+prhYjkyv5IjYYCyG3rlcg+IyvIVapp3gm
	OIoES6EzdrJjpFHvjBQVW1h72xElo0a+Wm7BHvYLVml+ZwpcFG+INpLTh4/WZAmtsnvjCFG62C7
	wNigL+jSbBf6a+ecYw+hSu3nZJDQ7zTeSDOCOwSNNLZTJZG8vYKXwdWObWrL5Ufi7Fvv9HGcJtq
	stNtYIyYut7e4l90lMDWVL1+phwJ1/6VETGfuvKGeTtnTv8I6SNR6ja5J5u31uIIT8a6qIXb4CI
	k4hpYf04IlgYx3Q+62bPcktthLwUB6IQSTYVlQPllqNA1qQrEaWTI55gu1kx0ipmW63OCo9OjhD
	UjCTinwXlBBIN2EI0M60hoEjI=
X-Received: by 2002:a05:600c:c08f:b0:489:1b10:d896 with SMTP id 5b1f17b1804b1-48a7b4d165cmr3095065e9.0.1777390601346;
        Tue, 28 Apr 2026 08:36:41 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b56c2d0sm1358875e9.11.2026.04.28.08.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:36:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 6/6 RESEND] mfd: motorola-cpcap: add support for Mot CPCAP composition
Date: Tue, 28 Apr 2026 18:36:11 +0300
Message-ID: <20260428153611.142816-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428153611.142816-1-clamor95@gmail.com>
References: <20260428153611.142816-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A9CAD488118
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7891-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]

Add a MFD subdevice composition used in Tegra20 based Mot board
(Motorola Atrix 4G and Droid X2).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/motorola-cpcap.c | 50 ++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index 516d1e33affa..fdec92f5c6b0 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -335,6 +335,54 @@ static const struct cpcap_chip_data cpcap_mapphone_data = {
 	.num_devices = ARRAY_SIZE(cpcap_mapphone_mfd_devices),
 };
 
+/*
+ * The Mot board features a USB-PHY and charger similar to the ones in
+ * Mapphone; however, because Mot is based on Tegra20, it is incompatible
+ * with the existing implementation, which is tightly interconnected with
+ * the OMAP USB PHY.
+ */
+static const struct mfd_cell cpcap_mot_mfd_devices[] = {
+	{
+		.name          = "cpcap_adc",
+		.of_compatible = "motorola,mot-cpcap-adc",
+	}, {
+		.name          = "cpcap_battery",
+		.of_compatible = "motorola,cpcap-battery",
+	}, {
+		.name          = "cpcap-regulator",
+		.of_compatible = "motorola,mot-cpcap-regulator",
+	}, {
+		.name          = "cpcap-rtc",
+		.of_compatible = "motorola,cpcap-rtc",
+	}, {
+		.name          = "cpcap-pwrbutton",
+		.of_compatible = "motorola,cpcap-pwrbutton",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 0,
+		.of_compatible = "motorola,cpcap-led-red",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 1,
+		.of_compatible = "motorola,cpcap-led-green",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 2,
+		.of_compatible = "motorola,cpcap-led-blue",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 3,
+		.of_compatible = "motorola,cpcap-led-adl",
+	}, {
+		.name          = "cpcap-codec",
+	},
+};
+
+static const struct cpcap_chip_data cpcap_mot_data = {
+	.mfd_devices = cpcap_mot_mfd_devices,
+	.num_devices = ARRAY_SIZE(cpcap_mot_mfd_devices),
+};
+
 static int cpcap_probe(struct spi_device *spi)
 {
 	struct cpcap_ddata *cpcap;
@@ -389,6 +437,7 @@ static int cpcap_probe(struct spi_device *spi)
 static const struct of_device_id cpcap_of_match[] = {
 	{ .compatible = "motorola,cpcap", .data = &cpcap_default_data },
 	{ .compatible = "motorola,mapphone-cpcap", .data = &cpcap_mapphone_data	},
+	{ .compatible = "motorola,mot-cpcap", .data = &cpcap_mot_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, cpcap_of_match);
@@ -396,6 +445,7 @@ MODULE_DEVICE_TABLE(of, cpcap_of_match);
 static const struct spi_device_id cpcap_spi_ids[] = {
 	{ .name = "cpcap", .driver_data = (kernel_ulong_t)&cpcap_default_data },
 	{ .name = "mapphone-cpcap", .driver_data = (kernel_ulong_t)&cpcap_mapphone_data },
+	{ .name = "mot-cpcap", .driver_data = (kernel_ulong_t)&cpcap_mot_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
-- 
2.51.0


