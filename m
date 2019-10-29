Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47A29E88A5
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2019 13:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387851AbfJ2Mrh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Oct 2019 08:47:37 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35202 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733206AbfJ2Mrh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Oct 2019 08:47:37 -0400
Received: by mail-lj1-f194.google.com with SMTP id m7so15127129lji.2;
        Tue, 29 Oct 2019 05:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OywAa/Wh8Fm343vqCkC5f2sTAIa0gIrZIUYIplehcos=;
        b=AZPWfXJfAu5lhRyeq31OLXpw56fx8ThtkH1kOrt9gX5B5l4DkRZBrUil9COzLBXOr5
         lqUoIxIl/4c34WNwRM0cFObHhHyBHXcV0wCjUEM5m0jvSfx6tMDebi5AOkyVwIEoUyzE
         XmORAI3dInXxj7mFSjFb4Locd4VmilLFwQ6wg01FI84GA+mmyFliKz8QuszvLb/qNViR
         jvwY9W9BpijcfUNvmq6yFSFkK0fXwp020YMBHWQYJu1axUaaPRBnOARZcpqkExcP1vlE
         Z1euINfOUgwEN7mfD6lKSnVQhXBNuXzhqOX3B3gCFsEpe72CKXDOphd2wJv9VmOBic0l
         iuwA==
X-Gm-Message-State: APjAAAWPgE5MhY+pYLBREG6i2601OjvtjDcloaVG56cs/wzF7H65vH9J
        2uZfvbHuyFWmbwJS2f0K9h8=
X-Google-Smtp-Source: APXvYqz3KOrNCPv19g707lVMFVblbBiUMnyAwQ7zp6WrerCE97y+DEoSLjJp5M6MwVtGyvxf0zDC9w==
X-Received: by 2002:a2e:420a:: with SMTP id p10mr2662653lja.16.1572353254415;
        Tue, 29 Oct 2019 05:47:34 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id i128sm8918346lfd.6.2019.10.29.05.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 05:47:33 -0700 (PDT)
Date:   Tue, 29 Oct 2019 14:47:26 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/5] dt-bindings: an30259a: example for using fixed LED
 node names.
Message-ID: <5b9f9e7cd3dc959962fc43d27e471245e63f5f29.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
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
as regulators do. The an30259a was selected as demonstration
example and this change may not be really feasible for an30259a
as I have no idea whether the existing DTs for devices out there
have specific node names (or can be changed). This servers just
as an example to initiate discussion as to how we could pair the
driver data and DT node.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 Documentation/devicetree/bindings/leds/leds-an30259a.txt | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-an30259a.txt b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
index cbd833906b2b..bd1a2d11a0ad 100644
--- a/Documentation/devicetree/bindings/leds/leds-an30259a.txt
+++ b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
@@ -9,7 +9,8 @@ Required properties:
 	- #address-cells: Must be 1.
 	- #size-cells: Must be 0.
 
-Each LED is represented as a sub-node of the panasonic,an30259a node.
+Each LED is represented as a sub-node of the panasonic,an30259a node. LED nodes
+must be named as led1 led2 and led3.
 
 Required sub-node properties:
 	- reg: Pin that the LED is connected to. Must be 1, 2, or 3.
@@ -34,20 +35,20 @@ led-controller@30 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	led@1 {
+	led1 {
 		reg = <1>;
 		linux,default-trigger = "heartbeat";
 		function = LED_FUNCTION_INDICATOR;
 		color = <LED_COLOR_ID_RED>;
 	};
 
-	led@2 {
+	led2 {
 		reg = <2>;
 		function = LED_FUNCTION_INDICATOR;
 		color = <LED_COLOR_ID_GREEN>;
 	};
 
-	led@3 {
+	led3 {
 		reg = <3>;
 		function = LED_FUNCTION_INDICATOR;
 		color = <LED_COLOR_ID_BLUE>;
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
