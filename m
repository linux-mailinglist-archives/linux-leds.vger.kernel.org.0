Return-Path: <linux-leds+bounces-7416-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BpIOjCewGnrJAQAu9opvQ
	(envelope-from <linux-leds+bounces-7416-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:58:08 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D072EBBAD
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFE9C30420AA
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 01:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDFE223DCE;
	Mon, 23 Mar 2026 01:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqZ8DMpb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8B8226863
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 01:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230893; cv=none; b=pCu/3OQZ0jPMU5QuXKvV3cFJBt6aqvQhF8UEx/37U69njEOsr84w+vCG70YMc7AQl5Irp7vab09MwaBzYRuByZsOwAJ5gn8pUZe/4imDxcbORo346bnUELqXfMXVpH7HaeAIGJ6GHLQSpzyF873rSwe04bPFukF8Hwhdbm5XLWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230893; c=relaxed/simple;
	bh=RqL0mTRKkF4hWJurWBewRbPofeTnIMHQam2gd97mUZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TRQy1l50EBJk58/7ZtQMimj9k1QZUm8FjKsDBEt+WiSVA+nQjqIMs1N4HJjI02JTaykMsLHJNbQjthcLOkQUE/PumaXsuKk9635K2PHJjG/G1rLKmkYgny+RL46/3iMVNoGy8fGqMmXltsm6K9a8sd1kAe7icMh4QJVgiqEICp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqZ8DMpb; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c107ef474fso4398380eec.0
        for <linux-leds@vger.kernel.org>; Sun, 22 Mar 2026 18:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230889; x=1774835689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQXLY86FxuKQON46KYMFrgiDaURA8SjvslLPqZRssqU=;
        b=RqZ8DMpbb0X5i5GNOEDtrcW3mRPokgfUOj+UjicWP2+P9aSKtHV1EpNICz9hjPr3Tk
         iyi/IWrJ25Koh2vjxA4VysTebsPVDPyB6DW24mihHcF+yHhq/fg74y722ODqj3RxrMjm
         jc/+N41+4+VXaukA/ZQCtSesjuB/buuj4RkpKh0OzAGpfP3Yx9FrbLdcRngwsAjQwii9
         w9+Urz5kDN9jJaQ1Zdugxr+oqbhvVwRH49BQLayYGY7Uk/8XpnbFdU5dJ2A7o8k8HdWZ
         m6vETI6scTyc4cZoUQRltOG4+c73fsDqQwQFt/ZXfL7ugewKbGA7Erx51Ta3jzkyaAME
         2Yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230889; x=1774835689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xQXLY86FxuKQON46KYMFrgiDaURA8SjvslLPqZRssqU=;
        b=Ckfg6THNuI9pIchU/GpaRZAkr76SOWda0kTvsLOxW8fzRTno4UVn7tC8enlxgtsKFL
         iFsefwIKWKlRIo7XuOvOHg0/4HA+dFkE/0yx2W1Z9/cHrpbEV8xXxfaGzoOIRRUYVV30
         o+NvDO+lCn923Q7y+TQD2ld6y/KJDt5f3l7A3gUhavBiyea5A/SkMXStZvH7aThgJ6Ro
         66akxty8JthPVe5a+T9iKiGZ4X6phxiu3HUH1ghkZS5M8O0UGPC0iwK9vjLJoLY0SELj
         U0znEgqE3Q//pDbpvJcypnT0HXbR7Asoo/TnCmUj/sT2fOeLRFxtaGy0aPC3Qu5FZpgU
         dGTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEVehSfDn+Ib2bQRTFPH0pSKJcgie3mGoUpfF/N8jgHWEuLFPUVXg91pnjMydDWDCJsiHRdNVHW2CT@vger.kernel.org
X-Gm-Message-State: AOJu0YwfCW2pQUbyy9ZacFwL65R7r+FXwQO3DQSLspK4rUrWFR7/zKFc
	0tSeY0aAvHYf5fFzFiQzLxeiTfpHG0xCQCN8KO87RjgSmFMQ6uNcPD8b
X-Gm-Gg: ATEYQzw9ulHeroruXCJSBZZ7AlOLG3O4tPwSv77k1DkYKUZ69UfKWQD8RQHm7Oqlpqh
	GhBVt6jS3Jd4EYRCMbe7LlQjV0UQ16oWOJx0zeGitJqemW03ExV5eMXrTP7Ji2mGnWShchyqJIJ
	Kkop1xssPCYHQiHRSE3s6d99IupXHULJDGbnLhMocUDtqsZ4cYuCQeNjcVSt3vjvEb6iho8Q1I4
	CKVFI5sqs6PviS3uiBtd1i7KrtBHKqrZ3wgwNvuAAUSfFq7XIemsFFBEE2JYXF24BNYy6+CsSd8
	qd0oQrSCkFFDorgjNJdzTZqQUuuPePy+N+lMmBSB+bGKOj6FlC4hllNs/QMjDKWl6n4qEJyozoO
	yKpUwrB8GLSLMcbZQQwcDFTq8kQScTcGYszz9GK4WonDmwL8fK+igKcbpms/Fr5XX1kNwMhONc9
	GGNL7OR9jZgssdDoYM2Z5KGZAy0bdQoC7pKOr+WqkOQC32CJua8KNF0cPYxj7RN31PegMdp7kkR
	Obybx47v91ZT4o=
X-Received: by 2002:a05:7300:572a:b0:2c0:bd6f:42a3 with SMTP id 5a478bee46e88-2c10974f0d6mr5302324eec.22.1774230888985;
        Sun, 22 Mar 2026 18:54:48 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH 05/10] leds: led-class: switch to using class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:23 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-5-b72eb22a1215@gmail.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a6826
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7416-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95D072EBBAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation to class_find_device_by_of_node() going away switch to
using class_find_device_by_fwnode().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/leds/led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index d34a19453560..8d7ec9ccb173 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -273,7 +273,7 @@ static struct led_classdev *of_led_get(struct device_node *np, int index,
 	if (!led_node)
 		return ERR_PTR(-ENOENT);
 
-	led_dev = class_find_device_by_of_node(&leds_class, led_node);
+	led_dev = class_find_device_by_fwnode(&leds_class, of_fwnode_handle(led_node));
 	of_node_put(led_node);
 
 	return led_module_get(led_dev);

-- 
2.53.0.959.g497ff81fa9-goog


