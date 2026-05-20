Return-Path: <linux-leds+bounces-8218-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EkSAqS4DWpT2wUAu9opvQ
	(envelope-from <linux-leds+bounces-8218-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:35:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 903B058ED62
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10BE5302A555
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 13:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A30E2D97B8;
	Wed, 20 May 2026 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJG/56Ar"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13102E2F1F
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284062; cv=none; b=rxXt2mkzd61BOw1gthkEysmhvTUUf256wiSu1zLu7LMRdIpfD4YtzOdowK5Kk2IqzkXIKvcB72owaox4hbF8C/4Ix/p+U4ZKnAnS15Raowh4I7nm4U3ZFGsYg1dZK4L1f/R8cfeNrabDSig2AFkuwablnJfMd0ZxxmEPTLKxU6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284062; c=relaxed/simple;
	bh=V20CQxaKCMFh3UO3l2woC5YK6IhwIJ+mPrci8jkaja4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBFe7Aea34nbD91oxOyijCOrIG/jM4wkiBvBFWGynoTcVU1lKsN4roNVhz8drrP4EwGWVzgh56Dx1T1dF8SzSl1t5CvAtQc21/ni02pO0OD1iJZdfyARIApSsEPddRc8bbSg7ne7KI9lILH/gJJAtjTNEIMGtAerFCrzw+e1e2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJG/56Ar; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-439cae0dc81so1189800fac.1
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 06:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284060; x=1779888860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vk3iqdN+UkfzfR0h+0cGZ9R4uYD5TaU9pbTe8/5a41c=;
        b=MJG/56Ark1rf9sUPEG2IP6qmDZmbcEN9H6RWc6FpRkemxwD7L6rJ2ePhCCfTBe61rX
         dWwR2T/+Eg+tCOB7ZhbKP14Bueh3lThBLCdsvSx1NE0BPaiynOdA5YfwjguG7Pgm+gvO
         syILnX5jgUZKl6zWj23g6xhOa4c+7Uhjgv6yZkMvGP1nc8JxgbdlWClVX0ZWsnkA8JOe
         gwh5nZZ6SJSUwWk/1V1K0V5OLvaWqGkp9K7jK7KhnRkpOOUAlEVIrV87COsIRp/fPQfJ
         WPW5sKup2pP8Y+54lhqXhYplvirJekwUoctPxRJs/1UI+N7grczzrF5nCgY1RFsQdtO9
         FVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284060; x=1779888860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vk3iqdN+UkfzfR0h+0cGZ9R4uYD5TaU9pbTe8/5a41c=;
        b=mfm9YGHxfnSvsN68xfATiesjBYGjGebe0bxi444WUuG4+BZG4tVqLtjJ6Yju/kma+s
         hmSFKYSeIZ1G87Cn0RY6iNy8zi+2aCRzxhHYKOEJ093diLl5tYF2gCMNwWJjDlHSXH0p
         KVthsse421hJOEob95a46Q6aVuSts3iffebBwGzcRJ+mzRV9FvANJrv91xG8on9vDTXV
         bm8JQi/Bb/gUWqsOdw57Br2YEmSh8v8YkofmRzTcd120VKRwb5e6OZg0K7QImedo+vbg
         cc8E/axawJnAVUDHSa02sEhRBYdIvWAH20ha8FSaz8dN0FCBjR2i0TAhrCxiC5Sdjigy
         Q58A==
X-Forwarded-Encrypted: i=1; AFNElJ+gauGty5OExLoBYnKmjzERG3WCPfRHx6T+Qn24Cb3IpCtOhY/uz4niwGWsnN56Xrlpv2C+tAvs5Ikp@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqsuk4KUyQ1806FzypomVOMWvDyjncegtQncRBejmSS220CT5F
	3YLRGpBTszXpvj/EoyoVMQNQWZ0Rn8R1n7lWLBDvYrYb5PmaTwQwQEDp
X-Gm-Gg: Acq92OHCqhgEmE/qPRWVms2efZ5NBGrRu/nRGZbXYbQgIfHdbAaz2/Ub6fS9TyN3Y/w
	PKU0ljjrad11L/T0tw4c+JsVmFDLzUah3ii1NYMnpiAvJkuqHD0oh+qzp7P8GMPWv7O3I1SzyQT
	gxrEZ5higm3V+QziX2c1RgEGnO7t8q7HFGNuBIw59hTs4a2uMyVDOJ3C19ZWgNcZcB6NVN7Ij4w
	2ZEN9/CU395uks6WEpJOeGv/DyfdJAavMo3V4HKSQsJDNT83qKhrjrhy5DMOGVHaN7RHxz+gYAX
	vJbDdVY42zSS/OdL1xfyFILgMS30Hc/NKErCJBD0GK2mD/rHO9ioiC1WN3j3xXcrBloGqD/lOCd
	bNrXNUjyqC1nrxvQyFPUM9Ro7Apo3tOkVnADCBgWAEmZHUWKtUWYE/1bUsk72BxVTg9cnU2TfuJ
	Z9udZld1QcafPgTX3s8E6ntQReCZN8UVioQU6mF1k=
X-Received: by 2002:a05:6870:e86:b0:430:b7d:f248 with SMTP id 586e51a60fabf-43a2dd7c363mr15635339fac.24.1779284059756;
        Wed, 20 May 2026 06:34:19 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a956fa075sm10253951fac.10.2026.05.20.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:34:19 -0700 (PDT)
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
Subject: [PATCH v6 5/6] leds: is31fl32xx: Fix missing brightness_steps for is31fl3236
Date: Wed, 20 May 2026 21:33:42 +0800
Message-ID: <20260520133343.1423946-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
References: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8218-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 903B058ED62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing brightness_steps for is31fl3236 to fix brightness control.

Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index b5207ad6ae96..5678c2273bbd 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -491,6 +491,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
-- 
2.54.0


