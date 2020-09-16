Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED1C26C60C
	for <lists+linux-leds@lfdr.de>; Wed, 16 Sep 2020 19:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgIPRbH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Sep 2020 13:31:07 -0400
Received: from mx009.vodafonemail.xion.oxcs.net ([153.92.174.39]:38115 "EHLO
        mx009.vodafonemail.xion.oxcs.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727143AbgIPRaR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 16 Sep 2020 13:30:17 -0400
Received: from vsmx002.vodafonemail.xion.oxcs.net (unknown [192.168.75.192])
        by mta-6-out.mta.xion.oxcs.net (Postfix) with ESMTP id 52172605F75;
        Wed, 16 Sep 2020 11:14:12 +0000 (UTC)
Received: from app-33.app.xion.oxcs.net (app-33.app.xion.oxcs.net [10.10.1.33])
        by mta-6-out.mta.xion.oxcs.net (Postfix) with ESMTPA id 0B5F7605F72;
        Wed, 16 Sep 2020 11:14:05 +0000 (UTC)
Date:   Wed, 16 Sep 2020 13:14:05 +0200 (CEST)
From:   Markus Moll <moll.markus@arcor.de>
To:     linux-leds@vger.kernel.org
Cc:     Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>
Message-ID: <2101433321.26224.1600254845932@mail.vodafone.de>
In-Reply-To: <1023311712.12962.1600197989828@mail.vodafone.de>
References: <1023311712.12962.1600197989828@mail.vodafone.de>
Subject: [PATCH 2/2] dt: bindings: pca9532: add description of pwm and psc
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev73
X-Originating-Client: open-xchange-appsuite
X-VADE-STATUS: LEGIT
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

These new properties allow users to configure the PWM when the device is
probed. This is useful for e.g. uninterrupted blinking during boot.

Signed-off-by: Markus Moll <mmoll@de.pepperl-fuchs.com>
---

Resending this patch as it seems the first attempt wasn't successful.
Apologies if you received this patch twice.

 .../devicetree/bindings/leds/leds-pca9532.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)


diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
index f769c52e364..3aa05eca9df 100644
--- a/Documentation/devicetree/bindings/leds/leds-pca9532.txt
+++ b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
@@ -11,6 +11,14 @@ Required properties:
 "nxp,pca9533"
 - reg - I2C slave address
 
+Optional properties:
+ - nxp,pwm: array of two 8-bit values specifying the blink duty cycle
+ fractions of each pwm (default )
+ The duty cycle is pwm/256.
+ - nxp,psc: array of two 8-bit values specifying the blink period of
+ each pwm (default )
+ The period is (psc+1)/152 seconds.
+
 Each led is represented as a sub-node of the nxp,pca9530.

 Optional sub-node properties:
@@ -26,6 +34,8 @@ Example:
 leds: pca9530@60 {
 compatible = "nxp,pca9530";
 reg = ;
+ nxp,pwm = /bits/ 8 ; // 50% duty cycle
+ nxp,psc = /bits/ 8 ; // 1Hz and 4Hz, respectively
 
 red-power {
 label = "pca:red:power";
-- 
2.25.1
