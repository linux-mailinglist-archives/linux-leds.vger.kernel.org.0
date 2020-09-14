Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A16592699D7
	for <lists+linux-leds@lfdr.de>; Tue, 15 Sep 2020 01:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgINXmA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Sep 2020 19:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgINXl4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Sep 2020 19:41:56 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CAB0C06174A;
        Mon, 14 Sep 2020 16:41:54 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id EBB6F140A9E;
        Tue, 15 Sep 2020 01:41:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600126909; bh=P1qqA6kviRKjp2OK9u0xbL5be5xWvGGAA5YUHrLIfOI=;
        h=From:To:Date;
        b=ca6Y7KPK55qOT2dPVrgb/i75tNRvJrBvIOSwsQ9/IrKy5HFpoe5gNuH7jmJaIxI+i
         qzXdzlTbXTNeeW9YF9kTMCHZFlIKI3wPg+IRsxxM1zE0roM/n4LqMy3MmLwdUsHwP3
         1fB8XP05V7IXPR3ejXWa2wpzdhJ1mE+Ohm+NbLGk=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds + devicetree v1 0/2] Parse DT property `trigger-sources` for netdev LED trigger
Date:   Tue, 15 Sep 2020 01:41:46 +0200
Message-Id: <20200914234148.19837-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

the `trigger-sources` LED DT property is currently only implemented
for ledtrig-usbport.

Lets implement it for the netdev LED trigger.

In this proposal the specific netdev LED trigger mode is determined
from the `function` LED DT property.

Example:
  eth0: ethernet@30000 {
    compatible = "xyz";
    #trigger-source-cells = <0>;
  };

  led {
    color = <LED_COLOR_ID_GREEN>;
    function = LED_FUNCTION_LINK;
    trigger-sources = <&eth0>;
  };

When led is registered, the netdev trigger is automatically activated
and set to light the LED on if eth0 is linked.

Please let me know if this binding is OK, or if the binding should
instead of the `function` property determine the trigger settings from
arguments of the `trigger-sources` property :
  led {
    color = <LED_COLOR_ID_GREEN>;
    trigger-sources = <&eth0 (NETDEV_ATTR_LINK | NETDEV_ATTR_RX)>;
  };

I prefer the first binding, since we already have the `function`
property. Multiple modes can be achieved by string array, but this is
not yet implemented:
  led {
    color = <LED_COLOR_ID_GREEN>;
    function = LED_FUNCTION_LINK, LED_FUNCTION_ACTIVITY;
    trigger-sources = <&eth0>;
  };

Marek

Marek Behún (2):
  leds: trigger: add DT `trigger-source` validating method
  leds: trigger: netdev: allow parsing `trigger-sources` from device
    tree

 drivers/leds/led-triggers.c           | 26 +++++---
 drivers/leds/trigger/ledtrig-netdev.c | 91 ++++++++++++++++++++++++++-
 include/dt-bindings/leds/common.h     |  1 +
 include/linux/leds.h                  |  6 ++
 4 files changed, 115 insertions(+), 9 deletions(-)

-- 
2.26.2

