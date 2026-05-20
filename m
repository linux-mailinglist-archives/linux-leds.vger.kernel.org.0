Return-Path: <linux-leds+bounces-8224-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EED3JpC/DWr32wUAu9opvQ
	(envelope-from <linux-leds+bounces-8224-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:05:04 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E81AF58F47A
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E97CC306D3EB
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 13:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193663E277C;
	Wed, 20 May 2026 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOaL2KKT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0B23E5598
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285455; cv=none; b=Cy5zu8ACBP0C+nxuhnVF5e4WAEG46owC7keTp0IyUm0EyFdvnX34se+bzy1cAeLn7Kp/uMjbxgqW9goegVHxErjL8eVIcVPRgmD6zUTpMub2DTIwBRDBlCOQ5w1Di0fPScL7Q1bCKH/rikAhD9OdzQUI18j55GYly1i7OoSj030=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285455; c=relaxed/simple;
	bh=7XjhlBWu4XXe0BsTVCSVyXR2X3GDDIaeGLbqNNSVFeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KTkKeVV31zDRWHR6Ky9gHj4z+fpa+1xVgd1YaS7AgcOxOXMyBvXMs6gYNh2uYhWpzVwYWOwg35FdxMOJFDLCeEGpmpMRTjYptVa27d4yGLyQvjqwOyHTbWQgLCKmMeEt5plppb7mIgR1b0QeeHmrwf6XbagTnZ4IpSO3KQwnjZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOaL2KKT; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-367c26471f5so3072867a91.1
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779285453; x=1779890253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrfdgV6HPj/62pzariFhyLS7uZIzNERwa95bI27/Uww=;
        b=WOaL2KKTDIPe+NfVguycnQHkUnVjRQenF1jkZ2h5BbLrm8j0htL9NjUktjAtV6jKNH
         8Yl+JIKLLsXP0ZcQSsGhflJih6UVmE3+UlclECnAz5kQr0hgJj3y3R3zc5DuKfkYDY9z
         31TAxXRgmIANt+1G5MNuPbN3OeKnZCie86MZJI4tjkIFBTz0/nmqfP8Jszt5rk4uJEvj
         T0ZM0StYymgkNJjRwve2LIOL0GtqwatpKZA0QtAYdXPOwBD3rDJ0PXOHnFpp7YadBZR5
         X1kjgPiUMhqtbSNOPTc+m/5V2UGpCaenhqemxR0AO0mdi2XW1lWqO/+An4Cew/CRPfke
         nCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285453; x=1779890253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qrfdgV6HPj/62pzariFhyLS7uZIzNERwa95bI27/Uww=;
        b=bXpxDm33Ae1o57Vvw2in8hFzoUmtuGLUtTh2GNbC1zfpa0CaF4jDOJAfK3KU9o2pu7
         e7Una6Br7hMUojjHmCUevmQ+lmoPEORxoEpteyR4dMtD/yTDAFA26RWt7unk5gbWIbEF
         IsxR6K9oHz1RpKhG8NiHZP2y2PT61nSD56Mvp3E8lJgTFScGB9XqAWKwAuMDWoaqGyAe
         EcNIEE63S5cPqVSSWqrnHNqSdAry7sIfc0c1nc7CkMZtqDqT1x0C4NSdKFs82kyn8bkA
         gisOi+iAHk1Cvr2mxyhTeTRiWCG+fjlm3NG2wNb/wRiNtBoYqk5Cf9clg4hVb0UJnfnB
         RY6g==
X-Forwarded-Encrypted: i=1; AFNElJ+LWW9Inc79YD/F7gfCafiLxYmibZrhhV8bvjoPBOcaJ6ya00WOCZQtgkL5stj8d4ba6hcVwwZOVkBO@vger.kernel.org
X-Gm-Message-State: AOJu0YyS8p8c5rdyaD7H5qxi3XQOsdzxuDSOEQoPuP1gqNgkYFfSNVhQ
	fPUTBZGUF6kweRmXEx5fBbSpG8YdIsbIsCddz0WaLsmBNWC9d42IxTp6
X-Gm-Gg: Acq92OFtzQAMs3MlyKxZajjHUHwuA/fhn1FzaNBbUZsJqE6GsEj+VYip16eLJSq0Lj2
	59KQYzUBlKeaIsU0VCfcb6N7ap4lga6fWVCgJvf+GV/EksgPtepCglYUMJ5FQtabsmvDdDFsv7q
	hbXMTY9qatcPf2dDNZ81VhQPMfzO8DalMGw6pPZDbKHftseSZU+FmJepB2zLI5c4jJdbHe08lVu
	JMAaxxRJhgR4VqKvYUn+MApoLNOE9STXUZyAJTyLSNi4ARDD1bsFCe0nvZ2L38R+1fmvrutKfxV
	/OaXRDDIdc5qoRBAsJ9q1YI/UrB9ZXPpkbQpsIiztoFJdnpgxxSy0cFCs/njoDKwT57qWFZJtYU
	EO5fDzoea61Q645Tl7hweZdTPMarw0+1FZz07Q2vLcnLfJ18OO5sgqlmnC7ipEpNqfuFg50Jj0c
	EtdFLfc9rMVLXbSxx4HZvMHPZDZBZBLqOteb1F79c=
X-Received: by 2002:a17:90b:58c4:b0:367:b9ed:665f with SMTP id 98e67ed59e1d1-36951a6cdf4mr22271562a91.13.1779285453029;
        Wed, 20 May 2026 06:57:33 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369572e1007sm7480867a91.6.2026.05.20.06.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:57:32 -0700 (PDT)
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
Subject: [PATCH v7 4/6] leds: is31fl32xx: Add powerdown pin for hardware shutdown mode
Date: Wed, 20 May 2026 21:56:57 +0800
Message-ID: <20260520135659.1430008-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
References: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8224-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E81AF58F47A
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
 drivers/leds/leds-is31fl32xx.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..5b9ed5a1818f 100644
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
+	 * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the device tree).
+	 */
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
-- 
2.54.0


