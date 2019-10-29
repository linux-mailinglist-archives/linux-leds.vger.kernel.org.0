Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE5AE88AD
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2019 13:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388006AbfJ2Ms0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Oct 2019 08:48:26 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46746 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728735AbfJ2Ms0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Oct 2019 08:48:26 -0400
Received: by mail-lj1-f194.google.com with SMTP id w8so10608373lji.13;
        Tue, 29 Oct 2019 05:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H5IjjkjqkM+cui4b134pQ1dIG4WEHbpH+XP2ak65H3I=;
        b=KpT2UtffyKfGyopW2sbTndkBF6BPdbMf15+6qlFfJ084//XET/eG2hAag9IsF+dwzz
         /vgTUfxVND3Rh3gSEByZsVAYlEz8v6Z4hpUiommP5P7EypOLYePXZJMJTdgY9O629Wtj
         JNBDOELMiYazkxqgZYeHgdhuWPdZWx2MflZePFVAotFkRpZxaG2UTv2KerN2kbxcGs7a
         Vvmh9KOd20g9r23oVo5ZiwfPAfP/xCLDR0PeWb5fvJmTWjs5c5aDi73e5gXGUsXeGEfq
         6LxylTVp+l7vUO2SfY41mvoErldiM+PKHJ4NwA1wys3nhkF15vNHMU0LgaYLcXWBm169
         POGw==
X-Gm-Message-State: APjAAAWoyEBrNz7RfnL/FvSIMmlb4fN4/HoMw8EktT0DS6xcIZsvelT9
        kipNStm0QIcRju3GQZbrMOs=
X-Google-Smtp-Source: APXvYqy4OsMdUjSkD96/aN4cxAwD7hbaqhesfGUgTcNpXVxwyLm+RZ8yNt2quaroqcQOf4GZqrSyRQ==
X-Received: by 2002:a2e:481:: with SMTP id a1mr2604149ljf.209.1572353304285;
        Tue, 29 Oct 2019 05:48:24 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id g5sm6906406ljk.22.2019.10.29.05.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 05:48:23 -0700 (PDT)
Date:   Tue, 29 Oct 2019 14:48:12 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/5] dt-bindings: lm3692x: example for using fixed LED
 node names.
Message-ID: <5c90e1610725869967f84f1c680990f17399ccb2.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use predefined LED node name to match the LED node in driver.

It would be nice to offload common LED property parsing to
LED core driver. One of the key things to allow this is somehow
'pair' the LED DT node with LED driver initialization data.

This patch uses LED node name as a 'key' in a same fashion
as regulators do. The lm3692x was selected as demonstration
example and this change is not intended to be feasible as such
(surprize =]) This servers just as an example to initiate
discussion as to how (if) we could pair the driver data and DT
node.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
index 4c2d923f8758..03866d491d01 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
@@ -5,7 +5,7 @@ white-LED driver designed for LCD display backlighting.
 
 The main difference between the LM36922 and LM36923 is the number of
 LED strings it supports.  The LM36922 supports two strings while the LM36923
-supports three strings.
+supports three strings. LED sub-node must be named as "led_node_name_here".
 
 Required properties:
 	- compatible:
@@ -45,7 +45,7 @@ led-controller@36 {
 	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 	vled-supply = <&vbatt>;
 
-	led@0 {
+	led_node_name_here {
 		reg = <0>;
 		function = LED_FUNCTION_BACKLIGHT;
 		color = <LED_COLOR_ID_WHITE>;
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
