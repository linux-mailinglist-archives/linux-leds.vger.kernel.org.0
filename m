Return-Path: <linux-leds+bounces-6974-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEyqMEpEmmm6aAMAu9opvQ
	(envelope-from <linux-leds+bounces-6974-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 22 Feb 2026 00:48:26 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BDC16E48D
	for <lists+linux-leds@lfdr.de>; Sun, 22 Feb 2026 00:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62DF9300BDA1
	for <lists+linux-leds@lfdr.de>; Sat, 21 Feb 2026 23:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0425E2EC09B;
	Sat, 21 Feb 2026 23:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="3P/6g61S"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFAB246BC5;
	Sat, 21 Feb 2026 23:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771717703; cv=none; b=ArGj5eR9seC4F14MLVHHF3lBlESPJeNerv46PXE7gR8pc7PdrkRFHKTBYHqLI/d4RslOKWs5IbXC4JSGz06C1r7TY0QUg3AbF9JANiuuIyHn9lVwicl/djUJjE8ElwDDcHDNOsLbqGNklFySgLMBUOmyE4SXJ4OpXdQyJ7YBbqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771717703; c=relaxed/simple;
	bh=r/1igpAeLfqEQf9V6lp5MskObr/YMh4Ed/3c48G7YUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UROLCZYwdYCXhDBSk58Lyiy/PrHxufV2OxYCRJzwHPzenQxxUvB1d8bK+QUmC0kmouvR3bc6XxhXI0iNwsAEb9TTMZmNajy4SFvSXaV5L/rV9W679VnJQjTrdmcy/5vPXYt1dGZ5Dx40Ojz7EqFK3mHBZoipzoeTd9iQ7mCvu0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=3P/6g61S; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=881Fec93wJCf42xpIv7Iov5yx2p1EBID71tnMJjcPzc=; b=3P/6g61SFTnwtuzCUQwElYcibr
	t7+/c6lZ4uMzBYjfN3WzUIFDTJKZ0CBF7+qpTZyzbm1M7LxqHeOHX7ICi7RxhLUS03QXpsBU5UeOP
	KWCfs0sTak4bZGpM3pe/IzBfERkiZcrQCDlV++2zYDoejktgWn5rt8Up1iLTMli2EOpM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtwho-008DSp-9s; Sun, 22 Feb 2026 00:48:12 +0100
Date: Sun, 22 Feb 2026 00:48:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [BUG] AB-BA deadlock between net and led-trigger module
Message-ID: <a592f471-fe5d-47c0-a5f6-305fbdcf686f@lunn.ch>
References: <OS7PR01MB13602B128BA1AD3FA38B6D1FFBC69A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS7PR01MB13602B128BA1AD3FA38B6D1FFBC69A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6974-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lunn.ch:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:email]
X-Rspamd-Queue-Id: D7BDC16E48D
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 06:01:46PM +0800, Shiji Yang wrote:
> The OpenWrt community reports that sometimes devices fail to start[1]
> on 5.15 kernel. After further tracking, this is caused by a AB-BA
> deadlock which can be reproduced in at least 5.15, 6.6, 6.12 and latest
> 6.18 LTS kenrel.

Hi Shiji

Please could you test this patch. It is based on the net tree, but
with a bit of fuzz will probably apply to older trees.

Thanks
	Andrew

From bf4d66187585a1893d558cb9357f1ef63437b898 Mon Sep 17 00:00:00 2001
From: Andrew Lunn <andrew@lunn.ch>
Date: Sat, 21 Feb 2026 14:51:54 -0600
Subject: [PATCH net] net: phy: register phy led_triggers during probe to avoid
 AB-BA deadlock

There is an AB-BA deadlock when both LEDS_TRIGGER_NETDEV and
LED_TRIGGER_PHY are enabled:

[ 1362.049207] [<8054e4b8>] led_trigger_register+0x5c/0x1fc             <-- Trying to get lock "triggers_list_lock" via down_write(&triggers_list_lock);
[ 1362.054536] [<80662830>] phy_led_triggers_register+0xd0/0x234
[ 1362.060329] [<8065e200>] phy_attach_direct+0x33c/0x40c
[ 1362.065489] [<80651fc4>] phylink_fwnode_phy_connect+0x15c/0x23c
[ 1362.071480] [<8066ee18>] mtk_open+0x7c/0xba0
[ 1362.075849] [<806d714c>] __dev_open+0x280/0x2b0
[ 1362.080384] [<806d7668>] __dev_change_flags+0x244/0x24c
[ 1362.085598] [<806d7698>] dev_change_flags+0x28/0x78
[ 1362.090528] [<807150e4>] dev_ioctl+0x4c0/0x654                       <-- Hold lock "rtnl_mutex" by calling rtnl_lock();
[ 1362.094985] [<80694360>] sock_ioctl+0x2f4/0x4e0
[ 1362.099567] [<802e9c4c>] sys_ioctl+0x32c/0xd8c
[ 1362.104022] [<80014504>] syscall_common+0x34/0x58

Here LED_TRIGGER_PHY is registering LED triggers during phy_attach
while holding RTNL and then taking triggers_list_lock.

[ 1362.191101] [<806c2640>] register_netdevice_notifier+0x60/0x168      <-- Trying to get lock "rtnl_mutex" via rtnl_lock();
[ 1362.197073] [<805504ac>] netdev_trig_activate+0x194/0x1e4
[ 1362.202490] [<8054e28c>] led_trigger_set+0x1d4/0x360                 <-- Hold lock "triggers_list_lock" by down_read(&triggers_list_lock);
[ 1362.207511] [<8054eb38>] led_trigger_write+0xd8/0x14c
[ 1362.212566] [<80381d98>] sysfs_kf_bin_write+0x80/0xbc
[ 1362.217688] [<8037fcd8>] kernfs_fop_write_iter+0x17c/0x28c
[ 1362.223174] [<802cbd70>] vfs_write+0x21c/0x3c4
[ 1362.227712] [<802cc0c4>] ksys_write+0x78/0x12c
[ 1362.232164] [<80014504>] syscall_common+0x34/0x58

Here LEDS_TRIGGER_NETDEV is being enabled on an LED. It first takes
triggers_list_lock and then RTNL. A classical AB-BA deadlock.

phy_led_triggers_registers() does not require the RTNL, it does not
make any calls into the network stack which require protection. There
is also no requirement the PHY has been attached to a MAC, the
triggers only make use of phydev state. This allows the call to
phy_led_triggers_registers() to be placed elsewhere. PHY probe() and
release() don't hold RTNL, so solving the AB-BA deadlock.

Reported-by: Shiji Yang <yangshiji66@outlook.com>
Closes: https://lore.kernel.org/all/OS7PR01MB13602B128BA1AD3FA38B6D1FFBC69A@OS7PR01MB13602.jpnprd01.prod.outlook.com/
Fixes: 06f502f57d0d ("leds: trigger: Introduce a NETDEV trigger")
Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/phy_device.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 9b8eaac63b90..cbb4af604aa5 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1866,8 +1866,6 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 		goto error;
 
 	phy_resume(phydev);
-	if (!phydev->is_on_sfp_module)
-		phy_led_triggers_register(phydev);
 
 	/**
 	 * If the external phy used by current mac interface is managed by
@@ -1982,9 +1980,6 @@ void phy_detach(struct phy_device *phydev)
 	phydev->phy_link_change = NULL;
 	phydev->phylink = NULL;
 
-	if (!phydev->is_on_sfp_module)
-		phy_led_triggers_unregister(phydev);
-
 	if (phydev->mdio.dev.driver)
 		module_put(phydev->mdio.dev.driver->owner);
 
@@ -3778,16 +3773,27 @@ static int phy_probe(struct device *dev)
 	/* Set the state to READY by default */
 	phydev->state = PHY_READY;
 
+	/* Register the PHY LED triggers */
+	if (!phydev->is_on_sfp_module)
+		phy_led_triggers_register(phydev);
+
 	/* Get the LEDs from the device tree, and instantiate standard
 	 * LEDs for them.
 	 */
-	if (IS_ENABLED(CONFIG_PHYLIB_LEDS) && !phy_driver_is_genphy(phydev))
+	if (IS_ENABLED(CONFIG_PHYLIB_LEDS) && !phy_driver_is_genphy(phydev)) {
 		err = of_phy_leds(phydev);
+		if (err)
+			goto out;
+	}
+
+	return 0;
 
 out:
+	if (!phydev->is_on_sfp_module)
+		phy_led_triggers_unregister(phydev);
+
 	/* Re-assert the reset signal on error */
-	if (err)
-		phy_device_reset(phydev, 1);
+	phy_device_reset(phydev, 1);
 
 	return err;
 }
@@ -3801,6 +3807,9 @@ static int phy_remove(struct device *dev)
 	if (IS_ENABLED(CONFIG_PHYLIB_LEDS) && !phy_driver_is_genphy(phydev))
 		phy_leds_unregister(phydev);
 
+	if (!phydev->is_on_sfp_module)
+		phy_led_triggers_unregister(phydev);
+
 	phydev->state = PHY_DOWN;
 
 	phy_cleanup_ports(phydev);
-- 
2.51.0



