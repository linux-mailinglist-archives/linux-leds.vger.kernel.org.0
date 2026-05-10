Return-Path: <linux-leds+bounces-8071-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CiqGctnAGq1IgEAu9opvQ
	(envelope-from <linux-leds+bounces-8071-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 13:11:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D6B503BFF
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 13:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 566A730305F1
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 11:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C3537FF5B;
	Sun, 10 May 2026 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQGubsfo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9A937F74C
	for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 11:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778411323; cv=none; b=heC+JJx94N6OcPRd+iFDiIv8CjgRSiu2IVdicePjYfQMGQcqz0zj2pE0x8J2iLp7Pb9My6b0AawuZ3p98prOYwmRO9GsBfHCIVM6B6ccmN68Eyii8T/ziVySOW79Cu15YN8ieBraKgEWo0ETDwoLIby7onssbwsCET4rvcKMR2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778411323; c=relaxed/simple;
	bh=VWNSeXLpRAe/celgCxjIoqvqXwbqAv0wT7y/dppOsEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fg4fJwjZ04o7Th9Vcug3tZxqaIOcIegO48204MPW51upUEF0GBM0njkFBzBjXmy+Yds0dtl/Nus8Mpa9fvfC6KM9JM5M3V+5CTIpouGgxdhd89TVYBGGIu1O/YXu7sYxWr42OO6zifmOZLaUL+DNI+vT05oid9rslTQoLLp6OrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQGubsfo; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ba922426c5cso601422466b.3
        for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 04:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778411319; x=1779016119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1KCdtbuRFFxdaXY/A3Jna+lCae9dBlkmFTwEdkEb4o=;
        b=nQGubsfou3ClYBu3/P4QGarS7yV8KMiiaMc8doQVWYXnu6BKfXgv+VYb3IEgUMXxTQ
         20JcD18wb1Ay2TUg/L3glAKx1wBH+reWA6tFgRELgYKP+FSZTUWrVdMJ+mp1xotEF+EC
         zF/E8/xZJidEv1azSL+rp9GZijFV3rc9CH3kQg2Z63Qyfmo8xDchakDgL1qONWe1RoQQ
         tAPfKqxOdp+dLFSSR8KKZ7x5GNu1ulTHp3qN4R6exZTtgVElhWbNqVHNFFCRG7OBx+jM
         O953MUg9iWU8NRsJ6aEm219F3o05vW3E1/IQlR+WfWymIlCrFaWplSvBxwEODi8RtQkj
         mlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778411319; x=1779016119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t1KCdtbuRFFxdaXY/A3Jna+lCae9dBlkmFTwEdkEb4o=;
        b=BS+sJCDKY+tDWy6ylT4NVtxK4nTJ9e7q9+J7pnuqIfoITNFJLqdKZiSQnHxzvz0oP3
         lW3lJOiBZPC/2B/Pb+tc1g9rcXrpOWqreItgBNHc0uiK1dxfiRtyUBqSIWyDBIchkPQq
         gM0JjMyWiAaFyyh8/kqmfQkueqtn9Z331iGCOtBYFMsRHz6UK8zUTT09Bmtbwqw9gRtF
         fzrWjbOw4E6k86jegri+YTTkn8Acyg5pVr8+I9JV4X7MHW5N8pbJECJMCLueyh6wjh2Y
         wDno36sbw0hxfpzUe2fX8pVCGcT1zb55f6ezmMpeEkLLFHZ3CPgH/f0chS3VI6NdsDYD
         eMqg==
X-Forwarded-Encrypted: i=1; AFNElJ+Qo1ikIzje358AwQGEZYJFq0kuLz1l6oouSwQffY/k3G7PuOgjoSECcY7RE5PSf/oRQIavGrdaB1JY@vger.kernel.org
X-Gm-Message-State: AOJu0YwM0aUARB5ZWRMqaCNRqIVXtUEXxbeoaLpvWNXXFwkAWpUExvSx
	GVV9cF0ANQ4nwcAwTGj5PE9gBAAtF952HR1qDszfwDaivBHv7bMb5bsC
X-Gm-Gg: Acq92OGP4vHN9nZ8cQXPx3iNf2/RPhmnEghGFvuh3AtBmJa7b3WXK9ACcli3FZ1CIPS
	8LynAxHlW6mDjb9zBXsWNz24CZ5KCTeSkGmkX/Hklh9PK6jnAPYU9x6fqCazGEP3vIeXwmVhwXI
	dbhaIYU3Db4tdrQg3UMh0wkYPHTaW8jbsvlIZ6vTCo3XGHV3dNBtA5lODFl5msP66t/wt17kJU6
	Q9lEvr08QtsKXs4IIUQCfi76RHjkQ8bxdkzhyt4cq8zhdrreJK1+kDxtAhAykCbJF/cEpKKvYsp
	btpwnixjr5DSqnyuOnaVVYhSBxYP7BVz57vjbsfzAUUz+ULBKR6sZDVWKIS6gD6qNnpLY2aRszq
	BLABl6QMPbWLLOcKIfbz8j7ZuAud/7PP1T03Fu/TscUQDsVOYJRizMrCx4Unq69CDVsH+IP/pDF
	izxJXP4hOa8rLU
X-Received: by 2002:a17:907:868a:b0:bcb:ea69:39c8 with SMTP id a640c23a62f3a-bcbea694c4fmr319764566b.38.1778411319038;
        Sun, 10 May 2026 04:08:39 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce7a3fcb57sm68146866b.60.2026.05.10.04.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 04:08:37 -0700 (PDT)
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
Subject: [PATCH v5 6/6] mfd: motorola-cpcap: add support for Mot CPCAP composition
Date: Sun, 10 May 2026 14:08:04 +0300
Message-ID: <20260510110804.33045-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260510110804.33045-1-clamor95@gmail.com>
References: <20260510110804.33045-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B9D6B503BFF
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-8071-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add a MFD subdevice composition used in Tegra20 based Mot board
(Motorola Atrix 4G and Droid X2).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/motorola-cpcap.c       | 30 ++++++++++++++++++++++++++++++
 include/linux/mfd/motorola-cpcap.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index f5a7fdd89dd5..bd9fb0d61ba6 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -270,6 +270,28 @@ static const struct mfd_cell cpcap_mapphone_mfd_devices[] = {
 	MFD_CELL_NAME("cpcap-codec"),
 };
 
+/*
+ * The Mot board features a USB-PHY and charger similar to the ones in
+ * Mapphone; however, because Mot is based on Tegra20, it is incompatible
+ * with the existing implementation, which is tightly interconnected with
+ * the OMAP USB PHY.
+ */
+static const struct mfd_cell cpcap_mot_mfd_devices[] = {
+	MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,mot-cpcap-adc"),
+	MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
+		    "motorola,cpcap-battery"),
+	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
+		    "motorola,mot-cpcap-regulator"),
+	MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc"),
+	MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
+		    "motorola,cpcap-pwrbutton"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-red"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl"),
+	MFD_CELL_NAME("cpcap-codec"),
+};
+
 static int cpcap_probe(struct spi_device *spi)
 {
 	struct cpcap_ddata *cpcap;
@@ -294,6 +316,10 @@ static int cpcap_probe(struct spi_device *spi)
 		cells = cpcap_mapphone_mfd_devices;
 		num_cells = ARRAY_SIZE(cpcap_mapphone_mfd_devices);
 		break;
+	case CPCAP_MOT:
+		cells = cpcap_mot_mfd_devices;
+		num_cells = ARRAY_SIZE(cpcap_mot_mfd_devices);
+		break;
 	default:
 		return dev_err_probe(&spi->dev, -EINVAL,
 				     "Unknown device %d\n", cpcap->variant);
@@ -343,6 +369,9 @@ static const struct of_device_id cpcap_of_match[] = {
 	}, {
 		.compatible = "motorola,mapphone-cpcap",
 		.data = (void *)CPCAP_MAPPHONE
+	}, {
+		.compatible = "motorola,mot-cpcap",
+		.data = (void *)CPCAP_MOT
 	},
 	{ /* sentinel */ }
 };
@@ -351,6 +380,7 @@ MODULE_DEVICE_TABLE(of, cpcap_of_match);
 static const struct spi_device_id cpcap_spi_ids[] = {
 	{ "cpcap", CPCAP_DEFAULT },
 	{ "mapphone-cpcap", CPCAP_MAPPHONE },
+	{ "mot-cpcap", CPCAP_MOT },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
diff --git a/include/linux/mfd/motorola-cpcap.h b/include/linux/mfd/motorola-cpcap.h
index 1a85b06272c8..bb23363eeccd 100644
--- a/include/linux/mfd/motorola-cpcap.h
+++ b/include/linux/mfd/motorola-cpcap.h
@@ -28,6 +28,7 @@
 enum cpcap_variant {
 	CPCAP_DEFAULT = 1,
 	CPCAP_MAPPHONE,
+	CPCAP_MOT,
 	CPCAP_MAX
 };
 
-- 
2.51.0


