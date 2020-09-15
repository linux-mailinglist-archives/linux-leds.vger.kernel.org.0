Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D53726B2DA
	for <lists+linux-leds@lfdr.de>; Wed, 16 Sep 2020 00:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbgIOWyg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Sep 2020 18:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727304AbgIOP1W (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Sep 2020 11:27:22 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E4AC061351;
        Tue, 15 Sep 2020 08:26:27 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 0ABB9140A47;
        Tue, 15 Sep 2020 17:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600183583; bh=dv65+eYU8SaWgkfiQtVpIM3HXhYU67+hTnWMa0Ts9NI=;
        h=From:To:Date;
        b=SWjmxoV4EYZG3f5jRX9ldVCv4wr+nX/2ntXxCUE7/fY4HEcJCD4cXaKFCHYTZKAF6
         6+IZobur0QfblPQr2RVm2O9Ldn5McHTiw0AUqAlm1YHHCGnYiyp6kCTxjeuL1I0BHd
         OE5FEjh7OakE+d7S9eoWLDTgSMIpvspIjCuwuRJc=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds + devicetree v2 0/2] Parse DT property `trigger-sources` for netdev LED trigger
Date:   Tue, 15 Sep 2020 17:26:14 +0200
Message-Id: <20200915152616.20591-1-marek.behun@nic.cz>
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

this is v2.

Changes since v1:
- fixed problems with v1 reported by kernel test robot
- created helper functions of_led_count_trigger_sources and
  of_led_get_trigger_source

Below is description from v1:

The `trigger-sources` LED DT property is currently only implemented
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
  leds: trigger: add trigger sources validating method and helper
    functions
  leds: trigger: netdev: parse `trigger-sources` from device tree

 drivers/leds/led-triggers.c           | 68 ++++++++++++++++++++---
 drivers/leds/trigger/ledtrig-netdev.c | 80 ++++++++++++++++++++++++++-
 include/dt-bindings/leds/common.h     |  1 +
 include/linux/leds.h                  | 25 +++++++++
 4 files changed, 165 insertions(+), 9 deletions(-)

-- 
2.26.2

