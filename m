Return-Path: <linux-leds+bounces-8217-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OISDLr64DWpT2wUAu9opvQ
	(envelope-from <linux-leds+bounces-8217-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:35:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9D158EDBB
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1E7030316F8
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 13:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB7D3939D3;
	Wed, 20 May 2026 13:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkJ3nSos"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515AA2D3A7C
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284057; cv=none; b=fTnknz7Ffb0fIssXMdo28tzJ33OdpxxV0E1asEG8Lp6wUGinRXI6AbtyoGu9yr+k5mIn5/++QNFEOQuM0V3MCQRErtFMg31mZZUSv38/4FMmRVTz6ezFZ2pJrLFJcaLLC431QaUcBxRnjtXTrOrgdWd0myBm9ArXBVs1oBU5IvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284057; c=relaxed/simple;
	bh=Ad8yPDRxvnBjx/qpAX9cAhi7tpYDFaAo7GPdeLtpqzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlwhC/uJTO7T5LHra6JXg3k/tnQRUWLfP+klJixfbIT8TylRxOBrGPHBljXI4q8I4tVkrSEU5h81AYe9sb0fWNrSAlwBA/kbcJ49FH239bllYhXIF2OLR6PvFFVuA7+UYR9AoxMPmKwI+EAQrMxc5uP67MeCXToWVzRdSIOaMpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkJ3nSos; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6969c864c89so2708110eaf.2
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 06:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284055; x=1779888855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnWJZvYMA6qN0Zy8jazbsh97hf1g91RlijsDyV35hD8=;
        b=TkJ3nSosm6Kv4W+E595AYiW3Swq8Shawm6ZtaWLx2fbcCLEEeAgEjJ37QY+0agXVm8
         6BtPn50XvIJN6q7eFyF6J4lTUecUMiGYt2lQ2dhbat1p8S7Ifb02mplQjwwQ9ImICKUS
         Wi1lpljRkFWcolCOcSZ5ohUO0LKe2LEem+zgLp2hX0Z+NjMwyQOIxSBbKfazqGf8xXxS
         9/D4GYih3O7jPj1BzjdPxduCI/XUxp/ubOE7RBLUL2asjvEZYOlb/JK+CycjhfHOhNRT
         x9zrlNRAqYZk+PvcbQV1JqOP1HbxBJJ71VUCdmP2KiX8+3RsC6YGhdlZXmCiupbjdMbC
         FbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284055; x=1779888855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xnWJZvYMA6qN0Zy8jazbsh97hf1g91RlijsDyV35hD8=;
        b=MFNaAVsUM8b0kGIZZ0UObO4/EEiFKSUSGCCroQkk+9Y+EtSkse7oXZdP8aqR+4xuUQ
         bZKuwD3/JULatkV7mnG8Mo8XVeGnXbhwCmzTatdX4c6XSK/QQDE2oyL87rsfC3U3Pl2g
         hpta0L2KoLVaF3dp1eUKfkQPmP2cJ0kOTzKbSEL8e5xo0bvv8NenY1Kj5mVg3BTT8Hsb
         dll6EXeYJwTC5Ih/SFB5BTgZ2VGRcfjcEwqVee9MxrlaM8eRJS0S0KJRAn/cC7TbA3Bl
         f9PUTxtkTj2jVNKrioCSLPYJNvSk3meuOey8Wq9Yh2WG6rdnx/snIVH/5lQ6vdOnV/6v
         d7ww==
X-Forwarded-Encrypted: i=1; AFNElJ/HxPnC8z2C1/s2z74yyHtsoFiI4KQeyd8GzdrwJK/5kzxEdCl7uNswiiEbSfmlaW8MDqTQhcaakGLf@vger.kernel.org
X-Gm-Message-State: AOJu0YyeaKaMYGk5h7XPqQ60gAI/r6ycbGAgw75l7U08K9Gunk7EMdct
	h9Hf7e6KuxyX5LFTVPatQF5f01es26ZlrTGBHweR0S5TUrF09F49XwvX
X-Gm-Gg: Acq92OHnkeL+Xt5TsF/PV4uJG10hdoP70QpJRywF0UA5YuHhyfvTshMMkwFLKX4KG/F
	p6+i8VMxxHj09Ez8zBGc3+OIpkws5ytV0YabYucDl6HH07AwgxHqaCKxdrdeaHLnHPrHrY50Eda
	KWOrzqztAQrCPS3xli3ZMlgl1Zvx0GxlYjlYEEKQx/3GzYL+IqBr+Wcw6Zn1I6XsDxVt1SBYDbp
	tfy/+C400u+HHWGUDDHB5hTcTw+EjSEr00mhZUjSdZbB78cJvxA3nOQP6Ck5+mlMcTM9/yDpd8p
	2NyBg8EQ5x6zZwRgVPN7XFAxKj7M/mPqa8m1txqZ1r1ELhLZuZsINr52tiM9e9Vk5E5kdByWjxc
	Lv/kEEaQ6vYUroKyPmPLj9NRzRkUrMWMyQYkJv5eb4jML2pSb0m9li0oNnH1wrseNs+0nOOROJ9
	zQY9lHQvIMFYlzCLpS/f8/W+8PRZYkJNjIzCJn468=
X-Received: by 2002:a05:6820:f005:b0:694:9fda:6366 with SMTP id 006d021491bc7-69c9429333emr13992078eaf.6.1779284055178;
        Wed, 20 May 2026 06:34:15 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a956fa075sm10253951fac.10.2026.05.20.06.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:34:14 -0700 (PDT)
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
Subject: [PATCH v6 4/6] leds: is31fl32xx: Add powerdown pin for hardware shutdown mode
Date: Wed, 20 May 2026 21:33:41 +0800
Message-ID: <20260520133343.1423946-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
References: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8217-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,allworx.com:email]
X-Rspamd-Queue-Id: 5B9D158EDBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown
mode for power saving, while all register contents are preserved
and registers are not reset.

Deassert/assert the pin accordingly during probe() and remove()
to manage hardware shutdown mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..b5207ad6ae96 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
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
@@ -421,6 +423,14 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
+	/* Driving this GPIO line low takes the chip out of shutdown,
+ 	 * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the device tree).
+ 	 */
+	priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->powerdown_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
+				"Failed to get powerdown gpio\n");
+
 	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
 	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
 
@@ -609,6 +619,9 @@ static void is31fl32xx_remove(struct i2c_client *client)
 	if (ret)
 		dev_err(&client->dev, "Failed to reset registers on removal (%pe)\n",
 			ERR_PTR(ret));
+
+	if (priv->powerdown_gpio)
+		gpiod_set_value(priv->powerdown_gpio, 1);
 }
 
 /*
@@ -643,4 +656,4 @@ module_i2c_driver(is31fl32xx_driver);
 
 MODULE_AUTHOR("David Rivshin <drivshin@allworx.com>");
 MODULE_DESCRIPTION("ISSI IS31FL32xx LED driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL v2");
\ No newline at end of file
-- 
2.54.0


