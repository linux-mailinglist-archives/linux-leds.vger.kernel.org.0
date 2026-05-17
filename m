Return-Path: <linux-leds+bounces-8163-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMUjA1RyCWpJaQQAu9opvQ
	(envelope-from <linux-leds+bounces-8163-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:46:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD58C55FC11
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 994003038530
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 07:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDF8314A8D;
	Sun, 17 May 2026 07:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoDyHsT4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC3031354F
	for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 07:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779003824; cv=none; b=RPMTj5wqa5q/fKYPNQvBOaROqT/XKxReefbwDSlAOEs5U0S7UsibdBFYd6W8rsSTVhhsfovwJG0ckyZQNNiTPBAqT+NgONO7iWkPcpXjl8z/04PFS7xf9kkNjDQ88m83wELl7rC3X5u+036ABrCVHRBYZoQDha6ARHsBY/3ODhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779003824; c=relaxed/simple;
	bh=SomMXQMUuqQ9puJg/elt7woziBoLt88xB52B85k+sEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPAGr0DewMjuhER0RVH3Gplnoypg+252JxNevLBpOTgOL0GySnRVm/ByRC9vHv2VmUmdwXfRWvhjsH3uDLGaOnbpbz1bEl97rdDqQ44x88FfYZ+x5VwpYZV3oVHFMfQRPWki9WxCF5rlIFZ0Q8DiEd/jXUoM06F4KYyArOIfq3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UoDyHsT4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44e1860558fso561111f8f.0
        for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 00:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779003818; x=1779608618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKwCpCIE3pQrKMIlzgxzd9zVO2yq7zSfHES0U3paVng=;
        b=UoDyHsT4a7UV/Gb0gAlXcvRfHdo7Ew1to8uN5nhoK3wkNKvSpuXcN8ybuPKGgXJ5Gq
         F5FygrKjTfVoDpq0gMCEVUmzZLn0myik+tK05B1huvBePkSSaObfbuATBKElDZrJaCuV
         NzwPrDcB69NMYJ1VWPT457YAtcvRlfgRwhdzwcw1Nuq/DpcA2P526bSHLcfrwwaNhUgt
         QykMeA1sE9/zo/OeBe85N4uHmvc3evI0S/biiXAiQGSgsb7YVEnsILf3K+garNYvX1MY
         jw2tJgVpZQYHmrnNrRhADBjE7Kj9EsakvKDWiH/HDzf6Zymy4fT91NbNn2VEUVN3p8j0
         5zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779003818; x=1779608618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PKwCpCIE3pQrKMIlzgxzd9zVO2yq7zSfHES0U3paVng=;
        b=HmreOQyLGaPovzUHTE3Zsk9E5seKgfkGzzDflf9G6iRculSKhhcfibOl/JAtOttf3b
         XQ/nnfAgdoqBPPYT0vP5LxSEsY9hWxs87oapS0h7FT2bbjYV9nXrgLgPyP4n2DMr4EF2
         AzSLpl5JqlNIL8xQtZ3bVgRPJ3RdOAQSuj2vJXqzWFbHYH0dFeWEVZ/zN+ZGfikUNVJ6
         UIRdAe4gKG12ByPFKkEessCWOTGNFnkL2MooEWhkkYw8mYs2PGbvaml5kB2kscWVfq6T
         ozveBrYVAJTEyTBMAIpV4Pj5q/56dwqZg4d0rL8E6czQVmqBiaUFCvv7LL87aClDLHYi
         c3IA==
X-Forwarded-Encrypted: i=1; AFNElJ/BFY0Rrj+2Z6EMNsRguhRN22iqschmroQkwbunYqpsrWCCzaCQOwHVizUQCpnEIzVIXDnEVdHta72g@vger.kernel.org
X-Gm-Message-State: AOJu0YxKd2UXl+IiouDB3mf8/ikZW0ISTpugilRXftk7JxfiCKUJE8iL
	62hbYlnfp2Pg7exL2RChbQT3vXwEU2qsq9/KouB2CWKCanXfGxoUc+3Z
X-Gm-Gg: Acq92OFvPOgielyj2KOFp1V3a1I2FBb+aEARp96dHoZfOeqGKBiUMcwk9Xzbevn69W4
	UB1P9EufqhFnjSDqJVexJnByKkjlfmP4Qb0dWLrZV7q+/8v56iXh0XfjYT9syqNlKtDcEXxdEjX
	Ydt4Db5YqqLKAlq2tfXErWxKADOzcGoYx+VfLJp8Zfh6HOBivDTqTMYs06MUrbP9fgFk27SbQgO
	VYsd+eGPabqij73h1w6xcDUL0AYSvWUEb1ReO4XzOy0W8ZUMEXhI3xLxBolT8dKPqklh3Z8SPP4
	PSoxuNoBr859t2ygstQp3rdFiN2JbHu5c7C//+dlND6AJi2RksWrkdAbFNWGJTC5XfGn0SCP1Ss
	fdnYqZa+HimbYg97tjXcRiWJtdD726bz0BcugK+bZNQ0hPl/1ycJ9aZ16zEu1fLKUDfTl39f3Ul
	mOAt5i2mzZwlRV
X-Received: by 2002:a05:6000:2508:b0:454:9655:43af with SMTP id ffacd0b85a97d-45e5c30d598mr14636187f8f.0.1779003817436;
        Sun, 17 May 2026 00:43:37 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm27512864f8f.30.2026.05.17.00.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 00:43:36 -0700 (PDT)
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
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v1 4/6] mfd: lm3533: set DMA mask
Date: Sun, 17 May 2026 10:43:04 +0300
Message-ID: <20260517074306.30937-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260517074306.30937-1-clamor95@gmail.com>
References: <20260517074306.30937-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AD58C55FC11
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
	TAGGED_FROM(0.00)[bounces-8163-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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
index 131eb1a1c8eb..c7914afd564c 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -499,6 +499,10 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 			lm3533->have_leds = true;
 	}
 
+	/* Parent I2C controller uses DMA, LM3533 and child devices do not */
+	i2c->dev.coherent_dma_mask = 0;
+	i2c->dev.dma_mask = &i2c->dev.coherent_dma_mask;
+
 	return lm3533_device_init(lm3533);
 }
 
-- 
2.51.0


