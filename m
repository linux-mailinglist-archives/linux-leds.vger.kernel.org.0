Return-Path: <linux-leds+bounces-4773-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D732AD354B
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 13:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 154681750C6
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 11:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679A0217657;
	Tue, 10 Jun 2025 11:46:53 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0219421B9F7;
	Tue, 10 Jun 2025 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.217
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556013; cv=pass; b=BZhbwsRKm3MoD74JbvnZWO4DVPew9GehrvcsK8k7i4GF2u5AJLa+B9STTz6/Vo6iFvlYCB90oy4SKJzcIjgvMjCBBhnK++5iNCYGzcG2BKowNEYu7PvBFoIrRuctBdcdMwr7dyJjDzCUniuDfcUWl3pkYJ/nv2gP9g16KgRljqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556013; c=relaxed/simple;
	bh=uHJX0DxWeFqVosoMPeKr16q7fAhmSfsN6OaFvUHtD08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nc1bOQ4dLGKlRTkxp33yvYvVh4oEZv33soE4q0tymsrJLa9NKK/MtVykXHHY05sv4HYqmU4nDDhR1Pllzkq7mbJrMtAiBiV2Tfvi3F+7VFJvXQCcJ+Pxzm3nFT/o3sLiU5MRRlt9BH2YM0QgRn2A1WYtxWCSQPpc7nkX9jGlS1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inhub.de; spf=pass smtp.mailfrom=inhub.de; arc=pass smtp.client-ip=81.169.146.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inhub.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inhub.de
ARC-Seal: i=1; a=rsa-sha256; t=1749555649; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Evh0aWvulWGMvk/ec2Ra1bRNhjCgyglFzo9ECK+/MjvM7bn0quUl30F8Jgy4kI6iMy
    RW3KTtvbIoehlVfEVhGj5785lCszP6c7BGOSN5NJ2lV2tUHrOb3tn/A3WoNeGobxcy3y
    0T58BI23nxCdOCxOi43jZgtikCDZpA3j3C3kPIucDZL+6nEePO1D96ySVE9kQ1dRWXg7
    WXlRKXGzFdqyOtJV0O2cQRBgR+bPRdXLJpSJnqFSdZ28CFaSobEpY6Ayl6SUDTg6NyEt
    o/a/dNNbU+Bvq7GCYBJSDHwuqtORqhkwlTUKGAkPF/fcMrFeOZJaH1rmR7eOl6NLDyD8
    li9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1749555649;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=eIpbhmNUjy3O7tv0PtPRwrwhNYwNcqRDWPgwFL0PBm8=;
    b=qWfkXyo+oyR1rIg1fH4gzCzAMnWmP+gkQ9Fl50Vzx73Lv9Hnp7jwglD+d3GCyPjj1c
    OG/8lkhZf8l50wudwqKBPwPpBi0M7esL1WbvuaX9rl5+hUxJLNzPD2Gut87A5Ig9wzoO
    naaqZhN6fc5ULK13l740wR0UsQkg3rhfjNoXzSKj3RfldkfMSqU7ao7DB9A6Oei0T28o
    mAVM9nT61YlTZjNcmd24gAXCU5uHV+No5ITa/72AFIA7X/vyZ1zieIi2LB0mEj6SPnIZ
    bLegrHMoP2ytLczhfdUV5zlMpaktcL1SoBACX43oQpnQm35BkUpfFSdCrkM2sToR2xp/
    /tyw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":OGMGfEG7NfU1WQAxQKSndOy9b62IXRUXP1G+n0e9SfNgaKe3jg5kqErvsv7wxhn7R+CZYOGugK8="
Received: from crypto.lan.inhub.de
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id J569d715ABen5yb
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 10 Jun 2025 13:40:49 +0200 (CEST)
From: Tobias Junghans <tobias.junghans@inhub.de>
To: Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tobias Junghans <tobias.junghans@inhub.de>
Subject: [PATCH 2/2] leds: trigger: netdev: refactor netdev_event_requires_handling()
Date: Tue, 10 Jun 2025 13:40:20 +0200
Message-ID: <20250610114029.268938-3-tobias.junghans@inhub.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610114029.268938-1-tobias.junghans@inhub.de>
References: <20250610114029.268938-1-tobias.junghans@inhub.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

If there are network devices with the same name in different
namespaces, ledtrig-netdev gets confused easily and switches between
these devices whenever there are NETDEV_CHANGENAME/NETDEV_REGISTER
notifications.  This happens since ledtrig-netdev only checks for
device name equality regardless of previous associations with another
network device with the same name.

Real world example: eth0 is the primary physical network interface and
ledltrig-netdev is associated with that interface. If now Docker creates
a virtual Ethernet interface (vethXXXX), moves it to the
container's net namespace and renames it to eth0, ledtrig-netdev
switches to this device and the LED no longer blinks for the original
(physical) network device.

Fix this by refactoring the conditions under which to handle netdev
events:

- For processing NETDEV_REGISTER events, the device name has to match
  and no association with a net_dev must exist.

- For processing NETDEV_CHANGENAME events, the associated and notified
  network device have to match. Alternatively the device name has to
  match and no association with a net_dev must exist.

- For all other events, the associated and notified network device have
  to match.

Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>
---
 drivers/leds/trigger/ledtrig-netdev.c | 29 +++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 6e16619719fe..a3f30e6f74b4 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -578,15 +578,28 @@ static const struct attribute_group *netdev_trig_groups[] = {
 static bool netdev_event_requires_handling(unsigned long evt, struct net_device *dev,
 					   struct led_netdev_data *trigger_data)
 {
-	if (evt != NETDEV_UP && evt != NETDEV_DOWN && evt != NETDEV_CHANGE
-	    && evt != NETDEV_REGISTER && evt != NETDEV_UNREGISTER
-	    && evt != NETDEV_CHANGENAME)
-		return false;
-
-	if (!(dev == trigger_data->net_dev ||
-	     (evt == NETDEV_CHANGENAME && !strcmp(dev->name, trigger_data->device_name)) ||
-	     (evt == NETDEV_REGISTER && !strcmp(dev->name, trigger_data->device_name))))
+	switch (evt) {
+	case NETDEV_REGISTER:
+		if (trigger_data->net_dev ||
+		    strcmp(dev->name, trigger_data->device_name))
+			return false;
+		break;
+	case NETDEV_CHANGENAME:
+		if (trigger_data->net_dev != dev &&
+		    (trigger_data->net_dev ||
+		     strcmp(dev->name, trigger_data->device_name)))
+			return false;
+		break;
+	case NETDEV_UNREGISTER:
+	case NETDEV_UP:
+	case NETDEV_DOWN:
+	case NETDEV_CHANGE:
+		if (trigger_data->net_dev != dev)
+			return false;
+		break;
+	default:
 		return false;
+	}
 
 	return true;
 }
-- 
2.43.0


