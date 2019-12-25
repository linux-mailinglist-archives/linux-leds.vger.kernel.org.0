Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB3812A7A7
	for <lists+linux-leds@lfdr.de>; Wed, 25 Dec 2019 12:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfLYLHZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Dec 2019 06:07:25 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:36286 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726409AbfLYLHZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 25 Dec 2019 06:07:25 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 1164AFB03;
        Wed, 25 Dec 2019 12:07:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XD4VwviaSp7l; Wed, 25 Dec 2019 12:07:21 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 63CF740BFC; Wed, 25 Dec 2019 12:07:19 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] dt: bindings: lm3692x: Add ti,brightness-mapping-exponential property
Date:   Wed, 25 Dec 2019 12:07:16 +0100
Message-Id: <ef20a8b8fb0b136e4b9a233aea562d8b589cc028.1577271823.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1577271823.git.agx@sigxcpu.org>
References: <cover.1577271823.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This allows to select exponential brightness mode instead of the default
linear mode.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
index 95f6d8c19f20..73f41249ecd3 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
@@ -18,6 +18,8 @@ Required properties:
 Optional properties:
 	- enable-gpios : gpio pin to enable/disable the device.
 	- vled-supply : LED supply
+	- ti,brightness-mapping-exponential: Whether to use exponential
+	    brightness mapping
 	- ti,ovp-microvolt: Overvoltage protection in
 	    micro-volt, can be 17000000, 21000000, 25000000 or
 	    29000000. If ti,ovp-microvolt is not specified it
@@ -49,6 +51,7 @@ led-controller@36 {
 	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	vled-supply = <&vbatt>;
 	ti,ovp-microvolt = <25000000>;
+	ti,brightness-mapping-exponential;
 
 	led@0 {
 		reg = <0>;
-- 
2.23.0

