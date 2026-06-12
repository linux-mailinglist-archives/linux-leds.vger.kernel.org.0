Return-Path: <linux-leds+bounces-8584-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sAyxKztpLGpJQgQAu9opvQ
	(envelope-from <linux-leds+bounces-8584-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 22:16:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EA767C407
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 22:16:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jeXH64fm;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8584-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8584-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B4413054CC8
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 20:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5763B83E0;
	Fri, 12 Jun 2026 20:16:57 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E2E3B0AED
	for <linux-leds@vger.kernel.org>; Fri, 12 Jun 2026 20:16:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781295417; cv=none; b=LthWDiEZ4myG6n8E3FjGO9L7Dmd1WxTHZiWPFWK5PpqCi9TXFxzJ9Ejjd2O8+S9oiztPugpsFqo14BWDfV6Gp24W+y5g4z+2QvL4MLwQNZxlVtQIbyBCpe/Vqsod2AK//xD7kpiNzzI0SysIZK4inoKq0gYGq94mlVhDpJO7Jf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781295417; c=relaxed/simple;
	bh=Lqta/+TCAlU+KQiORLUZ7AwCWTzNKVq7JoXzTXVhstM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=drnJbhuVnZbAhoV/DEP8CL4BJbzuTM8p1/t57Tj34qCFEJKHVCqZX66jeH8tc0nGr62evJz1gobQEfkGbGAf0sYis3beOSlmC2mwi91ZY300nXa3Yfl4FKtB6Uvi7+FPhvwVcJ9PKnDO5/n/UzY5+kEsISho/PLR8xgzjJ67G/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeXH64fm; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490ac357c55so12681495e9.1
        for <linux-leds@vger.kernel.org>; Fri, 12 Jun 2026 13:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781295414; x=1781900214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1hhKOxDrDpBPPiZ/spcJOPLo0Mt9S9ZNTQUBBZDwMv0=;
        b=jeXH64fmvBOUWVnyQVCAJl01JFPr1Hhx/9S3Cwn3TZdIIXhhe/bXXoOY2LhMw0Q0ey
         pjYxJhcMWBHBs/HslFXGeOUditwsCWX+djiHY+b/36lcmERoGhXUzCRHaXTXFKaxBpYN
         PeV4aIa7gsRJ+mYAqABOLVexxIhSnXny5cZOFn3+q2K0myql2Q2EPeKssjHYGIfFH0DH
         vtyUf7ln+KFfHgSX07a5xT6v+vN7RtAkBpwqSNp1EBKEDQm6VjQTckm3cKaVFTkYIZa9
         dCCa/aBrCm+LOhMsuPlaS4VXYxAeAvIm/2bNxjIDojAqCEkvlJ5czfbSdkee3XzhJu06
         vn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781295414; x=1781900214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hhKOxDrDpBPPiZ/spcJOPLo0Mt9S9ZNTQUBBZDwMv0=;
        b=DySVVKv2UN6EuP/A2t0dz+EbsAEjtRaxrEfiVbx4kbN+VerguroeFpE7PSpLyBMAxX
         0jnd2AyJroVLtznwVIIW1W4MGd3IHcUybEYwQvFEmY6/Y/jRrDUm8plXN2unG+4/Q7E/
         xd+K0kexTznRtCKz8zr4d1llqPgX2H+skze3UVf7JkPYTTUObEipGYYEafHsg/4W5HmG
         cv6f7F5GlLBbsPgYUfC//t65OjjNDpvo9kpBDL95lGzpJeaOFIiZ59mSrzd+fHLWAyIP
         a07p9hVvlAUU16kaF2M2AHaL2FnJusTiSUXXrAG72B+Ezju8SgKIYT/3xAx8+Qmgs9aI
         V8Xw==
X-Forwarded-Encrypted: i=1; AFNElJ9IPYd3UGUjM+31Q9qKSUU/Bg0bHdbOSGQh1U4WDeLsDz4VMtootp85FCG9d20+kXYdc2Ys0PDZ+70e@vger.kernel.org
X-Gm-Message-State: AOJu0YwCpEJoum2Qeu7u0GIgD7JhHy3VKw9TdtJHOZTw1Ntq55A6Jvly
	ybWrPc0bm9jqIMsEfCeLj2/RkP4X+jWcayMLcahYwngUgdccG80u5eTc
X-Gm-Gg: Acq92OEFnQ7UAzjrqsDq2YVJUQe7u/nDpxqdTdBD3msZ97TZA0Zz+ZFjU8DBNYppzZB
	KS3VboDRwZuAf8ce5dHIdNFh2OLDcHhvRYMCzeXyOFyPazs+YuDlNvKBRzx0pNQvPI2im4alzxL
	m0hGuKC+f2DMq6mW9Wg1nNhAwGAc6iRwATNh/4ytvvNSXujGigwhc/llNwshG8xf0EJzIOmvarv
	Mp2gz8Xql0W1+rciE1ADmm41z/p55MHJYB4wva/NtjbdOYNyYEqfaYoT1p7d7lAcyYZ0UKj/xIw
	BFzWBa1qrwwEzYHuhcqzdI25S6vFsFqbt8hy8+LCXUW1RtPOZeC27iLeWPmrmROqcMUSgUt/KxN
	Ar/7b0gIdJeacJT4s5M80l8t/3Di/vSyd1exC/gw25AFJDXeWSfDOqSlhuVVSQ3rnsgRPjgKMFg
	gSpbKZ1TSG54Uu22Od9YZN6PppPbdPViEuvK+ccf1wOYW6n+3Ic/PBOoJg/tBGrNale6rRpXzkh
	nN/ICOPK1Csy25ounkTjNkFxsNmqg==
X-Received: by 2002:a05:600c:820c:b0:490:5cd8:d213 with SMTP id 5b1f17b1804b1-490ec4d3407mr55575625e9.15.1781295413834;
        Fri, 12 Jun 2026 13:16:53 -0700 (PDT)
Received: from workstation.speedport.ip (p200300d507395ea0832fc1eee9dc144a.dip0.t-ipconnect.de. [2003:d5:739:5ea0:832f:c1ee:e9dc:144a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26393asm8925902f8f.5.2026.06.12.13.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:16:53 -0700 (PDT)
From: Mert Seftali <mertsftl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	Dan Carpenter <error27@gmail.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mert Seftali <mertsftl@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] leds: lp5860: Return an error for an out-of-range 'reg' property
Date: Fri, 12 Jun 2026 22:16:37 +0200
Message-ID: <20260612201637.197608-1-mertsftl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,vger.kernel.org,intel.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8584-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:s.trumtrar@pengutronix.de,m:error27@gmail.com,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mertsftl@gmail.com,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25EA767C407

When fwnode_property_read_u32() succeeds but the channel number exceeds
LP5860_MAX_LED, ret is 0. The error path then passes 0 to dev_err_probe()
and returns 0, so an out-of-range "reg" value is silently treated as
success instead of being rejected.

Set ret to -EINVAL in that case so the invalid channel is reported and
propagated as an error.

Fixes: 3daf2c4ef82b ("leds: Add support for TI LP5860 LED driver chip")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202605210624.3gcr3prk-lkp@intel.com/
Signed-off-by: Mert Seftali <mertsftl@gmail.com>
---
 drivers/leds/rgb/leds-lp5860-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
index fd0e2f6e6e0f..9eeb01b3e56a 100644
--- a/drivers/leds/rgb/leds-lp5860-core.c
+++ b/drivers/leds/rgb/leds-lp5860-core.c
@@ -115,6 +115,8 @@ static int lp5860_iterate_subleds(struct lp5860_led *led, struct led_init_data *
 
 		ret = fwnode_property_read_u32(led_node, "reg", &channel);
 		if (ret < 0 || channel > LP5860_MAX_LED) {
+			if (ret >= 0)
+				ret = -EINVAL;
 			dev_err_probe(led->chip->dev, ret,
 				      "%pfwP: 'reg' property is missing. Skipping.\n", led_node);
 			fwnode_handle_put(led_node);
-- 
2.54.0


