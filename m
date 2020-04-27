Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCBED1B989F
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 09:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgD0Hbp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 03:31:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbgD0Hbp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Apr 2020 03:31:45 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9AE3220728;
        Mon, 27 Apr 2020 07:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587972704;
        bh=W3coOJ/9IbQlK6OGsMXbje2kmeFvSqao3U4W5PN7U+0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2nvhZUVCE5MBhKyCf/PDJo9ooUIzM6DS9en+pF9MuQi3vO4D2cqssJiJzPGZw5al1
         3SuUIyTgfFyOYEHBHIbjliqJKPcCV1drJWkvtSbw/EM+aXoIU/zXKiVoRwqboKPC8m
         +uQ90S8bQyV6GACWIOQEwlt05WMT9rQ2dZULr4i8=
Received: by wens.tw (Postfix, from userid 1000)
        id 682645F81B; Mon, 27 Apr 2020 15:31:42 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: leds: common: Drop enumeration for linux,default-triggers
Date:   Mon, 27 Apr 2020 15:31:30 +0800
Message-Id: <20200427073132.29997-2-wens@kernel.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200427073132.29997-1-wens@kernel.org>
References: <20200427073132.29997-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The bindings currently list a very small subset of valid triggers for
LEDs. Since many drivers or subsystems in Linux register custom
triggers, the list would become very hard to maintain.

Instead, just drop the list and allow free form strings.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../devicetree/bindings/leds/common.yaml      | 21 +------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 4c270fde4567..3b3cdab3fc15 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -79,26 +79,7 @@ properties:
     description:
       This parameter, if present, is a string defining the trigger assigned to
       the LED.
-    allOf:
-      - $ref: /schemas/types.yaml#definitions/string
-    enum:
-        # LED will act as a back-light, controlled by the framebuffer system
-      - backlight
-        # LED will turn on (but for leds-gpio see "default-state" property in
-        # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
-      - default-on
-        # LED "double" flashes at a load average based rate
-      - heartbeat
-        # LED indicates disk activity
-      - disk-activity
-        # LED indicates IDE disk activity (deprecated), in new implementations
-        # use "disk-activity"
-      - ide-disk
-        # LED flashes at a fixed, configurable rate
-      - timer
-        # LED alters the brightness for the specified duration with one software
-        # timer (requires "led-pattern" property)
-      - pattern
+    $ref: /schemas/types.yaml#definitions/string
 
   led-pattern:
     description: |
-- 
2.26.0

