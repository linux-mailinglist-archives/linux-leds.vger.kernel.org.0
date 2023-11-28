Return-Path: <linux-leds+bounces-189-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF187FB0C4
	for <lists+linux-leds@lfdr.de>; Tue, 28 Nov 2023 05:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE283281640
	for <lists+linux-leds@lfdr.de>; Tue, 28 Nov 2023 04:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8067DDDE;
	Tue, 28 Nov 2023 04:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363571AD;
	Mon, 27 Nov 2023 20:00:48 -0800 (PST)
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r7pH7-0002hr-09;
	Tue, 28 Nov 2023 04:00:42 +0000
Date: Tue, 28 Nov 2023 04:00:39 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Li Zetao <lizetao1@huawei.com>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v3 2/2] docs: ABI: sysfs-class-led-trigger-netdev: add new
 modes and entry
Message-ID: <e72a6794639cf3881d698e1d34b456e747da1b95.1701143925.git.daniel@makrotopia.org>
References: <99e7d3304c6bba7f4863a4a80764a869855f2085.1701143925.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99e7d3304c6bba7f4863a4a80764a869855f2085.1701143925.git.daniel@makrotopia.org>

Document newly introduced modes for the LED netdev trigger.

Add documentation for new modes:
- link_2500
- link_5000
- link_10000

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v3: include this documentation patch as well

 .../testing/sysfs-class-led-trigger-netdev    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
index f6d9d72ce77b7..a6c307c4befa0 100644
--- a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
@@ -114,6 +114,45 @@ Description:
 		speed of 1000Mbps of the named network device.
 		Setting this value also immediately changes the LED state.
 
+What:		/sys/class/leds/<led>/link_2500
+Date:		Nov 2023
+KernelVersion:	6.8
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Signal the link speed state of 2500Mbps of the named network device.
+
+		If set to 0 (default), the LED's normal state is off.
+
+		If set to 1, the LED's normal state reflects the link state
+		speed of 2500Mbps of the named network device.
+		Setting this value also immediately changes the LED state.
+
+What:		/sys/class/leds/<led>/link_5000
+Date:		Nov 2023
+KernelVersion:	6.8
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Signal the link speed state of 5000Mbps of the named network device.
+
+		If set to 0 (default), the LED's normal state is off.
+
+		If set to 1, the LED's normal state reflects the link state
+		speed of 5000Mbps of the named network device.
+		Setting this value also immediately changes the LED state.
+
+What:		/sys/class/leds/<led>/link_10000
+Date:		Nov 2023
+KernelVersion:	6.8
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Signal the link speed state of 10000Mbps of the named network device.
+
+		If set to 0 (default), the LED's normal state is off.
+
+		If set to 1, the LED's normal state reflects the link state
+		speed of 10000Mbps of the named network device.
+		Setting this value also immediately changes the LED state.
+
 What:		/sys/class/leds/<led>/half_duplex
 Date:		Jun 2023
 KernelVersion:	6.5
-- 
2.43.0

