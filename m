Return-Path: <linux-leds+bounces-7906-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8L7wHpQo8mm/oQEAu9opvQ
	(envelope-from <linux-leds+bounces-7906-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 17:49:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 307D349746A
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 17:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9683D3020C5B
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 15:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23384387364;
	Wed, 29 Apr 2026 15:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcRkYRbk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49213876CA
	for <linux-leds@vger.kernel.org>; Wed, 29 Apr 2026 15:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477517; cv=none; b=eKL76yy68XlFHkF7Ff6bIeAqMRyXCSSqPlicwefvGWtkPi45sN0+bEvrNvQFas3L25qD/NXsCfskuMR8L+02LtVipVmC/gsPvhBlQX/AepQfme93puvybQ6W5ACCfucn6sjYH0FzCKrS8wm8vmY77o6WHg5YRZ+81EhK4Yrq1DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477517; c=relaxed/simple;
	bh=l8kRD5ODG3u9dxSb5dB9FFcWoeVxlb9OPaO2ROEPky0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=On5a7iYsiBRInXgFcF5NVNKgZOsz6Devb6YzJD3spF+WlK1kC1OGW8BH7uYCjQSbzRccJxsPoOshHVZ/jFKD/7EQRXug6P1YWFnTbfzHY10fTzhO5RxmQDJqp7zQ9UWwWsETb+Jyy/j/ZJAAMi44nW/H9Kp7aGOnyQwu1NACPQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcRkYRbk; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c726f46baso16646309c88.1
        for <linux-leds@vger.kernel.org>; Wed, 29 Apr 2026 08:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777477515; x=1778082315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jduzi5OLB2O31wf93QrKoK394/ZZvQgqWTgaFnSSbog=;
        b=GcRkYRbkt4lTurrGXbFWrfVd/NrJenUtdyYnF3F/6OfPTajC+QF/c3A3TIrNM+/pJn
         /5HSkjqsPJEt8tvvICJy3OcOb31XVVwdVEYYASp3FTHZaZkTDz4PjoTIp/6G2lpalqz5
         KUyKTb1KvFuZRpEvv81lpLG1A6+CVtzrRHVWtmXILF+Elas3pSPJl22fwAO9NDIg5bTx
         geBl5wrtx98G0WPbVIIHUeL2HzIOwPxTqCBP5n3dAqsujLgrxdc+/KmrKm5JuxR0T9Fj
         cOPEIKuktV4Mwz/LQ7QW9Ks9/8q4GHw2epChCu1yVe/wOKOxcEH9ESGplPgmZofeCa93
         3hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477515; x=1778082315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jduzi5OLB2O31wf93QrKoK394/ZZvQgqWTgaFnSSbog=;
        b=OcYQgta77F6D93IKyOM1DpQ3aRPD3/D+H3cNQ1G1JycN+rc1OA+KlWtpDGVZK8qoBU
         YRg0NVxpL/canfVrPjnne0yxeJKTSmpYUqNM4+Iy6OJ/+x+GG0ERp+P9jeQqi5tqjcGs
         4aSwW4e1CmEM92xtAILzvH7fZTxrqVSFuOT4mfwQlpUI0/tcnmFgGULa5hF90IJrQcVY
         b5gei+M4OCFmGumIRDqFJbEigwlLwfOF1uD3qpMGfEIpBgcEP2Q/V8egh+kevt+YjYJ+
         ni8pa15TbkyaegT5bJuvO8/72NnQg/z4P7EZpunvTcebo5p3NPGjh6IzuLTTaCdu/vWh
         TTww==
X-Forwarded-Encrypted: i=1; AFNElJ86bu/Q97OuC8b2rpIWvMkBishNRfQHFz8HkTLr4G/uO7rNrWfhtPYSy+kv7hjnVRD+V4bXl5v2dIAX@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJ8xBTQHISupQTWkghoT0RpMf0KAI5QfKUNYOygSJIvB4aPJE
	8NWu3HlF/pMQTpsxb8Zse8UXWgnRNDh8q16UzYMMdykiI6w1dMRo1LZ7
X-Gm-Gg: AeBDievQhEte27mGXq83oj2YzEo8lpItKY9z848ADcHY55gjnJEqFyi0N4qEPOtWNGn
	LwHlPAnG+2OFP/ZzQ6MdrLDt/fTG/8w6pAFhdrbDJWQRDvyLdvMBWAaFqdkLGNMrACfrx9HLIM8
	p14NK8MSmC0xYlNZ6VNArFoZu0MKvGKT4I2kphdEsEMAJviGY3Shwutyyil3ueGfxrNSht+KMa0
	opUqAbY0bvi9o0bZ+sNpz7a80WWpVpUtzTjjOcIVExYaIGOSN9seXgfQrQG4D6Kl39z9zlmegcE
	nlINaW7uYXW5AAyzTCn2lUQPXjSjyOn9TxWXMReJEpXSs4Fp9Z0wl1Mld/eCBWfpbmiQpQb5Osb
	/ZS6VPLXWumm8/zDrjuOefl166TrXzv49EOTpHBhye8hiw997+sfaheETrq5eRzEKNBEvqynC+/
	ZUjAYc+lDVzY7vCz6VL8WWJn25VA6ajw/hqnY7TMuC0g==
X-Received: by 2002:a05:7022:e18:b0:119:e56c:18ae with SMTP id a92af1059eb24-12ddd98841fmr3417106c88.22.1777477514813;
        Wed, 29 Apr 2026 08:45:14 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de320ecf9sm3610166c88.2.2026.04.29.08.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:45:14 -0700 (PDT)
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
Subject: [PATCH v3 5/5] leds: is31f132xx: Fix missing brightness_steps for is31f13236
Date: Wed, 29 Apr 2026 23:44:49 +0800
Message-ID: <20260429154449.730880-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429154449.730880-1-jerrysteve1101@gmail.com>
References: <20260429154449.730880-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 307D349746A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7906-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Add missing brightness_steps for is31fl3236 to fix brightness control.

Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 801caf2b2e71..353451da72ad 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -487,6 +487,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
-- 
2.53.0


