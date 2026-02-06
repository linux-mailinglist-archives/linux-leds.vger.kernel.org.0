Return-Path: <linux-leds+bounces-6866-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMH/ICklhmlSKAQAu9opvQ
	(envelope-from <linux-leds+bounces-6866-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:30:17 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A4310106E
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99631300D24B
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 17:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A4F407572;
	Fri,  6 Feb 2026 17:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdN5I5wj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E777423175
	for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 17:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398957; cv=none; b=mRDarWp9qbkFJJOPnbBQ1gXE4XIZX7VrxXyV6ldfzOnt/EuOK1DxftcwA9/i3GwJd/c2aqYl8Zqckq7vPBzrKj+X9HPZ9BB5fJK/55aZrDH5B8YUsAzsg2wphHE04L9Ng2ITrZc2YyBRZC7Qr3U9TjxGLrEi60tWQGQPOZ7ECcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398957; c=relaxed/simple;
	bh=zDdA6Z/8E3qzcgVxUJG9XgVMg2hV9AEwM6u4bLx3TbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/3M7fKFIqsOTDfqO84+7ajEcP+YZth7EXEtYJaM5ueJ9YcqYio3UAVVBT/5WpnA79G2zg0TOY836b82nlgqpymE0qFmDhOQr4ajF8zvLdGYZXQf3pi0krthUQIGYAr00xzhXzvV/uU4IROg24s9i+DWRC6WGTIZTd2DcPJuw3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdN5I5wj; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4362e77d7fbso506703f8f.2
        for <linux-leds@vger.kernel.org>; Fri, 06 Feb 2026 09:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770398956; x=1771003756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NXIB170Miy5U8AUdI7je1qnmIqOJUqz+7CF8NtEdwM=;
        b=fdN5I5wjE2WPpeZmJrs2RKKds7Z8CciRyzg9TQKKINNc3TbY51b3CHbwd5CRsO8Fdl
         D/bRgw6zij3btttKrnf4ku31E5FKVm0Olu1OOtQFA6NnD+I0IXleCXTQQ1L3ACuAN/mX
         uVCvxs64sBHXq7EGyt2RgD05BkCNHJp+DqZPfXsdJDqkC4B9swNLgRrV04XKxqcbvVNA
         6ukFI3yJRxYkS5U/jAvINak46f1XVQZ/COOqhUv3JaDCSpAk0W6PQBSvx7zpbvQGtWMU
         iKhcKY7LUEi8QWvbr/lq+Pwh0OgnmrwSfpI9cKAgz3rBKqA3BHWaGupA3jzdXhiT6l4/
         RDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770398956; x=1771003756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3NXIB170Miy5U8AUdI7je1qnmIqOJUqz+7CF8NtEdwM=;
        b=R0sjBuKtFjoGaBZFrbls6TmjtILp5jq/7SvZm1zf0NqIAVr9SfoVjh9Mayd+itSN2L
         /V1DYbOp/lQxCNNVMxcyzEZtzjuA5dTwyFDRbTiKwJUu7WTwwqFnHLHibRxwv/8TdJ74
         hEoN00TzxfXmA6W0d64C12XQrwxhJHUnZoB7gTZ5aMAcvA+RIqNaEsMZs/98v9s2LTd4
         qE906IIJORkewUytf+0mjtsrqsR7xMIJLyHZOU0PHZR5glWFYIeBGNHJIAfrA2e2lerP
         yE2si4MtLGWz6oJLLpQ1qVog/KX19LflbNq4gAzBYYUK/zfBTghFj3DuWxiZ3pXx3l2S
         wSYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrWFRSw+UMSyDCj+GBNTUCxKfGMxLYYvbE7nRQNhLIsuJaTgeBRS44GCLxiTx6witNBYDr+tp9NkA1@vger.kernel.org
X-Gm-Message-State: AOJu0YxO9LbAhJ+SnnJdU70Jeh7E7FxXIYs81epjKzw5MYwY49cLWy4B
	xBKgzURJXDMCvP8Cg2zVAm1PlGB+JdIUj+FNnibgRYfIWb8Ym2G/aQMh
X-Gm-Gg: AZuq6aLibuFosHrRGv8B5+Kjl+rbSUCtE9ybIIwErroZyrcCVDt/oyJYyMT9iwhpwyn
	P2kaleuf7z9oxvY3tTCbD60keDMTYwh1v1P34KxaTUyXXpsX+Vi/b5KNY4PgxmPjwlbtuRDTcXu
	PC27xRRe59oFCu14alp8lStdp6kiVPBhzBkPI/Tquw4F6Q7JhhTJlW1G81GKHoldeS3NMKyZWOg
	gm3ZTphXem0qpbaZzzWIbCGhU0hoZInA2RewEjW7punbHqoZWehf8Eq4c8ID3mNi/zRVhsGRVl2
	PU7aXLYNjoCVITehXgxLa9di6Y3a2BP7FGsR1EQwYqc7YXmoGiEEZoUQE88TZNxH6JkMgd1aSdG
	Sx06RFnKMbKKUbC3zhnUh4KHtkYsG1SVZ4Cr2z/PipB/FKDRihIM2pKWeunKdXNlLSWlj3TiIzw
	9V
X-Received: by 2002:a05:6000:603:b0:435:dbe3:c6b1 with SMTP id ffacd0b85a97d-436293413e2mr5847642f8f.25.1770398955843;
        Fri, 06 Feb 2026 09:29:15 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629734268sm6846033f8f.24.2026.02.06.09.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:29:15 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 05/11] iio: adc: cpcap-adc: add support for Mot ADC
Date: Fri,  6 Feb 2026 19:28:39 +0200
Message-ID: <20260206172845.145407-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206172845.145407-1-clamor95@gmail.com>
References: <20260206172845.145407-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6866-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B4A4310106E
X-Rspamd-Action: no action

Add support for ADC found in Motorola Mot board, used as a base for
Atrix 4G and Droid X2 smartphones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/adc/cpcap-adc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/iio/adc/cpcap-adc.c b/drivers/iio/adc/cpcap-adc.c
index d9ee2ea116a7..f6f72efcc6ed 100644
--- a/drivers/iio/adc/cpcap-adc.c
+++ b/drivers/iio/adc/cpcap-adc.c
@@ -934,6 +934,17 @@ static const struct cpcap_adc_ato mapphone_adc = {
 	.atox_ps_factor_out = 0,
 };
 
+static const struct cpcap_adc_ato mot_adc = {
+	.ato_in = 0x0300,
+	.atox_in = 0,
+	.adc_ps_factor_in = 0x0200,
+	.atox_ps_factor_in = 0,
+	.ato_out = 0x0780,
+	.atox_out = 0,
+	.adc_ps_factor_out = 0x0600,
+	.atox_ps_factor_out = 0,
+};
+
 static const struct of_device_id cpcap_adc_id_table[] = {
 	{
 		.compatible = "motorola,cpcap-adc",
@@ -942,6 +953,10 @@ static const struct of_device_id cpcap_adc_id_table[] = {
 		.compatible = "motorola,mapphone-cpcap-adc",
 		.data = &mapphone_adc,
 	},
+	{
+		.compatible = "motorola,mot-cpcap-adc",
+		.data = &mot_adc,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, cpcap_adc_id_table);
-- 
2.51.0


