Return-Path: <linux-leds+bounces-8813-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zVvxBsYZRWr86woAu9opvQ
	(envelope-from <linux-leds+bounces-8813-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 15:44:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CF36EE480
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 15:44:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=Z3DuxW3R;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8813-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8813-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA26C303AD82
	for <lists+linux-leds@lfdr.de>; Wed,  1 Jul 2026 13:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E5C48C403;
	Wed,  1 Jul 2026 13:39:41 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DC1192D8A;
	Wed,  1 Jul 2026 13:39:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913181; cv=none; b=sgYuAbI4K9EwxWll1W8Yq6qpY6uijv7wtYBrHSbTlVg0hkkL+Sqmgj8W8pScYEQYDfRse9wf9bp9aFZ/dXQaz01f1QKK4J6ZNxT8O7z1GK628KsH9dUddqcIr7EgAIfIxdsHxrQknoQEnQ+9aVsjF16m+0ePQ0ClcAq6TIchlVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913181; c=relaxed/simple;
	bh=30WZdNdAZDgJNhuINEGyNlJTTmfcrpsaavdPxn8+9Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPuzb2brSR+r0iAPRdAlXYcodY3deN/7pt6XAu94VVkQsQBeEdwpMcaqiQtp/C8Mj/kZlO6+t0+NoixBLlmhMEO/NhhIAXwpvusdNGgF56WDtOZfgGFiQYWXPP2MO0WE+E0RMmt/mvON+lHtIO9BNRKHDPdnm7l/r0GXWNnAyVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z3DuxW3R; arc=none smtp.client-ip=91.218.175.182
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782913175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOWwwSP9za3ySnqUIp4QGZCVBjvliudu4EI+ddMn/CU=;
	b=Z3DuxW3RXG5bPxSjNZ6Xmvz0/d4zgq9/zKKmlJJuPrmwf893SfcECPBy70K0jrB4k9rUWT
	JwY83ElJsPO9FvEf+2eZhq7ScxLSVVw6zXpnDCpM+GFxsIv6xY/kYvCtWlllCVEByMYofO
	JN1qxyY/nBUzfmwX9TJ7UVs1RqpZmW4=
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
Subject: [PATCH 2/2] backlight: aw99706: Validate all DT property values consistently
Date: Wed,  1 Jul 2026 21:39:18 +0800
Message-ID: <20260701133918.33487-2-junjie.cao@linux.dev>
In-Reply-To: <20260701133918.33487-1-junjie.cao@linux.dev>
References: <20260701133918.33487-1-junjie.cao@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8813-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1CF36EE480

The lookup helpers for dim-mode and ramp-ctl take a shortcut when
lookup_tbl is NULL: they accept any u32 value without range-checking
and return success unconditionally. Out-of-range values get silently
truncated by regmap_update_bits instead of triggering the dev_warn +
default-fallback path that the other properties use.

Add a field-width check for the NULL-table case so that values
exceeding the register field maximum are rejected the same way a
table-lookup miss is.

While here, also switch the error returns to -EINVAL for consistency.

Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
 drivers/video/backlight/aw99706.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/aw99706.c
index abacf5a6c8ae..a00a4144f160 100644
--- a/drivers/video/backlight/aw99706.c
+++ b/drivers/video/backlight/aw99706.c
@@ -94,6 +94,8 @@ static int aw99706_dt_property_lookup(const struct aw99706_dt_prop *prop,
 	int i;
 
 	if (!prop->lookup_tbl) {
+		if (dt_val > (prop->mask >> __ffs(prop->mask)))
+			return -EINVAL;
 		*val = dt_val;
 		return 0;
 	}
@@ -104,7 +106,7 @@ static int aw99706_dt_property_lookup(const struct aw99706_dt_prop *prop,
 
 	*val = i;
 
-	return i == prop->tbl_size ? -1 : 0;
+	return i == prop->tbl_size ? -EINVAL : 0;
 }
 
 #define MIN_ILED_MAX	5000
@@ -116,11 +118,14 @@ aw99706_dt_property_iled_max_convert(const struct aw99706_dt_prop *prop,
 				     u32 dt_val, u8 *val)
 {
 	if (dt_val > MAX_ILED_MAX || dt_val < MIN_ILED_MAX)
-		return -1;
+		return -EINVAL;
+
+	if ((dt_val - MIN_ILED_MAX) % STEP_ILED_MAX)
+		return -EINVAL;
 
 	*val = (dt_val - MIN_ILED_MAX) / STEP_ILED_MAX;
 
-	return (dt_val - MIN_ILED_MAX) % STEP_ILED_MAX;
+	return 0;
 }
 
 static const struct aw99706_dt_prop aw99706_dt_props[] = {
-- 
2.43.0


