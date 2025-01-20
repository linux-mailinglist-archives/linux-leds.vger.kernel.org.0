Return-Path: <linux-leds+bounces-3824-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D401A168DD
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 10:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 401461884BD7
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 09:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCED41A4E77;
	Mon, 20 Jan 2025 09:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Ks+FLYXu"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5281A01D4;
	Mon, 20 Jan 2025 09:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363796; cv=none; b=vGeHCofOTKBO+F4twK2ENW4i+28IQ3q6CE1wdZM8Vw6N9RI6gQlWeTDt+EJR6k+1Y138F8/q2wKwE5PKX+CuKu+ZDnwrcbYiUAYa/4t2WIekFuyrm1NNLT28t0Qi2F8KYB3wuUqiF3wxXVH7xxlBzLvLkiBUeDh8sFY3DYVzfOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363796; c=relaxed/simple;
	bh=me489t2oKgcRAa40VsCkPhgy1HYPDmc36MpMCwStBSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JhxhVZqk65nBorXkgI8o156w9dcUH4gYqsIh+5MYnV+No1eqXeqjrJJzXItjPnsCWPVUeVtu79u8IcG630CejdVjUdaZoHVXDiK+wYPoG3r7T3D1jYiMq9js8d8YX5Sm8YCGx2pq2gPHF08NsqaiCiNR1X8dznUbJyWgedIXato=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Ks+FLYXu; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB73A1040DBF6;
	Mon, 20 Jan 2025 10:03:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737363792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fJZeL9A8Sfxpp9ZRJId/CWSpdquq50ojC8038lTZBsA=;
	b=Ks+FLYXuIrltNUKG5xevLJeyhNRdOu1eHuQQhKMB6Czjy/F/KZweuMYj/oK6+C42wmK+yR
	6wRg0/xtgQHPHiIWhh6VxBOil7NweILvch3TP3D5XIIOTYZA+Edpq5jtpxCkPU8TEku/wA
	kl33ZtAFSSWwk1W3KPXNeJBq2qOq8Dfydyj27pqa5gnm3A2h4lMF64Ri6n9AFh2yjcKx8l
	QxymQhShaD1kblCQEKN8433PzaaBOWsBvrmFDAJRUmgmQaAlPa/ICBQ88g8WqFglZnLch4
	1bK8RLBSVwgZSIako0xGq/YWiJL64/ruZYl+J2UWxdVxKJu2SFZbrwxEclpWmA==
From: Marek Vasut <marex@denx.de>
To: linux-leds@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org
Subject: [PATCH v2] net: phy: Handle both led@0 and led subnode name for single-LED PHYs
Date: Mon, 20 Jan 2025 10:02:46 +0100
Message-ID: <20250120090256.54382-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In case a PHY supports only one LED in total, like ADIN1300, and this LED
is described in DT, it is currently necessary to include unit address in
the LED node name and the address-cells have to be set to 1:

leds {
  #address-cells = <1>;
  ...
  led@0 {
    reg = <0>;
    ...
  };
};

For a single LED PHY, this should not be necessary and plain 'led' node
without unit should be acceptable as well:

leds {
  ...
  led {
    ...
  };
};

Handle this special case. In case reg property is not present in the leds
node subnode, test whether the leds node contains exactly one subnode, and
if so, assume this is the one single LED with reg property set to 0.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org
---
V2: Fix up variable rename
---
 drivers/net/phy/phy_device.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 5b34d39d1d52a..e36e65e672e79 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3346,6 +3346,7 @@ static int of_phy_led(struct phy_device *phydev,
 	struct led_classdev *cdev;
 	unsigned long modes = 0;
 	struct phy_led *phyled;
+	int led_count;
 	u32 index;
 	int err;
 
@@ -3357,8 +3358,18 @@ static int of_phy_led(struct phy_device *phydev,
 	phyled->phydev = phydev;
 
 	err = of_property_read_u32(led, "reg", &index);
-	if (err)
-		return err;
+	if (err) {
+		led_count = of_get_available_child_count(of_get_parent(led));
+
+		/*
+		 * If there is one PHY LED in total, accept 'led' subnode
+		 * in addition to 'led@0' subnode, and assume reg = <0>;
+		 */
+		if (led_count != 1)
+			return err;
+		index = 0;
+		err = 0;
+	}
 	if (index > U8_MAX)
 		return -EINVAL;
 
-- 
2.45.2


