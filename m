Return-Path: <linux-leds+bounces-8520-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q3ZcKj+qI2qlwgEAu9opvQ
	(envelope-from <linux-leds+bounces-8520-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 07:03:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6617C64C796
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 07:03:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="A/unh+1k";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8520-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8520-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFE1930B6631
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2026 04:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E30530E85D;
	Sat,  6 Jun 2026 04:58:38 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0382F8EB2
	for <linux-leds@vger.kernel.org>; Sat,  6 Jun 2026 04:58:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721918; cv=none; b=P990ugAz7nqrESyo6e5zO5AWLx5QIbanbYsr1zHPPZZgfmBOQ38dccTdWelQBEb3v6b6K1IrAYMpTeXqvW65OKlIPzkzEBOsaNQFB3p3abtOx8oxGHOxpHmodCw9L93BPwO4pdsJ9xPR6nyZwEzi49Rdtw31wHPKiEybexIyjU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721918; c=relaxed/simple;
	bh=Uj/we1VRlh8Apf/xbTm9Cclx4UJKJna7Lcylt5N9akk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SVSIbMdSwLKxmY+rRyQFBIvqxJqg3fxrSu2cze63Up4D7e+9zY10Zp3gBQ7uFA6oXTyl+4gJH25ajNfwDgFLYqyIn/9qtvyqTNUmr9LZmyEK6QYPKdlY1MmYQCT8oBh798xpB677GqFKQyLbReN+C26E3AclZ3viaORzSG/GUpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/unh+1k; arc=none smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68d23396ed3so4590171a12.1
        for <linux-leds@vger.kernel.org>; Fri, 05 Jun 2026 21:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721915; x=1781326715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRUfH60NeaMpCaCx84KeDTGgGO9ytSJVg0ZaUrTfvB4=;
        b=A/unh+1kjipGI8XGzFvTj3U7czU7f66fZb60gWItRppp86TQsnJc+ZhnwwWkEztngk
         ZXZdFKYNLTDYIFhMAFv4yK80g28YjCSYosSXktQqcM1Xbvw2X13FKQbo8kgMlLNOZBkQ
         sfBU9e/miezAaRfQ2dXRIlGPPCB/hlsxZurDJx0phhXKefFiALFQFJ8cWwCLPlV7Jx0l
         pVbxBKCYwhIvUQ80WgzxZ78SY60O6A9sHgIXpvtbK+FXiyaRiJc5K41Oqxhttp6Lajhl
         urzHYMnon6ajDNumWML8ydBCUy1XktRrDxurAkQ1FYfPQtIWEa9x71i1AhNSPFdoEIKK
         SHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721915; x=1781326715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gRUfH60NeaMpCaCx84KeDTGgGO9ytSJVg0ZaUrTfvB4=;
        b=MGYa/dSRT8rCHhPTuixJFBym1YBDhXnVjAv/68cLsC+1FDhFpck4nPiaWlYje0CHSE
         bwq+NbHHrCFd2whLJy2vx735Uz51nYKzVaAhFuceo3tqt65+DPQJ4J/u3SaFWvg2Sj9N
         hLWMKTgfiN0wy0LwIeO9qcp4NTQd1LfCqJOO0JyF8+ZNTOEbMSUgEW74+8p6AWiO8zib
         socNeLHrZrBTHHpLc3HaHU9i7qr8IsLzkQqfqMJqPC9yKB43a9NGjlVCB6neySuuQoQo
         ZPUcr+j1yTacEdaN8Iwc/go+weaQ0i4/zi7dT4vD4dRgwnSA6wfG23B2rRxIYx4GwKen
         3Eow==
X-Forwarded-Encrypted: i=1; AFNElJ9R9JxXz4vT53/KV9KxCkSnj10ZoEY/akH7VgA7IHnpCI9CExv8X80HhLujktxjRk3PqG+xCxl+vkW8@vger.kernel.org
X-Gm-Message-State: AOJu0YxaCr6KQMCOiqmizsm9xJy450rAICAYX6ndrsskNJeYNtrzZvTJ
	agvPCJbn6tFNXo0R6D1cEIG8bOUEc8hEHmPs+25bfd8/hD112YSawRvLkWEiL/KN
X-Gm-Gg: Acq92OHnddbXFoGcMd/HVXVwahN5ZwI1Cokk+XNYUhUrHbpO5ujwRCh3B4VjPaeZPPH
	ehRcz08mQVdrYqm6l4bjHI/Yx+lIA9Ns/M7pT/zIchnxmjI0euu0Il9XexQrko0Snuqh6nFIebC
	50oWZroJKW6qN5gvWB5tmqcOADoX6ehsB3BIGsNv8bErROkunLd4HGn6QSP4jsIbUZ9BaZASr7/
	m6JriTBjXzYfIjuM1Ii5g+VkLA9G4huCMgHKy1wBk+EJ/2LPIqJF52qpa77hhpkPAWeF/bCgOhX
	45dO/mJ2CzdvA2+Xra79gfTcX0L2LGuTeAKrcVM69oXCBl/y8/58JWUr2TjuCNTTQA9A6U82sR1
	DakywcNhXZTLv3JOMY+HSgR3YNXDVgoIXKuSJ3+pZgBv+yj0KYYF9Vh0Wll7IqKdwT//ria1Q99
	10VpWoF34DfizvDb9POdudNqY=
X-Received: by 2002:a17:907:e117:b0:bed:62c1:ec with SMTP id a640c23a62f3a-bf3704783c0mr169855366b.13.1780721915036;
        Fri, 05 Jun 2026 21:58:35 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v4 10/14] mfd: lm3533: Set DMA mask
Date: Sat,  6 Jun 2026 07:57:34 +0300
Message-ID: <20260606045738.21050-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606045738.21050-1-clamor95@gmail.com>
References: <20260606045738.21050-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8520-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:clamor95@gmail.com,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6617C64C796

Missing coherent_dma_mask assigning triggers the following warning in
dmesg:

[    3.287872] platform lm3533-backlight.0: DMA mask not set

Since this warning might be elevated to an error in the future, set
coherent_dma_mask to zero because both the core and cells do not utilize
DMA.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 500cec3cceba..5d17da1d998b 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -489,6 +489,10 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 				   LM3533_BOOST_FREQ_MAX);
 	lm3533->boost_freq = lm3533->boost_freq / (500 * KILO) - 1;
 
+	/* LM3533 and child devices do not use DMA */
+	i2c->dev.coherent_dma_mask = 0;
+	i2c->dev.dma_mask = &i2c->dev.coherent_dma_mask;
+
 	return lm3533_device_init(lm3533);
 }
 
-- 
2.53.0


