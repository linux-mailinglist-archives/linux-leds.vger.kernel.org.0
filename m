Return-Path: <linux-leds+bounces-7864-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAU5ACoB8GnYNAEAu9opvQ
	(envelope-from <linux-leds+bounces-7864-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:36:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA93947C31B
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C38E73023066
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 00:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1739279907;
	Tue, 28 Apr 2026 00:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NanMr6mW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EF7272E56
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 00:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777336505; cv=none; b=gozwgGNDNI1NNkL9CEpl55wBn5nHbotgJHIofz79+CMy1YKy5WA90d9yvHP0ZC5654De3EppQui9q44NH7XfFhCFXvdP9fBbuM/rZ68zU1OASUlATOXMSR3f0v5LxOEWNfkUqU1prYFs+RWSI1GEydgVQFpqdMWalrsDltCWF8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777336505; c=relaxed/simple;
	bh=Wj2asEhQquK+fSwcH/j3WIHVOoV8HWt1sMZeo3rKa6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pk2TnVGDTbyw8ua7CJpfmd+eMWzOyXnBTFNRxmJIUuzlljNdAi0y/N5LPmTkCKTwkS1xq53Eu4eaXIr67b4wfek74cvBdLQnsfRpk2qagPTXy/y5PRTOnrjygg7b8pCy5YkroXBzirhySIqMZgSfLUUHcvzHPEB5MvcyBigs/CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NanMr6mW; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c19d23b19so14078955c88.0
        for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 17:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777336504; x=1777941304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ly1kTdTsdBgzdp71diysp7YHSBV9sCg3eeeHrpVV4BM=;
        b=NanMr6mWfnGmC5Vq7FW/HSVGG6u4jWjX1wogSJRy046DRqMc8CsGHkEXEAYOH3jpVk
         s9O8jfNNsO69YEW1aX64j/7qSHkSgsjOEyLCKwAnHutW6ukvK8cGMJW1oQuH3gAvtnAm
         dwnajfznIhFU7JRU3GGzuQKyieEqPsQvYML4dSWILznDoUhT4BbhY/VasZJvXZVSurTf
         Givrvqai/JWEjwv2kawSDGu5OGofFohwNaEb3ZsTZROJ3ulTdIkF+12+yfVAMEtpHh3y
         JGbX0f2p+27486F0Bt/xhFXCiaTk+Decmg7/sXg91wDpl1XCL6JyfLt1F83zWnXpGv8T
         20eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777336504; x=1777941304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ly1kTdTsdBgzdp71diysp7YHSBV9sCg3eeeHrpVV4BM=;
        b=odI6soGQjqEm/qqft8y2N2RvEpfdG5fIJ4Z8rXIWaUAAWj6bNIZZLiREZW0w9xEEsQ
         mX9ri7pXqb+SgKWbbNyz6T3O/P6dBCHC97j442DCrHnL61nch/gPtCXvw2YbQwmCPJfj
         yFHzmW9aHok57NkFiHgcDNQGB3388ILN1s5iutJpJFBiHbIZB16JQN4JbA1U4RjpBVQk
         RXHQblVm9Jm2iybmTQP++nbN7DGRrTa1gkGWw+U9vVpRPCOaSS964YTTvLI1u77VocE2
         RthI5miXD03MA9HP2dCQbOVtAyeKeP7YTY/QTyukz8myZKvrY/6u6g1/90t3/iM3lh36
         Kt8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9WPut9u7EZqvZyJH1Ej90cUPHXavihWBBlK+1jr7xQgbsAfXoynMRbpHlq2wyqUnfquEccYAENtklx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5J1U06lTsLp7cvvXYGIsIDRnx5AUWt8CuPph4NegQ6nTeXvGu
	F+OjERdvAQrLq0pEWcSnLbVXGWpVWI8sFYtQPselS8hNNJMMzys8hZyf
X-Gm-Gg: AeBDieveM8IISFljkVdPAOI3c1Br5MPIKRqXPi/aRlpgC8XFt0yRlCBHjFx5ylo1Axd
	V/ReaRW+kwpblGBM6+cte9FWiUg95NCTvKefItx60NOFyTTSyzCdY6D7NMBrOLSPJWWmzfbCcJA
	SqX3M8bJDFjUtt+q8FB9D8Z9MVygv6/QbovLA57WLiXwweWNJfaaFnkAGuLcv0FtmOUoHBx7ooc
	JRFqsGNE10mhpBGGiAaqYuog4pysaTVtXJWFTz8WSdWz5PCbQANovLg01dr5mEc9uKQWw4bi8rE
	RdhcfO9xhkXr15VwX57pfI+LjcNuLfF3Is4RvDd7w8Tm3Dk8/aetBGKzu23J4mxsNIbwaPdgjU7
	WHOcUtwEYkqVO2XpPHVG4oyMP3PuVreoGnbPao/KJVkjp+JYLKhruHqboz5d5casCMZdSe9DtGM
	VbClFhawuBeATdkIcSY7bLxM4qUndbtHY=
X-Received: by 2002:a05:7022:b8d:b0:12d:de3e:be87 with SMTP id a92af1059eb24-12dde3ebf44mr75138c88.35.1777336503539;
        Mon, 27 Apr 2026 17:35:03 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm957144c88.2.2026.04.27.17.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:35:03 -0700 (PDT)
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
Subject: [PATCH v1 RESEND 4/5] leds: is31fl32xx: Add shutdown pin to exit hardware shutdown mode
Date: Tue, 28 Apr 2026 08:34:11 +0800
Message-ID: <20260428003412.322032-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428003412.322032-1-jerrysteve1101@gmail.com>
References: <20260428003412.322032-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AA93947C31B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7864-lists,linux-leds=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown mode
for power saving, while all register contents are preserved
and registers are not reset.

Drive the pin logic low during probe() to exit hardware
shutdown mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..d2be996dd4ea 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -60,6 +60,7 @@ struct is31fl32xx_led_data {
 struct is31fl32xx_priv {
 	const struct is31fl32xx_chipdef *cdef;
 	struct i2c_client *client;
+	struct gpio_desc *shutdown_gpio;
 	unsigned int num_leds;
 	struct is31fl32xx_led_data leds[];
 };
@@ -421,6 +422,11 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
+	priv->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->shutdown_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->shutdown_gpio),
+				"Failed to get shutdown gpio\n");
+
 	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
 	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
 
-- 
2.53.0


