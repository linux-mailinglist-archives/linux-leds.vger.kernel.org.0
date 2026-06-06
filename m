Return-Path: <linux-leds+bounces-8513-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VGcaIwypI2oRwgEAu9opvQ
	(envelope-from <linux-leds+bounces-8513-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 06:58:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 910F964C6B5
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 06:58:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YJj9WjiX;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8513-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8513-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2DCD301B337
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2026 04:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29563305675;
	Sat,  6 Jun 2026 04:58:15 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA163304BB3
	for <linux-leds@vger.kernel.org>; Sat,  6 Jun 2026 04:58:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721895; cv=none; b=VrP8zKLrjl3WlCUv9FtjZ5Kps2/ADv3geyDOgMhtaopMmYAD+1eheeSQb9lHmu447gnUhJPWPm+jr73HiocsQSceNAQQicNm7i8URwuaZrMHAWwSgn2zeHb4YP0RKfVTD+CrcPWQGuQXoYP/WnZYvXcrJj/vbJTNR0WitzPvGKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721895; c=relaxed/simple;
	bh=TwTMH444TQxyNANvjbKliwqB2xUrF4F6rItPqPyQfQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCo0hgv50olOfoqipQZAonSBSpkviZn+3juglI+MQgfP3GhPj4GPNfGG70r3ksIM8G9BnM3MADewn0ZdsqsF7ph0NbpV5Km0A8bKBlqcJLLmpzYPgVLYiyDl7ruEM/GxflLw8U2SYBK6tq4C55MLLUz6Bm2Vod+uaOUSwlSowz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJj9WjiX; arc=none smtp.client-ip=209.85.218.43
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bed19623d6eso298494966b.1
        for <linux-leds@vger.kernel.org>; Fri, 05 Jun 2026 21:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721892; x=1781326692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIXOvbsU7+o0n1Qu63VvvDhjmq7U5oR0cXTC0wZz+Oo=;
        b=YJj9WjiXr43PEAcbIaLfkvdprJG+MiDLNcOh1yMpwgG2uNq7XJtBRhk08MJASekLay
         z58rrhW47XSdwDTuW5ifeoNXDeKkIWu9COyB9zIShjRTs/SOZqD59C1e8IMGs1GAidUI
         8d496OhP2+cvrDr3QhPgj9UnWD8meVa+KxP5Fdw4j4Vi2LVuZtjpG+eMYbjjJWH2cACY
         6aj4mDbQ7Uf06nPfxHRxguoy9kj01jtphW0nbyvfb2RVILzpcGFVCnjHoH+7aiVn1//W
         2cEfebvVPo5AQEFd1tVeTnVyGsLx54cTq6MDVKjkaz53PGiTEeX02wXPbe7CUxiCzgwf
         K/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721892; x=1781326692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VIXOvbsU7+o0n1Qu63VvvDhjmq7U5oR0cXTC0wZz+Oo=;
        b=tXwlyDC7TzGRYGrWcAYMnnTg2TxrNnw+IsK+FjCpxxzy4M123YyD6TWkxta8HD9PfN
         JCVwymVEZjPvXOxHytEAsRHT0WePJTmuJZJ4m8bhwTzUX2qnMEeU2VV72SUH2Zv64ZCB
         LAfPupHz90/jPueQPGYzxeGnqUAf3kJGayIGkoTexunbWWkvo7asYn3plfY7bWld/Bli
         lI/xLKdPHtlj5FCUhVryDcFB+jnyy+uDslRWM54sfCU5Tos1SxSoeQVcsO9wndSIOxNR
         +ZAbKERHoPVH/znRFbPtkRml13/Q54oOOrGDGVG+liv/nFZf3SCqKxOc9j6hzoqGEAKu
         esPg==
X-Forwarded-Encrypted: i=1; AFNElJ/7pWpHPjzk0rcdFQYno/oEDwBVQeO/RlLDqsEL7H/2jgy4h/b44XV8QjmybVdwk9YYBKxO4sPH6P9k@vger.kernel.org
X-Gm-Message-State: AOJu0YzC7hGdz0b/VqmdCz4ZGZNX5FCsJfuuKm8gR53rOuSuJ7O43rda
	QYKkdsViW5+6ZyBkSg9U1to25Wvb1CJ26iL/1Ndk8qUjljdPX5sElrlU
X-Gm-Gg: Acq92OF0D7PfHkJ1lsYlwDgHl86unBlquJP8N5OIeTOPKnO4wHpJjjqVeD7d5EgE3FT
	3PWI3L4O+8GK0+ZqmKoMBEJpgCkLQSULZpSUInqwkzrbVfwRaXNjCAvBLCu9GWGBAwgcF2CdbfJ
	cPMl98x1gkjMqSS4xyPr1u+Jw5iznwJe+8E83XuObNQ98VK6IrIOWxF01Cuna475xgb6VTqpeQ7
	kubHF9Go94cTbVks0iZLhX/bMoAWtuUqn/+qJM26b96JVY5XDWFYEqNgArPIKoa3n6mnqYT7Be+
	e/cktW8HvvdBavkn3Sk/F/MMzYh0AY47IASEDaTI4Z6qJZBZD7RsRi9jbHm9LIB4JjGB6VFqhzx
	H3XAuA+/FplHGJ92IbAinkb/IOVLO8oZ03T81URYWlRirx2coSCBB6SZ2Ovyv1Z79J9bGuS9ghA
	twu/ck737tazE5hOlHRpnDr61UFUJcaknnSA==
X-Received: by 2002:a17:907:75c2:b0:bec:db41:e4ae with SMTP id a640c23a62f3a-bf3737ebea2mr248152866b.43.1780721892058;
        Fri, 05 Jun 2026 21:58:12 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:10 -0700 (PDT)
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
Subject: [PATCH v4 03/14] mfd: lm3533: Remove extern from shared functions in the header
Date: Sat,  6 Jun 2026 07:57:27 +0300
Message-ID: <20260606045738.21050-4-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8513-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 910F964C6B5

Using 'extern' is not required, drop them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 include/linux/mfd/lm3533.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index db0a5e5c9e39..aab8f08dfcb0 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -82,14 +82,13 @@ struct lm3533_platform_data {
 	int num_leds;
 };
 
-extern int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
-extern int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
-
-extern int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u8 val);
-extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val);
-extern int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb,
-								u16 imax);
-extern int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u8 val);
-extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val);
+int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
+int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
+
+int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u8 val);
+int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val);
+int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb, u16 imax);
+int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u8 val);
+int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val);
 
 #endif	/* __LINUX_MFD_LM3533_H */
-- 
2.53.0


