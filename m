Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665772D5135
	for <lists+linux-leds@lfdr.de>; Thu, 10 Dec 2020 04:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbgLJDOe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Dec 2020 22:14:34 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:8974 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgLJDOe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Dec 2020 22:14:34 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CrzWg1lz1zhq4w;
        Thu, 10 Dec 2020 11:13:19 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.9) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Dec 2020 11:13:34 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>,
        Darshak Patel <darshak.patel@einfochips.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        "Dong Aisheng" <aisheng.dong@nxp.com>,
        Guodong Xu <guodong.xu@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Lad Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/1] dt-bindings: leds: add onboard LED triggers of 96Boards
Date:   Thu, 10 Dec 2020 11:12:03 +0800
Message-ID: <20201210031203.1901-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

For all 96Boards, the following standard is used for onboard LEDs.

green:user1  default-trigger: heartbeat
green:user2  default-trigger: mmc0/disk-activity(onboard-storage)
green:user3  default-trigger: mmc1 (SD-card)
green:user4  default-trigger: none, panic-indicator
yellow:wlan  default-trigger: phy0tx
blue:bt      default-trigger: hci0-power

Link to 96Boards CE Specification: https://linaro.co/ce-specification

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Darshak Patel <darshak.patel@einfochips.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Guodong Xu <guodong.xu@linaro.org>
Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/leds/common.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index f1211e7045f12f3..525752d6c5c84fd 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -97,6 +97,16 @@ properties:
         # LED alters the brightness for the specified duration with one software
         # timer (requires "led-pattern" property)
       - pattern
+        #For all 96Boards, Green, disk-activity(onboard-storage)
+      - mmc0
+        #For all 96Boards, Green, SD-card
+      - mmc1
+        #For all 96Boards, Green, panic-indicator
+      - none
+        #For all 96Boards, Yellow, WiFi activity LED
+      - phy0tx
+        #For all 96Boards, Blue, Bluetooth activity LED
+      - hci0-power
 
   led-pattern:
     description: |
-- 
1.8.3


