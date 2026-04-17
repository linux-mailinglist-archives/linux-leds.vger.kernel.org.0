Return-Path: <linux-leds+bounces-7756-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDbpIeMc4mlX1wAAu9opvQ
	(envelope-from <linux-leds+bounces-7756-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 13:43:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2616541AE16
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 13:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E3303041B2A
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 11:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACDF39B4A2;
	Fri, 17 Apr 2026 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVN4u5g+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38FE397E91
	for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426170; cv=none; b=jX6I5e/xEBaujAQ9W4JlJFcJ62reifsQLIbxebsTw7nFMWNBMMTIlW9J8BUQyy0r7J9AitAvAqDQoNaO+NzhY4zTFEXPzAEaqnYX/R9beVY/RmMxAUx0nJ+8VwCoHYiBiYTIan3UHZz8DD4JQiOxrUBew300g9yIURfi+Tpk/aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426170; c=relaxed/simple;
	bh=Pji0/ofzjtQ63oZLWNDkDfpZTnQz3RIaDahYeQ6edfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exa4kpH3nXX8LSYobRXMdINRtrhIS2JfMt/lDxYDwc7rrQMPttPO8wG30n709Fmd2r+/itrqE5nsJ1h0BTcP3gJGHxsj9SxwUJoVsQWp/2PzKe9U+SOzLgXmiasLH8ggBztox0am/b+1hAxBVdaVukCaTnRToCEpgLVKUgtofDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVN4u5g+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a2c500750dso627997e87.1
        for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 04:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426167; x=1777030967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTztIzyLZUtX46/uC4DmLedmtQKgb/ItDKns9uW8WRo=;
        b=qVN4u5g+HrPiZXYg85xntUJPHeFQd7o11O0U71PmH9ce4MtuET8xY0Hovmqm+3ifsA
         uJ35nvO1sLB6BbR4G0N7JQWysH3JmNEmT+vF7ZHDMr0zX8DVVSlWY1FwniQkF1L9xTc9
         OjW/v8Jm8A5IVfW/H/6RHIdt4HN/Z9VKtwQkjMwFpCMJaFtR9jzjHEnva3h4yWcR5Vdp
         f4TXkV12SRr5+xcjBuaAz5eBbCGjHUFbDbmSalO2Sl2r5lSnsQgOLuQmw1dPsZ3Fryp0
         1Z+DLHbBzEbcS1EQH7TMsdA7PjbnxR0xzeGJX9TrRAOej6AQJVJ3yQyL2TofUz0k0lCm
         cSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426167; x=1777030967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bTztIzyLZUtX46/uC4DmLedmtQKgb/ItDKns9uW8WRo=;
        b=PVCeORN9e8vt+WT5Rr2k8IKKPrIIALc/F+54Kenqy8ux8t/UhQ/qz9VpiM8w0ZJi85
         6abqv9vJPE6HSCDJNj4s0ZC00ZRx1MeTtlwii+JhaAUmu6D5kpAV8zn3JJwyNithzzwY
         +kLU/IblhO7+jOT59QbZz2IwqYMO/AuiRg815avzHABmk7uNdIWtjYxathv8L43YMTSe
         ZHCW2qlFIldK2uvWSW0hZslA1ns6QE2GfCEfswFZeUs6QcAnBaIEw4Imi5JPDxrUgboR
         iqUIvYuoKczz/ZwwekNuiJ0Qt0tHIjDNihJq/VgWFmlYfbXr/FDHjawIjIC7w8zkQoiB
         iJ5A==
X-Gm-Message-State: AOJu0YxkWkWqheCN/ggeLqKDAxdYbk9AF7vTomRIOf3xXP0NMga7zLpX
	asspy9IUu6R+xiMoOJOYIJaUqGbcvhrAGYrcawFi/8gdq9vTBemqtS9LXOAlTGyJ
X-Gm-Gg: AeBDietm9UPiAJXanapMuWor+vEgWTXQD15nNklCdbzPl2PdSXeSDyaBf3DGdh4MWw1
	NFa6v1yasM+hZoWH569c+BKaxOrNg6JSP3JtgO6eFNbViSWGsVJDNqtpiB3sB2H7zFhmpioo9m7
	KnT/3vQcQHbBjZZd89cFqLJoh/k8UHCkn/LtNlVtl8mEN24CO9HmEu9vWsa1uqP3+mpJL2jnttU
	8Y6vQHTS6jXuyaw/IKaCpQjJWaZocA0/0ClAZuGtLbtnSRO7qH6wjtcydIkqUUoNa8anSQn3Eeh
	Eh9kKH4PlSnKYa/Wih7LUlMRxTHHkXQtpF3n6XpeuRqzw9diPr+nZlyi7DUDyIKHiVLKyB7QDNy
	yNh3/0nEmEe9ZmjKFzveXNh4rxEzbXOmoUyg1McpCqNntDuSZOrSgSKxWDk95eDLwNPMHNeYT7J
	jcsiHRlDr3Jh5oQCHLd6ecaJU=
X-Received: by 2002:a05:6512:6d0:b0:5a2:b487:b945 with SMTP id 2adb3069b0e04-5a4172c67afmr809260e87.18.1776426166838;
        Fri, 17 Apr 2026 04:42:46 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 2/5] media: lm3560: Add IN supply support
Date: Fri, 17 Apr 2026 14:42:23 +0300
Message-ID: <20260417114226.100033-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417114226.100033-1-clamor95@gmail.com>
References: <20260417114226.100033-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7756-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2616541AE16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add IN supply (2.5V - 5.5V) found in LM3560 to ensure its proper work.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index e6af61415821..a2674af6c9fb 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/videodev2.h>
 #include <media/i2c/lm3560.h>
 #include <media/v4l2-ctrls.h>
@@ -434,6 +435,11 @@ static int lm3560_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(flash->hwen_gpio),
 				     "failed to get hwen gpio\n");
 
+	rval = devm_regulator_get_enable(&client->dev, "vin");
+	if (rval)
+		return dev_err_probe(&client->dev, rval,
+				     "failed to enable regulator\n");
+
 	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
 	if (rval < 0)
 		return rval;
-- 
2.51.0


