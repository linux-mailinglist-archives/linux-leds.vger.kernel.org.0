Return-Path: <linux-leds+bounces-7872-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIYODl8d8GlYOgEAu9opvQ
	(envelope-from <linux-leds+bounces-7872-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 04:37:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9623947CD1B
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 04:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD42E3088BBE
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E563932EF;
	Tue, 28 Apr 2026 02:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHpV3t/O"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0712F3C22
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 02:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343679; cv=none; b=fIQCXWgWhBPc6ROwv80MwEzwM4sugoqeB4mbcRRcBNxVoVQaa0HREZIfqFcqSuQQ9E9DqeJXKHVuKIk0AJXc2SdMWVIYMhUcYlmzkmJY57Iyrp4QPKkfGx8r0bzxNXKwU5T9VqK4DnJOhMkga3g015HfWUSdZdizllgwMTCNZ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343679; c=relaxed/simple;
	bh=TxzwFKiJIPCCxZO7aT5q2yoHecnvGCv7WOi02z2Upck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQ79ptAc0wu7OHJHe1r45Ktvvmhc6uliXk4xoADZiUKyjGfla7ewcIgNGuF/VZGZ88tafW3XLC790YAhNE66W0078RY7Tm5HZGnAYYvAK85RV2PkJos99paCYLVgWRkd4Z50wwydkDzW8xFE9n2m4W9ZStl2W2Rkw6bYrDI+lmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHpV3t/O; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so2483851eec.0
        for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 19:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777343677; x=1777948477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKFYblaOebuDYFHP1LoH1feqnKOl1rhPiXqAnvBgFgk=;
        b=tHpV3t/OU5Cxf7ggLAG0a4Dgt/Pq6L8FO7fnmr8gMG5PcqMsDaUg+P7VOXxhKgiaeE
         o9j16f7bj9Rot7xjFMNoX5rtsCtlYxj+mPUyEhSZDlK20opxziGzs/0X+bWwmD8LuQmy
         M2RA1GDUrHbu7nKu54U2vt4/DF1w82HOyhQsd0XIx23JTsRAsXhzCnQTlDocwrTQCarP
         EDbPAiiiiSgPci/WwbypRSSY7ZWND0F7G11xHGiDIJo+SPnre6k5APgpS/uiA5fR3uCz
         c0GFYSzqPJXXLEeKEuXHAnQlsK/Ej6dX/Olypl/0DQrU2kSiD0J1pr7mhYYTzk2EHftG
         uWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777343677; x=1777948477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wKFYblaOebuDYFHP1LoH1feqnKOl1rhPiXqAnvBgFgk=;
        b=jJ82SYxPC+vxt6x7oJ2JeLcl5Pls3/zmcy00gH0c2B+VjhN5MDobwRTRJg8ePoIN02
         BjNszGgQ1KpXtI0IgcJTZgxtRtygez1OHLsGBBRTnl+UYldypm1DyW2RYOTd81VnybzE
         moAjoVys/QH8fGQ/5y0duho0W6LzvGWK4FU4sS64IKLBpjsS3SNOtYSjFNEFyhSYsJzL
         zbrz3OHPqLwo3Q3eGV6p9Z/FYtWKQFYy5q9xfbyYknqFBiWOWNMyJ/imn02mvz8eglRh
         Gzm+nl39ZYKsMYVjq2yqmFQLAi8s6L1gsCus3C5YwblVODTh+6Ru68fv7xy39bBPuqDo
         vUoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ljKKJf0lYzj50EYKxF4FyEfHImo+ogS5DiRXEiRQtRey1nazpupj8g3GZdBsk1vwrZoNZn0l+G3z8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2oeoGS5Ot07vUMvhoMSr3iokOvF32UBEa2DYEK8nyDWeaWLj7
	xxBe9lSVLXeIFKhL95zSGqoYv73Aa9KvDLW3pzV/6+eh1BqDKuYI+/vP
X-Gm-Gg: AeBDietaP5eJ+WHag08yKv/BwF4CWKjJnTRCoct4r4eheF4jNgUrNB9OGsRUUgNQwM6
	cguzjLZTd8e7DprIhoyLuL2qHV4TnZa7WZqeg3MLw1mw/s4A4Q9mni+DRgB6MesRUeScFEMRSyG
	lEhr/NMBSs5QTprZDRDfWQfc+WUuBhaBGG7fX2fScQzKnsjwf2KBfur55urNziN2IJFFpHTWy8/
	iRMS4TNNsg+69oiXIOuPc2UHBXAgflSEt7Vlwb6Odq6c4+3psZU/AN0TyvcRJdJczWJK0h8n4Zg
	nyWqaXHuzBbSW2uUCx/yAfDPnIk7lFvujV7yiG/lA9J+tdFEmAbrw+O65fZ2BRMgdm4mDqsTJfR
	3UmiyfaWFGjOVAABZdKpB9RwufpDuIz+VlT8w14SybkHk1rLTJoKajfNeSJZyxLAzwQzw3YCKHl
	TZUMPfmrghCRVaERIEJhiBPEwZqHbx+mw=
X-Received: by 2002:a05:693c:2c97:b0:2c8:7172:3b7b with SMTP id 5a478bee46e88-2ed0a0f0da4mr814244eec.18.1777343676781;
        Mon, 27 Apr 2026 19:34:36 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a13ebe6sm1088066eec.30.2026.04.27.19.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 19:34:36 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v2 5/5] leds: is31f132xx: Fix missing brightness_steps for is31f13236
Date: Tue, 28 Apr 2026 10:34:01 +0800
Message-ID: <20260428023401.330308-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428023401.330308-1-jerrysteve1101@gmail.com>
References: <20260428023401.330308-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9623947CD1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7872-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add missing brightness_steps for is31fl3236 to fix brightness control.

Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index d2be996dd4ea..5db7d91c6a34 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -487,6 +487,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
-- 
2.53.0


