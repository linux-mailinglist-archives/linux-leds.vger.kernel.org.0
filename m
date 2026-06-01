Return-Path: <linux-leds+bounces-8412-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDeuLAalHWr5cgkAu9opvQ
	(envelope-from <linux-leds+bounces-8412-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:28:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16808621B28
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 911B030DBC1D
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2026 15:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1348A3E1CE1;
	Mon,  1 Jun 2026 15:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="li2x1C4P"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760F63DB33E
	for <linux-leds@vger.kernel.org>; Mon,  1 Jun 2026 15:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327164; cv=none; b=FsbBYmqlir9RWa8cuPE8rpuxOeqHiCn7B3y2nSiPEAlZbTtENyxZENK3EHqLc+Kut5mvOEAHRW4RgvP7qL6HldA+Bj70Q+ysDbI9mEAW5iBQ4JOoJSY5Q7HXxKO1MqVi4VSSY6GYnXanBHQpLauiEh69+8GwuUiQ/1H6MFxIJnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327164; c=relaxed/simple;
	bh=x5K4xFRFiQMCHrQaFBke2R9ygwO72RPNpHJKJvM5Ef4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C9yMPi7ulHolV/POY5s/fOotRlEwmi2FshUzDik1++KgTkkFPUPw0mI0CdPVV5sZkEmFKMLPoXarXNpVfIBBto9blXhAyzEPRdeZ+ZGM8W0TsIHNvR+EyNEqaehe5R5FiJ6BrLtL1fSWImAtOQlhdjTOYGmOCsYR4/iJtIoruDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=li2x1C4P; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45eedc94d37so2038864f8f.3
        for <linux-leds@vger.kernel.org>; Mon, 01 Jun 2026 08:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327148; x=1780931948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1p24QeWuEOdkZHaL1V7uOjlrxK/vJ1VAKn0KvK7P92s=;
        b=li2x1C4PiZsuigqBQgmGPTakdR5fFV/3WLVzPcpYVZL0X2xEi3lq6jjWq3+Q3M/IXr
         TTP7uawhaRSjKjbM8dUWLmlb4yohmVNpvKZQTpaFlkWfZEelDbjdJ889AMRWxE8qvUCT
         oxMYi69LCvHXYT1VM0MnARsd8KMYysw5y03KBEqL20D4mYbzSXKfOBr0+gFqg6ClMtiZ
         KNrU3KI9U8zQhcBvKkNkyoFAE7HZ0YeljoE96sV1UEmTk075TIt3UJ+0GYausJlaFDT0
         YwxrwQFSnyHWhL33LdSAlI7TmHVST9XlMXOkieaO6s0q11zD+zTfF0M9Da5VohrOsnJJ
         biTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327148; x=1780931948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1p24QeWuEOdkZHaL1V7uOjlrxK/vJ1VAKn0KvK7P92s=;
        b=KmMWvCcA61NNVkGtlGN8u0cqR+8aT1NO6Ley5LowWbnO8E6zmvnaTw+QSaYBwsyjov
         LDfrjG3HM5qid91ZPvXvRYgsaceAWaUHOGIJGhxkA+AKUwarT9lJ063SkDi8DOA5+89o
         oxJSeDXhTwFBM5qLCnzvsrGgXRz+xYY950PsCMdPWDx5ZR3zjHuLDFQSUgo3TCJHiUdS
         USALRCXP6fluoyI0ySuezyXZgdHcJOqqImhL88oQ4EMRu/UDtbNe8vmxFGeJtSUsUVdD
         FXaMSYzQGcjnSQVekmIhlN4t1+QtDOkNFnE1z390SNZQRMtNuKXq8+h8ZOhgAmwttolr
         ezDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ja3MEYE9v9cxfBsUjm8129ptxiqyy4D1x3VIfV3CUsS/VtpTt2poLAlOn8sEZMxath7LH8+WxS6/f@vger.kernel.org
X-Gm-Message-State: AOJu0YyxlozBvhDlf3ACYShuM+gc6ws3RFNsH0BZo2BbmvMAgK7HzWyb
	jSFlA8Ije1zTtwiavd5/afjkrnAkMRQvnFlN99dbqB5fDXNpNmS0hm3g
X-Gm-Gg: Acq92OH5N4yy26CygozSTevo7EUP9USIjVJDwbxDvOq94IBJSrpCfV36rRjv9vdCXgX
	pHAGUA4wQAeRXyU/NUggYOL3D7IJtdJX7D8WWN3B2TBR9VxeYL9yiYVmqy2Ri4rgj2ylGbEQOVo
	q4d1hNfgggd9Ku+SfNhXU4sx9nLIzNTW9F2jbxb61D4MqWxorrDfB6C95bocbRVk3jdWF17wROi
	PaUaWKoMkN3pMFAevnNgDnEfEBqz9h9BxuLQ/gkH7KuUVzTH5IZWxkB3pzLt/G5uGUmBhOraUTP
	m7U58LLU/n00yp7X+AJwLTupkG4J7I/vwvjWs6C5FRSFE0tBgSjZvRgp0e4rYJzv7PxGb+amL/l
	CpI4GwZvD3gw9ukyaY1FwcWPJ7uke2kmgsYIrcNur2vVw+svfF+pkx2hwTmDJ1TjsvsGQsb1xBU
	6/stEfgAjK5Ijes0s06eFP1Ds=
X-Received: by 2002:a5d:5cd1:0:b0:43f:dd91:b022 with SMTP id ffacd0b85a97d-45ef6b791f1mr16538591f8f.35.1780327148356;
        Mon, 01 Jun 2026 08:19:08 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:19:07 -0700 (PDT)
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
Subject: [PATCH v3 07/11] mfd: lm3533: Set DMA mask
Date: Mon,  1 Jun 2026 18:18:27 +0300
Message-ID: <20260601151831.76350-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260601151831.76350-1-clamor95@gmail.com>
References: <20260601151831.76350-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8412-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 16808621B28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 4dca5641b774..b597d338d6f7 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -491,6 +491,10 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 				   LM3533_BOOST_FREQ_MAX);
 	lm3533->boost_freq = lm3533->boost_freq / (500 * KILO) - 1;
 
+	/* LM3533 and child devices do not use DMA */
+	i2c->dev.coherent_dma_mask = 0;
+	i2c->dev.dma_mask = &i2c->dev.coherent_dma_mask;
+
 	return lm3533_device_init(lm3533);
 }
 
-- 
2.51.0


