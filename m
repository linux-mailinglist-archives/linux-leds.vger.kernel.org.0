Return-Path: <linux-leds+bounces-7417-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI5DKDCewGk0JQQAu9opvQ
	(envelope-from <linux-leds+bounces-7417-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:58:08 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B37C2EBBAC
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA88E304208B
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 01:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD5B222590;
	Mon, 23 Mar 2026 01:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuH0ewt6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E213D21CC71
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 01:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230893; cv=none; b=ekqBAdND7C3GNK21I8tz3atJfPIuIvw2Rx32b9XFOYDv1YgQLt1w/b4GM1y1+LfYEWuELDwEoadK0l4PQAlX1gkv3OrTgO+IkpR+QFi8SVrSr3Kdilg3oltkm2X+HVkRohY2xHH/8NzlTcMVcVXF5TkudHa0WTz+Dr5CaY2s5UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230893; c=relaxed/simple;
	bh=xYIn8ABDkpyr0YTUtgQcAiZf9GrzpDD84nxgrE/YbUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gRXKFz09yMpjQWm+AUQytHYQ08eC+uKDWFCZ3/+ry/qWbakLY+cOO3pVMG3Ou+gJb6sAo1mvdH45uF5QfP6dbDaEcNuSmf5IiIiUXNoLlZ98DhWtMr0ro6QSrUATw62e+60RyEG61ekn7WN3hYJCrC9OOHfb0GcWeX9FLB3i8h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuH0ewt6; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c0e3a2605fso652889eec.0
        for <linux-leds@vger.kernel.org>; Sun, 22 Mar 2026 18:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230886; x=1774835686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAxXxv6aPc5DTLbEJ2x2im/U0EJHM/Tk3mhYybeVkPQ=;
        b=UuH0ewt6j9doYzRgftaipYEooiTTIkDnwEeL664oX3BBapBISM72bytNNZxMAa4h0v
         smKp+BAMqQWX3Sb+cN3IAx1jyosIzqncLh5td1Q9uOwjBJ90T/rjLttujrT8V1XKlDT0
         uvj2KTy0eGCzCSWlgmzXzSDF+9XDCFr/2FkOqoaayc4xcFv4J3c/r6gV3IwQ5PSTV09M
         pbS+v333WMk01T3Xzm62pIMmp8j1NPCA1fQyT5heASGjKBHsP7b7Hp/aKiugs8PBmfqy
         OkFLzXNcpf8kU0KlAgEoMS1MJ7X8wAWB1uQWR69fdgcEdV3a96R/zx2MHWpHqimVjv5O
         EPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230886; x=1774835686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HAxXxv6aPc5DTLbEJ2x2im/U0EJHM/Tk3mhYybeVkPQ=;
        b=hG/LbGIht2JqpOWOwAkNouI57WV/Mww+qGpDEW1t7mCRYbR/aA4Ge4Fw0BdDji+JXz
         J/weuvSooI3RRijssYNYqgNqzfbPGFK1MksIOBcIZ/0octU2Qip6V7pUaOUm4cTJDEh2
         lMMZ/KeI4b1aI+2fzeXIIZAWRxAqA1P0zNUgaVsjtyWRbKZ1Cfn3JbX2cltHw804DGvA
         V6UHimwTylgvUf7IcUmcjrwI9tsm7DJ+AzeT9uh9oh0B9wfmtPdC5RTeO5DSyKOQUK3A
         827/QYNrpKJN+GmlrYq+yd5NEl1AcBO0l2AEocqALy6reoZOmkZbscACbtB4WlVUDepB
         sU2w==
X-Forwarded-Encrypted: i=1; AJvYcCXbUcpqtO28gOGRLQdG7aE3DXYi57WL0jrjypWSaiP1xmvW17sZNBw/DsSyaDvUiaWSx5IhyDPd8u7E@vger.kernel.org
X-Gm-Message-State: AOJu0YyjLshP80T6q9sLuAgRLWFGaSF8B2DfDaHyNAlLuaVl2UMuj7jX
	vaxOyeL6hTZvN2caUeLQaahzKDzwJLwV0IbOl+zdGTzFeT8uHuNOhfoh
X-Gm-Gg: ATEYQzx/Mw/ThDcex8BSj0wmv/jMlXxKuFTUJoAaU5B/JzbCPU3pJN98msi52RQC6f0
	vmsFPLBqr7Xq3pFNNbnJqlIv4t6jkjOUoo3t6HVkWte2xpKk9QfUD27kcdqzJ74v1fvcBjVbapT
	TGj5Cm8jsBOYikdkiuucU6NaQItNB45SSmA9HzYhUz+2fa503jYzOd0V9h84XUhUGCpqkZ7di3j
	mf/tchZamnKZZhJ88qdS+d1KVbDgeOjOrEmoTiLE69BwwyMbbKVDSgqpq27vZ6BmoOjmpNxIhIj
	E9OoYwWcof9dgX3pcBUY0nayhZQiT7Eo4EOglyOYiu8xOvFCAkkCZWaKGCQ0T9r1ml0nLTcgQRV
	mV9IcH6iRw1ilAOLnGc90eHb6PlP0/5ppbrMrTURpNG6n4jaXs5Xygxh9VhkXzbERwa94z8p0T8
	tMcTP0HhV8S0wJAgPenZQRCvIRx0R30gloo4puwYp4zLcDTBEvU2FEth82c+dwMhxwFB3I3+Vqo
	mMPgl6w/LsYF0RShm1oUQ/E0A==
X-Received: by 2002:a05:7301:3f07:b0:2b8:30b8:58cf with SMTP id 5a478bee46e88-2c1095f867cmr4580068eec.8.1774230885998;
        Sun, 22 Mar 2026 18:54:45 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:45 -0700 (PDT)
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
Subject: [PATCH 04/10] regulator: of: switch to using class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:22 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-7417-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: 4B37C2EBBAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation to class_find_device_by_of_node() going away switch to
using class_find_device_by_fwnode().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/regulator/of_regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index c0cc6cc0afd8..43ec0845c940 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -637,7 +637,7 @@ static struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
 {
 	struct device *dev;
 
-	dev = class_find_device_by_of_node(&regulator_class, np);
+	dev = class_find_device_by_fwnode(&regulator_class, of_fwnode_handle(np));
 
 	return dev ? dev_to_rdev(dev) : NULL;
 }

-- 
2.53.0.959.g497ff81fa9-goog


