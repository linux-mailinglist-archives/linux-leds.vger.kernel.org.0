Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91DDA2711A9
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 03:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgITBR3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 21:17:29 -0400
Received: from lists.nic.cz ([217.31.204.67]:59158 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726707AbgITBR3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 21:17:29 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 7722B14004F;
        Sun, 20 Sep 2020 03:17:27 +0200 (CEST)
Date:   Sun, 20 Sep 2020 03:17:27 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     "Adrian Schmutzler" <mail@adrianschmutzler.de>
Cc:     <linux-leds@vger.kernel.org>
Subject: Re: How to name multiple LEDs of the same type and color
Message-ID: <20200920031727.731e8a66@nic.cz>
In-Reply-To: <00ab01d68eca$d2d4fcc0$787ef640$@adrianschmutzler.de>
References: <00ab01d68eca$d2d4fcc0$787ef640$@adrianschmutzler.de>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 19 Sep 2020 23:21:22 +0200
"Adrian Schmutzler" <mail@adrianschmutzler.de> wrote:

> Hi,
> 
> I wonder what would be the correct way to deal with a set of LEDs with the same color/function combination, e.g.
> 
> 	leds {
> 		compatible = "gpio-leds";
> 
> 		link1 {
> 			function = LED_FUNCTION_RSSI;
> 			color = <LED_COLOR_ID_GREEN>;
> 			gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
> 		};
> 
> 		link2 {
> 			function = LED_FUNCTION_RSSI;
> 			color = <LED_COLOR_ID_GREEN>;
> 			gpios = <&gpio 14 GPIO_ACTIVE_LOW>;
> 		};
> 
> 		link3 {
> 			function = LED_FUNCTION_RSSI;
> 			color = <LED_COLOR_ID_GREEN>;
> 			gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
> 		};
> 	};
> 
> or
> 
> 	leds {
> 		compatible = "gpio-leds";
> 
> 		lan1 {
> 			function = LED_FUNCTION_LAN;
> 			color = <LED_COLOR_ID_GREEN>;
> 			gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
> 		};
> 		lan2 {
> 			function = LED_FUNCTION_LAN;
> 			color = <LED_COLOR_ID_GREEN>;
> 			gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
> 		};
> 		lan3 {
> 			function = LED_FUNCTION_LAN;
> 			color = <LED_COLOR_ID_GREEN>;
> 			gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
> 		};
> 	};
> 
> These nodes will automatically create names like green:lan, green:lan_1, etc.
> 
> Is there a way to force a certain numbering scheme, e.g.
> green:lan1, green:lan2, etc.
> ?
> 
> (For the RSSI leds, we currently even have stuff like ...:green:rssilow, ...:green:rssimedium, etc. in the label now)
> 
> How does this match into the color/function concept?
> 
> Thanks for some pointers ...
> 
> Best
> 
> Adrian

Please look at function-enumerator property.
