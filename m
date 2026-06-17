Return-Path: <linux-leds+bounces-8619-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id siRjIC4zMmqcwgUAu9opvQ
	(envelope-from <linux-leds+bounces-8619-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 07:39:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EA1696A1B
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 07:39:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PMS4h1Lt;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8619-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8619-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E933A300AD40
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 05:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3EB738F64E;
	Wed, 17 Jun 2026 05:39:49 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B090399357
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 05:39:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781674789; cv=none; b=mlARa0xTq+v4n9D8rdRmoM6pvTpZAWcHtM/3+m/8uCfTVJITQuciA8NYbIZ03Kh1pkYateRaeZs9l3N/55WhSKDtY02jjfadycCz7//Qh4QWHJY45mUTJ3cagCrRmzVWQbR9R96YQ1qNmjJuszIXldWkMzJNECt58kd+BtJA6aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781674789; c=relaxed/simple;
	bh=UHZCVozcM2EcJKws2E/C7a5uOhbIOrIOnfe4myFgS98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l7lyPohgjH2zNoLi6gJl71EV1Bc9CRF4r7nAwlv8WVCDXhKCHH208C1isQWbOsbXRrqGORoFkcCbOuvWTzXz4AtvmVhbNHHv2InGOBV1pUnMy+IxxCCh8J5xZ3FzD6hR/QFgBbYOUkIu4QXuVvTDUzKe7YqgM0f0ORrS9Ifn0q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMS4h1Lt; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c168baac83so24022905ad.2
        for <linux-leds@vger.kernel.org>; Tue, 16 Jun 2026 22:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781674783; x=1782279583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rF2bDRyjtCAOETKbmKM190p1BI25Y2JTP/DKDl8RF0=;
        b=PMS4h1Lt0AnYpPLDW0/TLmIOuvZL6kjxrgU28kGOiSM1Wz7VPQII2efxhKfjpXZ9Tg
         Mv0mzYuSHN0nvQRQbbM344KFYCwdAqQ68PB9nBBzlYkqfcP9XK+1WWzI3WKHZIFBpyOJ
         iTJ8fYPa/tNuCuozIYaUyuNcizqmKQUNeaDnnvql8Qk2+NTozTkhaizP2g7ZCVgrf06i
         GHfJaUaetca8ta3zq5VRzGhEONbq1qBApcZK3RtM1LqtYDpOYu3mKRmsKt9etUpDdBBg
         BN1jKc7lc+rdWXhwArKzXD6J4dsvmaOQAp2qrKe+TvMpMKYFpOSUA6LJ4ipU3UZLpkfy
         Z1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781674783; x=1782279583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rF2bDRyjtCAOETKbmKM190p1BI25Y2JTP/DKDl8RF0=;
        b=rxvj8fH0esQRv5Eh0BiiU6ef+bNHvl7I2xKHcEzWc1amfrCVCnUWQk9Rm3pLUIF7PF
         Op+PrzpMLoNkYLiOb36vvjavcXi+PJROCrJQ5he6vk+lGgel7oIevFOiCaK2bmxJ3w+k
         n3473BUl4o1hSfSdgB+nBkdVFX9xTQC41mTtFsjwwuhc+KsY+JazbJD3S7zAlXmVeBR1
         I8F306+EE2+gGO5KXvIw9kS36fP/pfGSP3ed4FLVw+ArsjiueIEnaDVDEwlNqhPSu3qF
         Zju+gD6B47CFPwilZpq0riua+xYjpI672Owch5GiR/lks9eGyvoKe6bHWX1juPpAGOuB
         yWcQ==
X-Gm-Message-State: AOJu0YxX0FUy1y4p9jBLeclqBLJeJWlwAsC1/OVB6UmZFQArzavmBxEh
	YtrB1sV4eXotGVxq2uv/3TUd1nDiduxUKnuAPPNUJ8enSoIPLicIxd0xUhx7Pw==
X-Gm-Gg: AfdE7cnQ6mgNZgd91AQOFANvOU/Lf/9TSYJcu54RuM67q1rzHb3sbxCTn2eMDRsfWLB
	gYaT1/QlcSEVcCPab9lLzma0YUolYUJOPC2ET+H4WFZke+rp6mwMZyCwzVPnP7iXI/kta5Nw1TP
	VU9MKrjX04NESit5efaoWmiZAxG9oB8JdI9BXG5s6QQNY3jifFge/tHRGUDO4jlYfF47TTwXR97
	T9WE0/qv4DyfGx/nH2Mwcqe3XCFVOlQHY/IZ/gabE2LstIWAhfTN2Y0JD/zhQCp++31ATt/RrLY
	hVNjNpwzFmIZ3T693Hfjg7nAZKO4OJfc950Mknmh9LesLD7C9e4pv7LgkneMIGojcxJcIXbq5wN
	G0HRtmerCoPeDj3Po1afpzrxe9/G0yy5XDesFtKtn1YJjpW3uksG/RWsHlSPx24slLox4qmzj97
	pcBfGJCTMlJC66biTGQdxI13+LENKHo0hwAE5BRcJ6dAZDdDBUxs00ICfW0XtZ6g8051kX7Q==
X-Received: by 2002:a17:903:46c6:b0:2c0:fa4e:91f6 with SMTP id d9443c01a7336-2c6bc0bdcbdmr23674865ad.13.1781674783146;
        Tue, 16 Jun 2026 22:39:43 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a758a3c6sm30490435ad.52.2026.06.16.22.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 22:39:42 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: riku.voipio@iki.fi,
	lee@kernel.org,
	pavel@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH] leds: pca9532: Fix inverted GPIO output polarity
Date: Wed, 17 Jun 2026 13:39:34 +0800
Message-ID: <20260617053934.2122685-1-chou.cosmo@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,quantatw.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8619-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:riku.voipio@iki.fi,m:lee@kernel.org,m:pavel@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:cosmo.chou@quantatw.com,m:chou.cosmo@gmail.com,m:choucosmo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[choucosmo@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3EA1696A1B

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

Fixes: <3c1ab50d0a31b27bb4e55168f4901dd91e6e5ea4> ("drivers/leds/leds-pca9532.c: add gpio capability")
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 drivers/leds/leds-pca9532.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 0344189bb991..80bf94e699d4 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -325,9 +325,9 @@ static int pca9532_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 	struct pca9532_led *led = &data->leds[offset];
 
 	if (val)
-		led->state = PCA9532_ON;
-	else
 		led->state = PCA9532_OFF;
+	else
+		led->state = PCA9532_ON;
 
 	pca9532_setled(led);
 
@@ -347,7 +347,7 @@ static int pca9532_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 static int pca9532_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
 	/* To use as input ensure pin is not driven */
-	pca9532_gpio_set_value(gc, offset, 0);
+	pca9532_gpio_set_value(gc, offset, 1);
 
 	return 0;
 }
-- 
2.43.0


