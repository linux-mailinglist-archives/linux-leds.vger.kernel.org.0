Return-Path: <linux-leds+bounces-3822-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DBAA16830
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 09:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AD4A1886B7E
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 08:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3461192B71;
	Mon, 20 Jan 2025 08:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="axdD8vKH"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72641925AF;
	Mon, 20 Jan 2025 08:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737361590; cv=none; b=XfYzmbCzMV+SnOg994dtbh01bPhhmSmeVgqn8VfksQpnuitzNnSS39EGG+Ra2KWM2u3tWWtVswETRarUMhMfywA4exX4TES5LjRIve8n2pGuZcZe5K1cGfNTixmKhVhpAU5q0+4XNUL5pqAZ9Fy/1Ejo18qPzCxEuXXly7DrS3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737361590; c=relaxed/simple;
	bh=QY+vaFtFKPxGY8eSAq/Lba46rv01eJ925hphLI2SxC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qWWL8dvSTTny0MOh7IXR0qw/Oj/gJaMxl/jDlHSJxRdj4LMK9V+EDuBP2fXv+RvBKpkogouv9hChChE0CakV2ApvtkPvxmUcBODkSpsQCQ6uCqN1GiI5bsfj+Xkmu7seotizIOe0gMnDw68fIWpWVpEAgz4XTlby/7KCcAqGNPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=axdD8vKH; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D0B26101C71BA;
	Mon, 20 Jan 2025 09:26:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737361585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K+vO5M5ma2cVFTnobnF9M0lbzykoddasACwyEX9xIlQ=;
	b=axdD8vKHFcEICFIUiNdbiEQlkf4IZKMQ6OLaR+NyfW6NQq/4U9wqpo7GGymJMIwlI/xpBk
	ByOMA/5Y/DqvFvJ35rco5sJzMeiISlfjdh1EyE4tTtLObaft9hodGBvNGzI+TcN2IwZ9cS
	Q6ujVYKCovcKxVdkb0P4J9nRgux22pixsVOSVwu8snKfduQlmmx9onoysTJanDhGp2UZOT
	P8RZNGDFyHkGegqIhq7LElFPMbmQLBRtJL6r+LLGixe9Tj7Dp/piZze+7PIGqFvv0nWEaN
	o/7h3flDnY3K3eLAuSWnjeMdFakmknVWKsxgos3ePHS21VMuVOpbRCEjlcBzjQ==
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
Subject: [PATCH] net: phy: Handle both led@0 and led subnode name for single-LED PHYs
Date: Mon, 20 Jan 2025 09:25:58 +0100
Message-ID: <20250120082609.50445-1-marex@denx.de>
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
 drivers/net/phy/phy_device.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 5b34d39d1d52a..fa91d03d9e920 100644
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
+		if (total_led_count != 1)
+			return err;
+		index = 0;
+		err = 0;
+	}
 	if (index > U8_MAX)
 		return -EINVAL;
 
-- 
2.45.2


