Return-Path: <linux-leds+bounces-8899-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VFbQJ6ETR2oQTAAAu9opvQ
	(envelope-from <linux-leds+bounces-8899-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 03:42:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E1D6FDC29
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 03:42:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Raei81j4;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8899-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8899-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3862630387B6
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 01:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3949623ABB9;
	Fri,  3 Jul 2026 01:42:13 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0743239E80
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 01:42:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783042933; cv=none; b=qldG88eYoqY9zLRqp1Mm4E+pCezn4Z49pXXEmlfqnE2FIPJRD+2/QoFFkO+u0tVXyTp6A58ioLt5qjqK6nX8gW+7qQ5Kq21braV1ucr3MEAgtoJ/GBww2xkRSEXw4HZJMvDZkDblzPIAZaHj9YgBc4J1IA6idWUsjAaglUlv58k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783042933; c=relaxed/simple;
	bh=5v7r4afiWttDE5QEdQ0mFJ//RayoGtlyppLyHK96n1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AAGfVGWidSDfatQUNrUtg5t+KkJP/ZTlwOTf3cqqxvnVdnnRgGg5aZg/aEwPKtIB1w9hwsjf8URZiHoapSxTnECxx38IYYEKXsYbqtcAPhfeMZllzuszha6j8VMYLQTiCkvvjFEzYRhIYAhQxQy9rA80UYYVg03x5Wz2watNLgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Raei81j4; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso189965ad.3
        for <linux-leds@vger.kernel.org>; Thu, 02 Jul 2026 18:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783042930; x=1783647730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bdl/nI02rLhhr4XYsH9/1vppwU3vIyQAjQiCX5x8z48=;
        b=Raei81j4JEYlZ7xxMCI+CzbQ7lpzdQP4QGk+lYiNC+AExmxivRaN3Jv4HJXgi8okBy
         wINlPdL/5bX/XUsiREs6wbnLrGlLvjPKpg48Zf9gV1uT0zbbREXj1yz1TRKi1576s86Q
         Of4EwqLs+F7aProUsUQHCteP0VrOrWvaxiEHHzMXbuvcwWhoMB5NWdOT6Ut0tKxU3Mtg
         z3HYSzXFV3ILFa/8Y28eECq3u5jE7f7rmj+VWmCY8AFCoB1Fd2Xe9S+gsjG1JX7Bcgab
         GSYi+eszbExNGHDg5CVlQxt2QzpwDpXZxtQk2PDHCso0TwkIin/JgEqMTGVY1YJnpkKg
         Mmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783042930; x=1783647730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bdl/nI02rLhhr4XYsH9/1vppwU3vIyQAjQiCX5x8z48=;
        b=L7SuXDR/c7lM/bSxNUolPXPlAFmKdaQ+nQR2nv8GfvSSVvFCg+RzS6lLulu1+ggeHz
         BqmeRvA3nXCPQFI9KKahg4K6dc9cbxVzYPIOKI06M1GMbHMGedKJkRp7Qrg1U0W29V5S
         lJf4gBt+1NNROQsea+YDM4E47pd5tYTNJ3qHCNdMhrruWs7tk1a0HmXy+m6c4z0sa4pm
         vujNnOQEb71KqK9zFIJyGfRREDZv+08iPUS6kJqNPs/ijXBFdH8aTJh0vTBabTrgM+Pw
         TvOVI383hrzew96L90QIpcGeBnlWMVMFQlY9F5ljfYGBQGv+8YXqzQqHaKShvVcHOyvf
         wYWg==
X-Forwarded-Encrypted: i=1; AHgh+Rrt0Fh2zogEZjDabzRgoDC8i7P+cPUszJza1b+/thfigICAqHePG25h/43fphSvIXMdIYyJzVbFwMQ6@vger.kernel.org
X-Gm-Message-State: AOJu0YxGSDEGALbB9x63NF2SrvrInv1VY9MNidUIFNmYoOjhLSnAuFyo
	GPPatnP4JkIz+mVfca9oaKiQh3f5Pyr+TjY9vm3dhQe1PlnN/i4ONiGE
X-Gm-Gg: AfdE7cnELWZfAWaZgL59r9vh6ZCWan0imtqsswT0AsRu1nrLgkjd+c+18LtGaaS2Mkc
	K1dUCr/ktwQf+bAU4waUi+Q1veOFdSwjg+1Ig+NjZeDJq84fBecGzOJQse7bboJT2VTZzrda+pB
	4Sw+Hf2l1aAsqZp0bKwq9HDwUdaY9pzWSz6dq6ChjsWFPhp/Qz3ukDejNSzExMAJmkNm3X7GRdZ
	MjKx5zycNGPGifTh5TdSKhE41Ipqo9XcZwPDni4dEnJl7RfTaQBzrEesJEiFqVlmzDVb2ky9mkc
	MFNKZ5YKnbGeUWCfxM+XXMXz1lcZ1xHU7lYNXe2/4CVcedh16ap5EVeu7Y4XdSy58d8eGKFAIgy
	L2NmH6lVGY3CU+VxD+CKEeHzzd0n7AwPOLc8DUhLY/7yDw3+fg94g9+X5ygbi9LUbFho/ZeSVMp
	1T53Ww4uoU/JvZQz8yr8Yrb35mGW4Jbnk/Y+kUVh4zHHKIpYZflmLMhObpkME=
X-Received: by 2002:a17:902:ecc6:b0:2ca:ca48:c36a with SMTP id d9443c01a7336-2caca48d3ebmr24445935ad.18.1783042929874;
        Thu, 02 Jul 2026 18:42:09 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7140a13sm1250695ad.30.2026.07.02.18.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 18:42:09 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	riku.voipio@iki.fi
Cc: linusw@kernel.org,
	brgl@kernel.org,
	linux-leds@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v2] leds: pca9532: Fix inverted GPIO output polarity
Date: Fri,  3 Jul 2026 09:42:01 +0800
Message-ID: <20260703014201.69829-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,quantatw.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8899-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:riku.voipio@iki.fi,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-leds@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cosmo.chou@quantatw.com,m:chou.cosmo@gmail.com,m:choucosmo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[choucosmo@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[choucosmo@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26E1D6FDC29

The pca9532_gpio_set_value() function incorrectly mapped the requested
value to PCA9532_ON and PCA9532_OFF, inverting the GPIO output polarity.
A requested logical high (val=1) incorrectly enabled the LED output
driver, which on this open-drain device pulls the pin low, while a
requested logical low (val=0) released the pin.

Correct the mapping so that val=1 yields PCA9532_OFF (pin released /
high-impedance) and val=0 yields PCA9532_ON (pin driven low).

pca9532_gpio_direction_input() is also updated to pass val=1 to
pca9532_gpio_set_value() to align with the corrected polarity mapping,
ensuring the pin remains not driven when configured as an input.

Fixes: 3c1ab50d0a31 ("drivers/leds/leds-pca9532.c: add gpio capability")
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
Changes in v2:
- Correct the format of "Fixes:" tag.

 drivers/leds/leds-pca9532.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index f3bf59495b68..2d37e00e459d 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -327,9 +327,9 @@ static int pca9532_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 	struct pca9532_led *led = &data->leds[offset];
 
 	if (val)
-		led->state = PCA9532_ON;
-	else
 		led->state = PCA9532_OFF;
+	else
+		led->state = PCA9532_ON;
 
 	pca9532_setled(led);
 
@@ -349,7 +349,7 @@ static int pca9532_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 static int pca9532_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
 	/* To use as input ensure pin is not driven */
-	pca9532_gpio_set_value(gc, offset, 0);
+	pca9532_gpio_set_value(gc, offset, 1);
 
 	return 0;
 }
-- 
2.43.0


