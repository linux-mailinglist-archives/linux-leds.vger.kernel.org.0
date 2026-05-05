Return-Path: <linux-leds+bounces-8004-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI2cAS0F+mkEIgMAu9opvQ
	(envelope-from <linux-leds+bounces-8004-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 16:56:45 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7154CFCE2
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 16:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 713F530977BF
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2026 14:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CA5480DC6;
	Tue,  5 May 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYzHeq6W"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2C4480972
	for <linux-leds@vger.kernel.org>; Tue,  5 May 2026 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992862; cv=none; b=KMNMN9Co0Jhz6CHqIXGoNMvitfiQGGtPt3OzW4YCUOJVyJnmvam8SBbpJXQAZbV1fnyUGdTs/V+xO0mrLTvfFpjsUwNlzZ6hX6TH3xSROh3GpAImXDSmW5GsQV4WseOnmuA/6x7uTUyp8AbeCVkCxBF70A8N86fv8kqz7jIUROE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992862; c=relaxed/simple;
	bh=E8KHLC1Nbi3NBLgVxLEsG0ZdvPc4VF3KSVAQfL9DEHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uaYQ6cC/FpeUi85+Ijt9MQHlkyTklQPEPiwutzI0SxVHPLOAWzC4GHwC0a+vNH9tmFXLdJ+zEXoZvu4vBJBINiFXQKcAqoyHcCwWcm6vYQCnIEfEv+fjGUFthfcUPQny75gHbNxM+ltNCd4EeNZUelLLgH+ZvRTwb7Sx6nRN4D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYzHeq6W; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso3954296eec.0
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777992860; x=1778597660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gO706adh8M0cH/PpFGt/u7nigSQIbFuK2LgSPVQ9R0=;
        b=qYzHeq6WNGys3BuA872VzgwybhvpPGYaROUhlO7m1IWe4dUrkdusnv8DT8rEvogWIZ
         94aiz5G20Xz4Gwq+ucWmuHoS+XKssjKvVi43YWnWkqBgojNzckLO0mg8XJ5YDxJbbFIW
         60T8IaxduT+dxGKeRxGOHC1EKHK+jyELnoM4Q/GLaYdrB+0RFBBGWsfjQ2Sv2DK0Lvwy
         XO71DB6aTjm6OFTC8qpSnG2ifXIuxmEpk2PtS6EoNuiJke0vEPs73mO9huu3wAFIe3Wa
         LguDHF5toSOK5Ry8kslPzLoghvw3vhhfqZCKSUz281Hwo2Dilxj7LzYYfFkNhD6WfGZc
         WJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992860; x=1778597660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8gO706adh8M0cH/PpFGt/u7nigSQIbFuK2LgSPVQ9R0=;
        b=WCfhCqgvRKpCs77HHfp7szR4lpYWB1rcp+ni6tRwDSeRAeVOVw3RIamH/U7dwLQ7vR
         ZyQZCPorSqv4DQmpL9ARGxT7TFG3yboA9qYjjaED1agetsAFOMwrBsgac/3eqHReg1aZ
         bTyjdoYn72hQz43ypCpiswB6vfiemzdeAev8CHGkAZ0Wp/oJ4km6iY0kAOJUcHIL0+L+
         qxJOTp1mTGeRDAJR7OpeudcYihFfIZXPERSi5arnRZbcqMVn9/kzYU+hkdg5aCfrymCB
         77BFfd3mt6W1Em8OyVW2YNthf3noi5PlNMDS38NvuHelzzfoxgAezQZLo+I8ta05w6UM
         kVUA==
X-Forwarded-Encrypted: i=1; AFNElJ8zAwXnR4YMtgorq0NDwI/JLD35poNbiJ30VjXhYBaBf0zrABvUIDiJwN8sddOJc8EVlwb8nciZFMO2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+MQ08YWYyr7Jj2r8WDpcN4zvKprdxPWtUc4OUV+bCJWFxVQea
	pitjIEMgIr9VCtemV5ygKViKfGqkvk8PaKS7K8qmXlBooINSqNGLPSja
X-Gm-Gg: AeBDieu0Ynq4GclzXwc0UAB9BlwGdUauFWtu/Ql2jUcmRX50k4OOoyMDXfiTdsQgfmg
	SJCPUBPnLEdXB68R9rVKE7igdgqyFpAtRbuVuAcDTZxTLvAPTzgM6dQ99gBSptwB1VUE/YTyCtS
	tlWvGqJiDvZvV86NiTy+aujwvAcjfPfbyUPbAKCmrvGVXhMF1ebeXlOyDTDGH6oJ/2vbxtqkIUO
	tqAibRqNbehhkexjm9+STTbimtWY7USlq0nJIuwAzDw9yskejhfsDobiYckpIrBXx7CqpBbCZJQ
	EeEuO3ZSHlIDmiEvyXna3aV+Tw13zXvX0uzJjQ78KWpMvziE45gaxUAL4tNUYZW+fBjROfdBCuZ
	CBv22VlT9mhlmALQuMUZ6NnWH2HU37ycoSOpUhiTHtLNOd/gemI45JBCuY/2zws4Cbj7UMaJkex
	CxGE5zFJswymu/nfZKRqZj3KTkHa+35j8=
X-Received: by 2002:a05:7300:bb08:b0:2de:e194:5fb1 with SMTP id 5a478bee46e88-2f3ce9f2e5dmr1644089eec.7.1777992859864;
        Tue, 05 May 2026 07:54:19 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f3bf67cf8dsm5793545eec.6.2026.05.05.07.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:54:19 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v4 4/5] leds: is31fl32xx: Add powerdown pin to exit hardware shutdown mode
Date: Tue,  5 May 2026 22:53:53 +0800
Message-ID: <20260505145354.1267095-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
References: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5F7154CFCE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8004-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown
mode for power saving, while all register contents are preserved
and registers are not reset.

Drive the pin logic low during probe() to exit hardware shutdown
mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..57d779e07a62 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
@@ -60,6 +61,7 @@ struct is31fl32xx_led_data {
 struct is31fl32xx_priv {
 	const struct is31fl32xx_chipdef *cdef;
 	struct i2c_client *client;
+	struct gpio_desc *powerdown_gpio;
 	unsigned int num_leds;
 	struct is31fl32xx_led_data leds[];
 };
@@ -421,6 +423,11 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
+	priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->powerdown_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
+				"Failed to get powerdown gpio\n");
+
 	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
 	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
 
-- 
2.53.0


