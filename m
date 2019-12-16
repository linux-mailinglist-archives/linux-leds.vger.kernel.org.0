Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7C87120592
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2019 13:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbfLPM2M (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Dec 2019 07:28:12 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:33326 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727486AbfLPM2L (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 16 Dec 2019 07:28:11 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 28249FB02;
        Mon, 16 Dec 2019 13:28:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TNhw3GVNifwJ; Mon, 16 Dec 2019 13:28:07 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 87993498A9; Mon, 16 Dec 2019 13:28:06 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt: bindings: lm3692x: Document new properties
Date:   Mon, 16 Dec 2019 13:28:05 +0100
Message-Id: <35a23315938909c80e7772838e1de0d2d46302f2.1576499103.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1576499103.git.agx@sigxcpu.org>
References: <cover.1576499103.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

We allow configuration of brightness mode and over voltage
protection.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
index 4c2d923f8758..f195e8b45d85 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
@@ -18,6 +18,10 @@ Required properties:
 Optional properties:
 	- enable-gpios : gpio pin to enable/disable the device.
 	- vled-supply : LED supply
+	- ti,brightness-mapping-exponential: Whether to use exponential
+	    brightness mapping
+	- ti,overvoltage-volts: Overvoltage protection in Volts, can
+	    be 0 (unprotected), 21, 25 or 29V
 
 Required child properties:
 	- reg : 0 - Will enable all LED sync paths
-- 
2.23.0

