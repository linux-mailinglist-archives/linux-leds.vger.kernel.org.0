Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE04223D5F5
	for <lists+linux-leds@lfdr.de>; Thu,  6 Aug 2020 06:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgHFEMX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 6 Aug 2020 00:12:23 -0400
Received: from m12-18.163.com ([220.181.12.18]:47678 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726403AbgHFEMX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 6 Aug 2020 00:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=58O72jhnrDHl5eaGDS
        i3G0TKF4cP/BfnN/97i4BIIUM=; b=Fumor4Q835MmuBAcAHETNxr5hii6jxVH79
        hAmksMG7pjemk0jjpsoXtZ9YamDSQzSIa4iCYYP+pDIFJfoUMshf+Dx0mFiH8K2U
        lnU5lUHIGYGvDgLTYtDnuyt3ehMnkiP0yI2PrMai6Irg4ygxgeQnxHS0FXFHnEKi
        s6zlDhKkk=
Received: from localhost.localdomain (unknown [58.33.79.182])
        by smtp14 (Coremail) with SMTP id EsCowADn96PVgitfLPkDHw--.22232S2;
        Thu, 06 Aug 2020 12:11:18 +0800 (CST)
From:   Grant Feng <von81@163.com>
To:     von81@163.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] leds: Add an optional property named 'sdb-gpios'
Date:   Thu,  6 Aug 2020 12:10:49 +0800
Message-Id: <20200806041049.19255-1-von81@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EsCowADn96PVgitfLPkDHw--.22232S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw4fCFWfXFW7XFy3XrWfAFb_yoWDtFc_Ja
        s7Cr4IgrZ8uF4vgw1DZr1avr4UCw4xAF1kCw4IqF1kAw1xt3sIgF92q34Yyr1UGana9r43
        Ca97ta4UJ3ZFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU055r5UUUUU==
X-Originating-IP: [58.33.79.182]
X-CM-SenderInfo: xyrqmii6rwjhhfrp/1tbiNwZ4OlWBhkqCiwAAsi
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The chip enters hardware shutdown when the SDB pin is pulled low.
The chip releases hardware shutdown when the SDB pin is pulled high.

Signed-off-by: Grant Feng <von81@163.com>
---
 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
index 926c2117942c..94f02827fd83 100644
--- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
+++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
@@ -15,6 +15,8 @@ Required properties:
 - reg: I2C slave address
 - address-cells : must be 1
 - size-cells : must be 0
+- sdb-gpios : (optional)
+  Specifier of the GPIO connected to SDB pin.
 
 LED sub-node properties:
 - reg : LED channel number (1..N)
@@ -31,6 +33,7 @@ is31fl3236: led-controller@3c {
 	reg = <0x3c>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	sdb-gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
 
 	led@1 {
 		reg = <1>;
-- 
2.17.1


