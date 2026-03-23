Return-Path: <linux-leds+bounces-7418-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI7tDEqewGnrJAQAu9opvQ
	(envelope-from <linux-leds+bounces-7418-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:58:34 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF7C2EBBCA
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74327304650E
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 01:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C06822423A;
	Mon, 23 Mar 2026 01:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDI0A2gm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F120F21A447
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 01:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230896; cv=none; b=owcewJ++iBYk6iXoy25K4DkBY3HYMVId0hHZDzRiUA/K4+9zrTf2ax9vtUIBre6VJzYH2cnKihhpB2dsbdeXiceZA0L5ZCFYwC8kW/KrUDEAYBYi+GKQN77iUvSynwGrQLY+s32lQ13BpdJSLwRJdD+9Kfeh8Kj+gqtgAz8/IB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230896; c=relaxed/simple;
	bh=08I0o88gE8cy/+U/o+AKavzx0eRFU5y0gnDfFw+/PXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WTUCZ9u49wp0VPqevP9UdqgTPGgVzobBrH7hnngFmspH0gqosHFSel8qgyL3md680C+XR4VpsUIkIU8Cfpm7wqzYIP3taPp49YqmgQ5Mx4Sit/1AyeXj7SGv1oUR/JL4IY9OKE/Jrte0NGm4wog6tuzjD2+vICDrcmgdErFDGhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDI0A2gm; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-126ea4b77adso3523272c88.1
        for <linux-leds@vger.kernel.org>; Sun, 22 Mar 2026 18:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230892; x=1774835692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0G/uhHXfu21xXv3gnOSiW9nh+0t2XQiNOcz2tPqgk4=;
        b=nDI0A2gmNtS5LgvEVUluvkAX/FWGS575ISd1L4zyGn3fEXrltN5j8VtfW5tCiieWY8
         41nfkoGX88hpgDBQGSDxasP1DdMXRadW7Gi3bWTbS4Yu9FV3Sktl3u50jpSLlO0rYKft
         wuvu/1zVyMnCtN4FkmZVDcRnaso/zar3v5dJ2l8besyL7/GtuN6r2q3Y34jRbJXwA1XD
         EhI1xHP0sRUhMKgdha3XVByYFwiiM8YkVuJaA9mc0VZf208/yBqed+wLu7FcbDqOMJMz
         en5Nd/G2nUaWODtuYeYkxOipEBkqfu14gl6Kt+ii6vqY2P5VoB4zSfmNLnfenZ74Kh6d
         gi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230892; x=1774835692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L0G/uhHXfu21xXv3gnOSiW9nh+0t2XQiNOcz2tPqgk4=;
        b=nG23dGo72yO31gPOUURVdqAonE46mlPiW+78g5kBBKS1O9Z8QoJjUh07aIyfcInex1
         HClpBcNbpfmKKlf0jzE7m2s5/cuMFGr+nGpHnIRle5pMnyh10X1Nhi1AwR/7ilBNfPth
         LuJ2nqETo2wy8I4LBqtin1gkNQpmIsLPNhda/63IS/WIZEq2LpL3ErX26cZIT74bTlRb
         HCsvPVjUs3lKFHF3hRR7daMESLEAqiAxhvFDLqUBU8JTA/yxUyq1heMufJZaqnNxSLzP
         S5bi35yPcmgubRmqQm7xFcvLOvfaF1YCo+XAArFbua5fqSk1VwE5xRdQk6jUctYs/TcS
         uTkA==
X-Forwarded-Encrypted: i=1; AJvYcCWBQUnXUWO8rFMpO+tWXNCUdVml9H+5p8Ljx54fFvcL82BqqyjBgDuZejZEBFu0yCY8wJhMiTYpH4zy@vger.kernel.org
X-Gm-Message-State: AOJu0YxH+drH62N610UGcPblTOAzJKrb6djuwd0d3/ki+1K4osV6hR5Z
	j1nDz+qlbZ8tVFX6okMu7Z56Sb+MJ4KKZp7WjWHMgYAK8GIl1o/0WNJg
X-Gm-Gg: ATEYQzyN6EaPUnVUvWSjHUYHbsLHG8KXChSdczL9cv2rUiK2jc1iIPWme8vvmAAUHkI
	qxrh0LNZFtKl+OxbN6yXNw208k4OuemiTt64H8jxUsyiUtRCantD7xePCv2j7yU0FSknAd34wtS
	TLaQZ645YZJVDIoYTbxSkizHHGKQZKBYmkJhe/TNR+KLMt+bs3DDC1kleTSuv1R8p414XaPqrza
	TiYPnoam9trOoYRQ+5zbhyQ/pcmpHUPcRECTWu1ChoX7F4X9hCAiAOgn8m1t0e82IrrEgNZ9XHy
	vM3VzfZ+vygKugsFz+E+yswmwmCCPilkUUptrEr8JpeNgmj/JubyVFiq3EUVag82raX8uJ5w8G3
	WKMIC14Fznvp56zk4AIX7HZjW+nBAg+pNZKOUItQsUbLvJJ1ovWBViCkfXX8VytmNJfuNCkR3YV
	gshK+dWtgGJkBtBJrXSe9MXk+CWPbLXa3PkGGP4vxftz8Dnk6/wp9Dqd3kpW2dzA8IC6CRjQxsr
	P40DXPVb8awGmA=
X-Received: by 2002:a05:7022:eac8:b0:128:d3de:c9e4 with SMTP id a92af1059eb24-12a726db2ffmr4311793c88.30.1774230892088;
        Sun, 22 Mar 2026 18:54:52 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:50 -0700 (PDT)
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
Subject: [PATCH 06/10] mux: switch to using class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:24 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-6-b72eb22a1215@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7418-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 8BF7C2EBBCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation to class_find_device_by_of_node() going away switch to
using class_find_device_by_fwnode().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mux/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 23538de2c91b..774d4cc67cc1 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -521,7 +521,7 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
 {
 	struct device *dev;
 
-	dev = class_find_device_by_of_node(&mux_class, np);
+	dev = class_find_device_by_fwnode(&mux_class, of_fwnode_handle(np));
 
 	return dev ? to_mux_chip(dev) : NULL;
 }

-- 
2.53.0.959.g497ff81fa9-goog


