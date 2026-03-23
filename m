Return-Path: <linux-leds+bounces-7420-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJAMEaGewGnrJAQAu9opvQ
	(envelope-from <linux-leds+bounces-7420-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 03:00:01 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BDF2EBC34
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 03:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A1BE3053E12
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 01:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A78D227B94;
	Mon, 23 Mar 2026 01:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4v770mx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE557222565
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 01:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230901; cv=none; b=LMMV0MFOUEgOmj8TM37BGNgj5I2D5+puRnsdaJ4GmHQgUeLVrlZBIer2KGBArFfrsnNNfiuS3CPClThT6W0UKh7xjCvaHbnZLP7BxnthjpHI6tCjYFNhWbWgp2jgYP9bRzMQz/JNkLBOOB5wPuybLaeNWG5/vCNr8Q3GuZmDK7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230901; c=relaxed/simple;
	bh=1sqhnylLI7gkJzELxLCPnxHxDOb4FadriLVIc1k6lys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o7GNQaR490Oo1UnjQvdP6Wq9QDYhjMCpdEEKn35a9fDnKHLBIfEoljOEM31X6Hh4BHXhIjy98nkjftUR8FiEOTiP4uWq1Rr5N8VZh2JAW6+jZYs4VWhB5ckpqIyYyqUwXX6rtEc1EXuHdOlW9sJo0FE7pGSEOgppJLGI63gZpVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4v770mx; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c1092cc08cso1024486eec.1
        for <linux-leds@vger.kernel.org>; Sun, 22 Mar 2026 18:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230897; x=1774835697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV33ceOiC1VxLFfbHMOp1tzZ4L73tAWczcXKydNsu3s=;
        b=i4v770mxNtlkmshGGyiFSKID4u7qwSzVxZ0aHffRAJqTLaK3xUBJB3uw1gjfnb+ELV
         jy2p9XKszW+G7miQ9O/XnTDUWHl536kvNqF6+l8r9HC6oW1Llre/Lfxuy0aMH/uWZohU
         ZKbrdLlQmvSYrWK7Hj3O2I/CQN45iUQeUHEgO/TR2Ww7P7sSJcsAZg82Gd2QE11SVta9
         yB7gvu93oYeBxMwn1r7Kzvz79f7lNSQlkI3AVVzX/AC/3Hugvd2RS8KEUkpof+TAl5WB
         hMISvVs092UW7y56xc/AF/B17M+zYubYC0BRHR1fYc/GIuiV1tZ0poj18g0XCpyLjYDG
         T+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230897; x=1774835697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JV33ceOiC1VxLFfbHMOp1tzZ4L73tAWczcXKydNsu3s=;
        b=LEfewSi9unJ4KzQjVF/SQFXSRFY39P9cmiSm+ormmXAbUXQgpiaysGwfMNAb/SKUbg
         g7m46sSESHI6LNS1wSAogBhg5ijkN6ZgcCqThhqMNGsWrFxdhEJEAs/TJFOLAVw7KKNS
         gCHd5oom3x1r6HcvjYcEJ/Y/4XazHLcywsQ2Xn02Ob6OGdFIteSQw1EoGtz3s3S39l5g
         mw/x/3zHrbkVm9XnHz6PCiM8jOKC2dQVOLujDB8ikfO2FuE6V8TUL7VrBTfEBLGc8a9K
         rAQ04mMHyjUPkJu3vQ3VNJfMl04v0TLbkUT4W9sFE4pCVPyYfAdin5qyhphssTK0H5Qn
         BRWg==
X-Forwarded-Encrypted: i=1; AJvYcCWrTecK9UFrxHC/7XmpJuwEi8piL4c02A8z7AMcuXQ4kWN1musu5WqGe45IHqGTcH+Sd20BHrCFI59Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxIyydjYb7bFYTOMSCTlvTrqy7z0o+Jf0fYGvkNwG8pM7f5jhpx
	wd5lZaRUxvaErALDWW/YOFdjl8JdB/ou8uDDRVfvUkFK+0HE6Ig8fXcS
X-Gm-Gg: ATEYQzw5OUnaBo8kyXQluI4TA1rdSzAf0QivLLqp47qakZ3CEvaWKiAvi9Bo4ElJp6s
	i5zmfeK2pskLouHbNbBR4UqdSu7+iAQilUUBqmeDad2/3lcs2EvsXqs/3nT0BA+8Imntm8zIg/4
	aKhcioHT3vvIHbaqoQ3p68aQBJKhZoOW/HOcf4ROt0YCG/8YdG6m5yq/Q7qKWWdi+kzkajWI8Zl
	YsfDC67g0Y1WpJcb1DuQJ+hb1fCsiLu84iFebcMOEXnu6NtdfmBFitTFAstJmokXFvR0mAPVBUQ
	HUjTX9NZy1U4VPY0pdRmjIvLuiRC0NMmE3KWDmBc+FJHNXSFT/GL+CazDUsUEgJmIqUeahVs0PZ
	6SGNH79B3M62xWHemix2kLLBPFW0ZKHp2JKT7HfMW61uTk3IZd+PJRDSg48m4GW2973cLUjgP7o
	Z2IH0z/48B9lrMy7HsAFbuz1jXCdpkcyZ9YMkvRP7iuBILd+gq4ZgdQkKnLT+AdiAy2bkh3oS6S
	hbkS+fTf0HeXqU=
X-Received: by 2002:a05:7300:e2cc:b0:2c1:27c:75a6 with SMTP id 5a478bee46e88-2c1095fbaa9mr4810786eec.10.1774230897161;
        Sun, 22 Mar 2026 18:54:57 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:56 -0700 (PDT)
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
Subject: [PATCH 08/10] fpga: bridge: switch to using class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:26 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-8-b72eb22a1215@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7420-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D8BDF2EBC34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation to class_find_device_by_of_node() going away switch to
using class_find_device_by_fwnode().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/fpga/fpga-bridge.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/fpga/fpga-bridge.c b/drivers/fpga/fpga-bridge.c
index 8c275bd48a0d..3e04bb4341c7 100644
--- a/drivers/fpga/fpga-bridge.c
+++ b/drivers/fpga/fpga-bridge.c
@@ -9,6 +9,7 @@
 #include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -94,7 +95,8 @@ struct fpga_bridge *of_fpga_bridge_get(struct device_node *np,
 	struct fpga_bridge *bridge;
 	struct device *bridge_dev;
 
-	bridge_dev = class_find_device_by_of_node(&fpga_bridge_class, np);
+	bridge_dev = class_find_device_by_fwnode(&fpga_bridge_class,
+						 of_fwnode_handle(np));
 	if (!bridge_dev)
 		return ERR_PTR(-ENODEV);
 

-- 
2.53.0.959.g497ff81fa9-goog


