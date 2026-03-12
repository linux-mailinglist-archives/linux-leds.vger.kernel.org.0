Return-Path: <linux-leds+bounces-7318-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN3FH4wss2ksSwAAu9opvQ
	(envelope-from <linux-leds+bounces-7318-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 22:13:48 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCD7279D14
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 22:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 684E830DA1D8
	for <lists+linux-leds@lfdr.de>; Thu, 12 Mar 2026 21:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5080B3B0AC3;
	Thu, 12 Mar 2026 21:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6KISB4Z"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5863815D7
	for <linux-leds@vger.kernel.org>; Thu, 12 Mar 2026 21:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349824; cv=none; b=OZqnIgungVNll8zpRW23vCYMchoaeHqH7nHgmT1jSkQvBSUY/AFXX0GDY7bZziBWsjzhM//K5xIkNT37S0u9cqsrQ2Kgr/sqkmHAk/ZzOK4BAQhybIvdZ9tUEVsqP+Ujf0J2HgSKfshG5+M+4GzgsCDs1yTaugk8id/rJre7czI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349824; c=relaxed/simple;
	bh=Gjqp+IRNOci257Bhv1yb5v7bX0BkhfLlTlIbUhYgpqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tgk/vHeQVpIq3tcSxyM6PZBlddzE+qrop/BHJHy3uQh/Xtx7vPIK+mIEypEyNo+xzGoxEQylL/8HQG8lSHoXrEiHRkTaJMbqET1NSTaQ/4ULsi2h7i/btBb0a91i/VXtgl+g8igta1ZAF7Q4CznL5fY5YlJRkedQFiV5gqYwGWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6KISB4Z; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6611e4aefdcso2243438a12.3
        for <linux-leds@vger.kernel.org>; Thu, 12 Mar 2026 14:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773349813; x=1773954613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bGtE8PbC+OuFdWbVXqlfqFIXmM9T9hzKxtnfSlEsJyc=;
        b=c6KISB4Zsimao7Zz3i+x+rtY9BPtk23RAvM91RqzIql+Na7kXluMVDPPYkk9v7iQ4e
         vGS6lPxogyb0YHztMO7ud6FTXdF9o0Tkuj5nHQXDUobvDeD0IfmsZfDVWWZmqGCl/D3r
         oA6bteMp/lMWOcN1o4VeV1Nlv4NJW9vGJjPU/q+VmISX0dSDn7R0/9HDTLZjqSMyfsIB
         3Q4qmnO6WrDODmxFcaM248tiRUVnX6eGj01i/+K7+F7dPc64XDRSruQ60dPqJCCOMZd/
         QgRbo1ZZgdbGiObKIkomw1Ro8AjIhVQ0EQBW4Ff7/K96Jr36wn8Z1olHI8fjwXB5y/4X
         2H1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773349813; x=1773954613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGtE8PbC+OuFdWbVXqlfqFIXmM9T9hzKxtnfSlEsJyc=;
        b=QZxWsq82H7Lhqkz3IZcNPuJ3GoE+7MC6a4hkOm+HnNAZi868AgUq56W+esT8Ltzs4d
         E+dHR99IPWx0xFu1WFEzIv9aveflNEpQ4AH/cqLLNgN3kA4N1XaVX+p0d+f/Zd/ZMaii
         wk5m7Wn9cjyVuaf3w7JKW+bH85Bm2je8RlUDGDW5ruvzKncWMFUNoVNEWliI7Qe1M1Gl
         wIs9fojIz22IO5q3T2HYHPfRvIh+3aO+Y1jqpDiGypFlbIP+osaNe/V94qmCleuz1KhE
         PCjVwA2Fue9hlrJ5l/MOEAgZD1Wgwrh+Nokk3wX+YqD8xhwsfQh72JHiRYN9A0cO+yKL
         w1vQ==
X-Forwarded-Encrypted: i=1; AJvYcCURB4VZApibDkvX+KaNYwOKy2WN4YnUeQV7YkGc8kTDi/xAdRkbDliaF+ZZQCjzu6wUr9iNEY96pQ58@vger.kernel.org
X-Gm-Message-State: AOJu0YxOVKiyjU18smiylbLJ9YKkLeugw8nBIBHG0ym7O54q5JEwGW+I
	z9LSqcIrQBOaz1y1Le0kuQAPv5n/0XEG5S4BZFEVrsuL3yvC0GAxAV19BZ3/rdo7
X-Gm-Gg: ATEYQzzhiUzDDmZokQ36DM1OlUqPcSLjV7jtDarygSY5nLPcAPh9eA1iiYDmJl2+N2s
	XqTNxCi6m3k0lYbRwYsEU6db2zGKYSqfvzOs8kxnuy6jEyF+APs0R6+ivAsh23aUMgoMVte9T4W
	MzzXuiCLtNg9GWsZNXqJMPB7MmZnFhYIxUo1g1lHGT0EroydAXjUXW3Kf0gnChat5RMHy1LVHLf
	AOw+quwHvO/JbJozSG2XRJNjh7SNVt/eGA2rz9Cak7giEd0HGmZVohHSdRoVCgqpMgmMRahPoEq
	TGBCXWK7PGHWGKZ68QUBD8GtMRYvU+Z9EWFKuBD9SL0IBVEhIzeoDcpJVmYkoPd+cFH3vNeHarF
	k5SLdkwRcaz8ssoKDOrkR/tqq0XJOwuoCFAp+MmC1oMcPsjOOxexTRpn/liOMpH3xAev24BVTh7
	XINe7GO4L0AUcXuGCht/y9px6xQwlBshJfKlx4FvRObtX9jcQFkTp+4/dWDdUhpg==
X-Received: by 2002:a05:6402:3642:b0:660:f443:379a with SMTP id 4fb4d7f45d1cf-663babf5c95mr396882a12.15.1773349812650;
        Thu, 12 Mar 2026 14:10:12 -0700 (PDT)
Received: from X570.shire (p54a776f7.dip0.t-ipconnect.de. [84.167.118.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fdb666dsm817285a12.10.2026.03.12.14.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:10:12 -0700 (PDT)
From: Lukas Kraft <rebootrequired42@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org
Cc: Lukas Kraft <rebootrequired42@gmail.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: lgm-sso: Fix typo in macro for src offset
Date: Thu, 12 Mar 2026 22:09:52 +0100
Message-ID: <20260312210958.48467-1-rebootrequired42@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-7318-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rebootrequired42@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: DBCD7279D14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace unused argument pinc with used argument pin.

Signed-off-by: Lukas Kraft <rebootrequired42@gmail.com>
---
 drivers/leds/blink/leds-lgm-sso.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index 8923d2df4704..99cfb8c1bb3f 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -25,7 +25,7 @@
 #define LED_BLINK_H8_0			0x0
 #define LED_BLINK_H8_1			0x4
 #define GET_FREQ_OFFSET(pin, src)	(((pin) * 6) + ((src) * 2))
-#define GET_SRC_OFFSET(pinc)		(((pin) * 6) + 4)
+#define GET_SRC_OFFSET(pin) 		(((pin) * 6) + 4)
 
 #define DUTY_CYCLE(x)			(0x8 + ((x) * 4))
 #define SSO_CON0			0x2B0
-- 
2.51.0


