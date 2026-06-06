Return-Path: <linux-leds+bounces-8523-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XD9oAp+qI2rdwgEAu9opvQ
	(envelope-from <linux-leds+bounces-8523-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 07:05:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7791E64C7CF
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 07:05:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ck2telJ+;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8523-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8523-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C6B7305D70D
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2026 04:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A625305694;
	Sat,  6 Jun 2026 04:58:48 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A3A313E07
	for <linux-leds@vger.kernel.org>; Sat,  6 Jun 2026 04:58:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721928; cv=none; b=mVypifVz4PBEAWW5pt9FDOHY8fR9InOjnAzm+d6+hyMc7TL6HfvdrH4kqGrqSAGlGznMT8uh32k5rptYGo8YDsQbyoszGud6P13FFr/StnR8J8JaoCNzQCifenbL3iVmqnWNliP9Mxv9p9sqzBXH0AHLpFCOBcWY13mATytQXaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721928; c=relaxed/simple;
	bh=8ihLzDpqisj7RCWIgvP+oI6UBuVHBgOFSoKuiunQyxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l32Wr02FfUS2Tet3iEvmQtWwHcTfdFESrj7YDlYRTD1phTkMOMVfnLgncEIpQtLzuhg+Uw4ah34PXh0Fe0VJfUTIYnvIe5dip/rW9YTVVmDSOyHQnBP3jfo5k8WAtgCtRr/NdReafM57mVLI/gj/8Me/s8HAV+SvKbuLi72wbcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ck2telJ+; arc=none smtp.client-ip=209.85.218.51
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bec450b950dso372855966b.2
        for <linux-leds@vger.kernel.org>; Fri, 05 Jun 2026 21:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721925; x=1781326725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMkYm2wLFurUx2dgxyb2h52E5PnRVf0UR593PbHgI/g=;
        b=Ck2telJ+fs74MtpcAOJeTy4O7AEBa7S8SvbI7OpYYhirYyA6IQTINVWse9cGmNGteB
         m9Pz+khqBVoefNt3pWHCLM/JJO/MYzuvVQ4ysjk+6IGfrMDUgGOTZ5zVRUfEUL7WFBAh
         OPTkXEejpD9sJ4B+SqdswG8ZzOD9DC0WzdG9FN7CSrGSiSPUnrIN2n7ahP9exY6YFOhF
         6//N9euZ1h1OTBVXq6h5UER+PRmnJmWYKSmIav2nGH/3w9QNGomZH4urpmqYdCye6znu
         L0rY5XFuVf69oYK9AmpsqfQru9MiW8v45eXo9kEX8QV1M1kp1K6hivKfWZ50b8Yt55J7
         hbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721925; x=1781326725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aMkYm2wLFurUx2dgxyb2h52E5PnRVf0UR593PbHgI/g=;
        b=iVp9jqyhifZHZJuFsa347h/WfFX92pu8xHuJatkvCMoNzIBnPnWwkRXV99GU+HGNBy
         l1eAdykHSZQiGqImPATqUIZbMymnNEtippfmt1WQCqb1HrhYzR1gc2/Oh7SvjMb4npkP
         ljdYKiG6ujSIHFXGNUbt4tC6W4U4QODagLS/WBpY9gW/cJhfJ4eq3p4jd0DnZhaq3SK1
         aFZDFzNEVzTpsukXlsh561Xbf8qRVBzP8fc190OcxTwwUdk8jxTUAcmWSw312woh3FDI
         Q32tjX9NdVNaWHwo16MSL8q+sWHOTBjE+AjSNW+6WBjrzJL6LYEKQI56jOTk08NT5Oay
         wihQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aV35ZG/ul1BuTuVI/OP1bPvl0Nz7fr1ZGnTnD8c4epxBM9CPLzZCYcB/k7l/KmJqsMUnkge7PMr/u@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpe7oH/VKJe56/lc5VV9ufec/pFqk5uGSsRUIRZq2gadGzLF/B
	ZzW+aLTMt50U7V2vq//0hGE6ZbpZ/MLJlyoACp3vju5uksOHVwOHa2St
X-Gm-Gg: Acq92OF//MRY+Yu1eaxi8PXLBVWl0aThkyrf/i04IXb4rBYMRxgJRZeDTexbCi7wVUl
	w16KOmNZBj6+g3OIB5WiHzoyXlhWbQlo/R4iGylafd3zgU0OP85BbK3kVnvFyNRlanmHMvDbM8g
	5afcQLPNn2JBDFw3/V62FV6e/GC3vy62fSOaoznnKVU672Aw7X6mTM8u8bkkptzrsK1lbVkiGWJ
	jAsuQuAHqifw9EBhKr1HNWul0CdP7+SM05PnRNaJHgwG+Zb9+4up+Gojb3A164vtno+B3nr7lpQ
	TC5uLJS3mP5lf90weBx74A5bFXohSarvwCPCGFfT9NVztc3zurmlJ4cJ7cNBZgNd6yuLydAiK1z
	pLeiiRLB3g6ZFyUlC1jKJI6lq4uuFxkZEdmrsFTrsLxrLhIp1vidGhOBr2Cw/x0UJYxdxfj9sYw
	w/mUEG0IGyujlwDKALFAC66ck=
X-Received: by 2002:a17:906:f5aa:b0:bec:157:a630 with SMTP id a640c23a62f3a-bf3721598f7mr362897366b.23.1780721925345;
        Fri, 05 Jun 2026 21:58:45 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:43 -0700 (PDT)
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
Subject: [PATCH v4 13/14] video: backlight: lm3533_bl: Implement backlight_scale property
Date: Sat,  6 Jun 2026 07:57:37 +0300
Message-ID: <20260606045738.21050-14-clamor95@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-8523-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: 7791E64C7CF

Since the device supports linear and non-linear modes, implement the
backlight_scale property to describe this state.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
---
 drivers/video/backlight/lm3533_bl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 4f8cde9f290d..2aa4b86042ff 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -142,6 +142,7 @@ static ssize_t store_linear(struct device *dev, struct device_attribute *attr,
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
 	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
+	struct backlight_device *bd = bl->bd;
 	unsigned long linear;
 	int ret;
 
@@ -153,6 +154,9 @@ static ssize_t store_linear(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
+	bd->props.scale = linear ? BACKLIGHT_SCALE_LINEAR :
+				   BACKLIGHT_SCALE_NON_LINEAR;
+
 	return len;
 }
 
@@ -290,6 +294,8 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	bl->linear = device_property_read_bool(&pdev->dev,
 					       "ti,linear-mapping-mode");
+	props.scale = bl->linear ? BACKLIGHT_SCALE_LINEAR :
+				   BACKLIGHT_SCALE_NON_LINEAR;
 
 	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
 					    bl, &lm3533_bl_ops, &props);
-- 
2.53.0


