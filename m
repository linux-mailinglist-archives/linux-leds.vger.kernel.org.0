Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C302513D5
	for <lists+linux-leds@lfdr.de>; Tue, 25 Aug 2020 10:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgHYIIo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Aug 2020 04:08:44 -0400
Received: from m12-11.163.com ([220.181.12.11]:38465 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbgHYIIn (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 25 Aug 2020 04:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=G2OJv28gTelM13Lm7C
        9HowOCR4AZItrH4dcNL0B8Ex8=; b=nr6iwu32JLeJPujrfQrjdLIEqvGaA/9WOa
        sB7vj8yTUGjs6XKZ41b8sHuLY31Eunc3qypQTehB4etoUO6NmyE8Sk9Iu+57jM2N
        0nv4346fSSa8SPOaEGBTD7ZLi9rNxmJbuB7tS+9VhPNe8O+t78uQBCIc5g+kmTWK
        nm5ESjVEs=
Received: from localhost.localdomain (unknown [58.33.102.45])
        by smtp7 (Coremail) with SMTP id C8CowAD3rDXqxkRfAWr+DA--.63807S3;
        Tue, 25 Aug 2020 16:08:17 +0800 (CST)
From:   Grant Feng <von81@163.com>
To:     von81@163.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] leds: Add an optional property named 'shutdown-gpios'
Date:   Tue, 25 Aug 2020 16:07:58 +0800
Message-Id: <20200825080758.5283-2-von81@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825080758.5283-1-von81@163.com>
References: <20200825080758.5283-1-von81@163.com>
X-CM-TRANSID: C8CowAD3rDXqxkRfAWr+DA--.63807S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw4fCFWfXFW7XFy3XrWfAFb_yoWkJFb_Ja
        4xCr4IgFZ8uF4vg3WDZr1avr48Cw4xAr1DCa1IqF18Zw1xt3sIgF92qw1Yyr1UGana9r13
        Ca97KFyUJ3ZrKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0AcTDUUUUU==
X-Originating-IP: [58.33.102.45]
X-CM-SenderInfo: xyrqmii6rwjhhfrp/1tbiNxKLOlWBhwgskQAAsy
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
index 926c2117942c..ee761abb98a7 100644
--- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
+++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
@@ -15,6 +15,8 @@ Required properties:
 - reg: I2C slave address
 - address-cells : must be 1
 - size-cells : must be 0
+- shutdown-gpios : (optional)
+  Specifier of the GPIO connected to SDB pin of the chip.
 
 LED sub-node properties:
 - reg : LED channel number (1..N)
@@ -31,6 +33,7 @@ is31fl3236: led-controller@3c {
 	reg = <0x3c>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
 
 	led@1 {
 		reg = <1>;
-- 
2.17.1


