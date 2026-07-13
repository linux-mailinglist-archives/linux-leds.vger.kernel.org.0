Return-Path: <linux-leds+bounces-9072-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +rb9ItdFVWpbmQAAu9opvQ
	(envelope-from <linux-leds+bounces-9072-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 22:08:55 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3DE74EF62
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 22:08:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="AHPK/yWp";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9072-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9072-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96A2F30393BD
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 20:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D7E34888F;
	Mon, 13 Jul 2026 20:08:52 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37823382F4
	for <linux-leds@vger.kernel.org>; Mon, 13 Jul 2026 20:08:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973332; cv=none; b=Tka1juvzgM2irW6ttMGKxZrsz1INRaX+QO3HSg0oC7cIIEzq1tQD6kgFL2e1PgtJZ46uC0cGB03OGk3X2Ih/YcHtOxWyPxoYfpTGy2T3POTRl7QCOwrVHFSl1Ljnb0yPWBAR8aEjuy+LX00aaTsIMERzMfFSoxaNS0zizeNNYeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973332; c=relaxed/simple;
	bh=LJE3g8X7w+egYkCP2rXaOfca3XP81M04fwSuY2MnR3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oDUM9ALuuDWIP9RSjQzVmOJbNEjJ2PoC19IyQVhYr9+5uNNB/QXpAR3S2Xgv3RSbalmWHnv2ArHpF+MGt2i5mYBnBGftFBJ5iig3ayY9IzqCJsGstNkNcNqqVFBgV1ATsX7PMG9MhCiG1fbcOM3AnbXiSFAINMGGhrpnwff4Ifs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHPK/yWp; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso879418a91.0
        for <linux-leds@vger.kernel.org>; Mon, 13 Jul 2026 13:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783973331; x=1784578131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=svkyQVAUK9Tk0TyurgUHC7rUmk29GdL4jMQcYPSE8LA=;
        b=AHPK/yWp4ZEFraQ4SMN4Jls+qSC7knAOmh8myQfVyk7DuMnnZ3HXNJtrPy80y46OFM
         viDnxPv9GaR8Yl7VNSQTrMAEnsY9EOuye8bao1J3rhTUu5cYmwJrYtQvSyY7YBMiNyEI
         TSM3723W9MdSdAPP0uthSF6hEy20Qh+rmZhR3uA4DQHocyUw5otWXH6MCjJww0DJLVqX
         DVTJQI52RER2Z6NGk7aLnc/JGWhBwUQYCvoPsZYag4Z93EGo3IQXL3jnkFUKPJAzztas
         KdhahToxE5bik7Yvpnvu/0cuUhEm5BzraIO303z6RV7RPNt0Vde++V5Ho43oY4yZ4URv
         XRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783973331; x=1784578131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svkyQVAUK9Tk0TyurgUHC7rUmk29GdL4jMQcYPSE8LA=;
        b=D5TKl0GOGbeJEcQP+Uop1Igk0sFnjbeGsZlFy4sJl1YOl5t0JVvYBYkOKKKlQ1LKHh
         KtUma9T8wL72hot1E8UqndcuJGpEGPStGSGkgim8P0NPE66w8XG3VOAzOCQg93Vo5Kiw
         Y7VajtnnNUyaOZE7rq9+UGcfy/eYhGjtQ7MuTNH3/GMJ619oEWNCiNHR6py6xIjqMD6N
         AOeUhRy0KRq3viA1+rDsfWHAWc9RpXp9VytkI0KqjXi/a12wG2Hevh3XpqNqTEcBKxWS
         ZHPH2kYG0Cx+CcKKHF2t4lZTcrTTp0maRN4W7BrfaN0tXT9i+phISzuZyRzj/FIlzxj2
         FD/g==
X-Forwarded-Encrypted: i=1; AHgh+Rppp3OYWN3kmGlSQgKErsZIna5Rj6cONW8AgFY0SIgGKZuRZcjq2wgEn7tIS9Py8RjyvSyC3gGiWl1h@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ulayv05PsH44CKovTRDbCiQb82zppOu3/KfSJnvYhqonwVaO
	s7KflvwKvlGiJ2in2oYv4Ts6N8ocrPDL321NC596WcftaXOr5nmDJexP
X-Gm-Gg: AfdE7ckHiRs90bC5t5pB7aHpyR0V+v9Y67ZtJQxVflb2QA4WIpBCCL7xwgVMUOPQ3+2
	sioeMjBEbQvwk+S2Qpdmnp4/AMAcpK51yTwfyDqpaGcS6qYMe+DRhYJWmd/MhnAcVCgXyDwSQZD
	pY2BSRcvuutX09XSEp+xBHlkbKzHkVIV0TpUaOSrtS5DNeIYrgBQDYAoBoZxU3qTcix3KtoE0ra
	oG+lu7XaGgZHv0n710OeH2A/2eddnfT1gUwMgEocpBrX/OF1Ys700jzF1FRLwJ21ZaIMCnSYlbX
	FHGYwOQDVqfSLpObMdN6JUkSqR/yx/0BBYoGjkn7vfHYPiOZjl10/xpwQzmWnE0QWjed+ajmsEz
	q9y9a17IvgabHdp2n/ogkKmL+Mb9d4NsBDOLc0CbiLNlTVrPrwYNNEyP/QCLsds3yWvJ5IEmEvt
	iJLHtc++uXpcVLdXg1NXVVN1ObP2YSGFokcaStInx+fxWymziZ88jZ1yc+gZIrH/azGAtdLMUPz
	6wqQBVmqYrOYvL+rJ5J3YDeuZ19
X-Received: by 2002:a17:90b:4c4c:b0:38e:dc4:3f64 with SMTP id 98e67ed59e1d1-38e0dc4412fmr2193622a91.38.1783973331046;
        Mon, 13 Jul 2026 13:08:51 -0700 (PDT)
Received: from fedora ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm68238202eec.4.2026.07.13.13.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 13:08:50 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com,
	kursad.oney@broadcom.com,
	florian.fainelli@broadcom.com,
	rafal@milecki.pl,
	linux@weissschuh.net,
	krzysztof.kozlowski@oss.qualcomm.com,
	tzungbi@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] leds: bcm63138: Use %pe to print pinctrl error instead of %ld
Date: Tue, 14 Jul 2026 01:37:32 +0530
Message-ID: <20260713200732.2470666-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,vger.kernel.org,lists.infradead.org,linuxfoundation.org,brighamcampbell.com,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-9072-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:william.zhang@broadcom.com,m:anand.gore@broadcom.com,m:kursad.oney@broadcom.com,m:florian.fainelli@broadcom.com,m:rafal@milecki.pl,m:linux@weissschuh.net,m:krzysztof.kozlowski@oss.qualcomm.com,m:tzungbi@kernel.org,m:bcm-kernel-feedback-list@broadcom.com,m:linux-leds@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:ninadnaik07@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ninadnaik07@gmail.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ninadnaik07@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA3DE74EF62

Pass the pinctrl error pointer directly to %pe to print the
symbolic error name.
Detected by Coccinelle. Tested by compiling.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 drivers/leds/blink/leds-bcm63138.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
index 45c0662df933..12b70ee31b9a 100644
--- a/drivers/leds/blink/leds-bcm63138.c
+++ b/drivers/leds/blink/leds-bcm63138.c
@@ -236,8 +236,8 @@ static void bcm63138_leds_create_led(struct bcm63138_leds *leds,
 
 	pinctrl = devm_pinctrl_get_select_default(led->cdev.dev);
 	if (IS_ERR(pinctrl) && PTR_ERR(pinctrl) != -ENODEV) {
-		dev_warn(led->cdev.dev, "Failed to select %pOF pinctrl: %ld\n",
-			 np, PTR_ERR(pinctrl));
+		dev_warn(led->cdev.dev, "Failed to select %pOF pinctrl: %pe\n",
+			 np, pinctrl);
 	}
 
 	bit = BIT(led->pin);
-- 
2.55.0


