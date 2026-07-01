Return-Path: <linux-leds+bounces-8812-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f9j1GmMfRWqZ7QoAu9opvQ
	(envelope-from <linux-leds+bounces-8812-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 16:08:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ECB6EE860
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 16:08:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=n40xO7D+;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8812-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8812-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A2FE333857D
	for <lists+linux-leds@lfdr.de>; Wed,  1 Jul 2026 13:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14EED492515;
	Wed,  1 Jul 2026 13:39:32 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6668E481659
	for <linux-leds@vger.kernel.org>; Wed,  1 Jul 2026 13:39:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913171; cv=none; b=ksxW6ZTcVNxi20j4Tp0MfCmVVYph9itD5BDaAEUcG65iRPOUqv3clwCcEhKNTA40HYusvPIuyYqA0rdNy1L+ozklcAC/FaOrBQA2Vu1ZkRzVdHBRe9VrhyvszTtyMNIjhATDxObYaDUqofCWM18QN4E03MSC0iuT+ByyYxPZ4S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913171; c=relaxed/simple;
	bh=iyApOAEOY5TBYSjFOREEdHmk6S6q7HtfO2z37dB4gIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a+M9bDvTRunjyqX2CaNUC8IkCTn3JFFImEHNkwYRZ5ya7ZPPzQLrxoDD7HqYxmccaesOw8kTeK21QHA9faueYrV+SiQJ/zZ4o3YCU+eCxAs0MtonNn4k6r946sd+++RUuCcsP7TNTvUDH9rE1kwDxhxltpd1nY/15NvzGcG0wxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=n40xO7D+; arc=none smtp.client-ip=91.218.175.170
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782913166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=omlfr8grDNGfvojgouDHF79/mYKrbd83gvLmW6Qk2F8=;
	b=n40xO7D+m9+wraOUGGIAVuBeNYupi4LNm/E4/olVXZEEsNdfCuUS0bVcMpiaME0TygCPj1
	E1jpPHZt8YqW9W2ZKM/FLEB1l5RcDIht6YNwcUT3nHqj5jNo26uAsOfojwaSBUyHcYSIsl
	ToB+EJbUqt4TfXKcaKgDmDYGOGR3j0Y=
From: Junjie Cao <junjie.cao@linux.dev>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	caojunjie650@gmail.com,
	junjie.cao@linux.dev,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 1/2] backlight: aw99706: Fix DT property names to match binding
Date: Wed,  1 Jul 2026 21:39:17 +0800
Message-ID: <20260701133918.33487-1-junjie.cao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8812-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[junjie.cao@linux.dev,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:caojunjie650@gmail.com,m:junjie.cao@linux.dev,m:mitltlatltl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[junjie.cao@linux.dev,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9ECB6EE860

The driver reads four tuning properties without the unit suffixes that
the binding mandates: "awinic,sw-freq" instead of "awinic,sw-freq-hz",
"awinic,sw-ilmt" instead of "awinic,sw-ilmt-microamp", "awinic,iled-max"
instead of "awinic,iled-max-microamp", and "awinic,uvlo-thres" instead
of "awinic,uvlo-thres-microvolt".

As a result, device_property_read_u32() never finds these properties in
a binding-conformant device tree and silently falls back to the compiled-in
defaults for switching frequency, switching current limit, max LED current,
and UVLO threshold.

Fix by aligning the property name strings in aw99706_dt_props[] with the
binding. No value/range changes are needed since both sides already use
the same units and enumerations.

Fixes: 147b38a5ad06 ("backlight: aw99706: Add support for Awinic AW99706 backlight")
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
 drivers/video/backlight/aw99706.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/aw99706.c
index 938f352aaab7..abacf5a6c8ae 100644
--- a/drivers/video/backlight/aw99706.c
+++ b/drivers/video/backlight/aw99706.c
@@ -130,23 +130,23 @@ static const struct aw99706_dt_prop aw99706_dt_props[] = {
 		AW99706_CFG0_REG, AW99706_DIM_MODE_MASK, 1,
 	},
 	{
-		"awinic,sw-freq", aw99706_dt_property_lookup,
+		"awinic,sw-freq-hz", aw99706_dt_property_lookup,
 		aw99706_sw_freq_tbl, ARRAY_SIZE(aw99706_sw_freq_tbl),
 		AW99706_CFG1_REG, AW99706_SW_FREQ_MASK, 750000,
 	},
 	{
-		"awinic,sw-ilmt", aw99706_dt_property_lookup,
+		"awinic,sw-ilmt-microamp", aw99706_dt_property_lookup,
 		aw99706_sw_ilmt_tbl, ARRAY_SIZE(aw99706_sw_ilmt_tbl),
 		AW99706_CFG1_REG, AW99706_SW_ILMT_MASK, 3000000,
 	},
 	{
-		"awinic,iled-max", aw99706_dt_property_iled_max_convert,
+		"awinic,iled-max-microamp", aw99706_dt_property_iled_max_convert,
 		NULL, 0,
 		AW99706_CFG2_REG, AW99706_ILED_MAX_MASK, 20000,
 
 	},
 	{
-		"awinic,uvlo-thres", aw99706_dt_property_lookup,
+		"awinic,uvlo-thres-microvolt", aw99706_dt_property_lookup,
 		aw99706_ulvo_thres_tbl, ARRAY_SIZE(aw99706_ulvo_thres_tbl),
 		AW99706_CFG2_REG, AW99706_UVLOSEL_MASK, 2200000,
 	},
-- 
2.43.0


