Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D97563AB68
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730537AbfFITI6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:08:58 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37315 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730513AbfFITI5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:57 -0400
Received: by mail-wm1-f67.google.com with SMTP id 22so6177493wmg.2;
        Sun, 09 Jun 2019 12:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wLfBGSpG5kcjtADXYpGO9iKtzL6iCob5R6RB66c3aK4=;
        b=lrQiHLPWn3Ibg7b6JlpAEDyb8MJASMKOQoLT+7NZmZUm6mUllw9rd6eUaJMWUQw10L
         jue6OujvfczL9Sz0RZ1tl7kgEUN/vT6Y57at2PPTcKVjsuCd98WM1Y4sNKa7uemjnck7
         dJmud9Yw5RRNDOSBA7F3r1AQ+0jcPDl6TAPLaz76EqmhgmaVKmJZebpyi53KwLbatcl/
         llThF23MaLInqYQyQ8dsAD7pojmoFBl8d9orPEfUZ52Va77waUEJatZtF9Ql8iiLGo6i
         iHKsv425+QoOkP/orRNQ0Prt6g2Sv2d48duzOkiHZPV++P/XgvZ7qx252dGZoID1eQgA
         Aw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wLfBGSpG5kcjtADXYpGO9iKtzL6iCob5R6RB66c3aK4=;
        b=HZDQdoUWq9opfVyLKPDd6Bqd48YsLvCW+PQ6ZcFcRhg/EuBPxQq96vukAWbiGextv9
         SGjKyCNeLOSFcEJ7yMNITTbAair4o9Eau0W4MTOXB4R86AsKaodELWAePlTr7jL1DQAV
         4ee5ZoOzm+uS6VI4Uagh2nDkJdJOSgaOWMCp8xCHygzrh18CJH2/Sf7keq/I0BGThnL4
         PahntIgUijSIgT5grMfsf7mZ+MgeOxV7nmVH56ephTcPcCah6hBbgrJ0g0SWxfs9w/Mw
         +leI6m7qbPaCTL0YBRk/4PyDTgzbmkdRJdA5SupT4b7hb0VByUbpEBlUTJfYukzIZbUg
         i6hw==
X-Gm-Message-State: APjAAAVUcU3y3kPG9lWwHwYt0uMOeUs2Yw7sAx5Tepxu8ioER8QLM1Bk
        feeAFmyo/YIj5V+sbapMRtP3+KTX
X-Google-Smtp-Source: APXvYqwd+a/5/UOK4C4OhnaZpV5dOz32BwQ8m/Y44jf4wJpNxp04wuocGikXsCENyNOU2P0wU7hX7A==
X-Received: by 2002:a1c:40c6:: with SMTP id n189mr10611700wma.118.1560107335228;
        Sun, 09 Jun 2019 12:08:55 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:54 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v5 16/26] dt-bindings: cr0014114: Add function and color properties
Date:   Sun,  9 Jun 2019 21:07:53 +0200
Message-Id: <20190609190803.14815-17-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-cr0014114.txt    | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
index 4255b19ad25c..f8de7516a39b 100644
--- a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
+++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
@@ -11,14 +11,20 @@ Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
 apply. In particular, "reg" and "spi-max-frequency" properties must be given.
 
 LED sub-node properties:
-- label :
+- function :
+	see Documentation/devicetree/bindings/leds/common.txt
+- color :
 	see Documentation/devicetree/bindings/leds/common.txt
+- label :
+	see Documentation/devicetree/bindings/leds/common.txt (deprecated)
 - linux,default-trigger : (optional)
 	see Documentation/devicetree/bindings/leds/common.txt
 
 Example
 -------
 
+#include <dt-bindings/leds/common.h>
+
 led-controller@0 {
 	compatible = "crane,cr0014114";
 	reg = <0>;
@@ -28,27 +34,33 @@ led-controller@0 {
 
 	led@0 {
 		reg = <0>;
-		label = "red:coin";
+		function = "coin";
+		color = <LED_COLOR_ID_RED>;
 	};
 	led@1 {
 		reg = <1>;
-		label = "green:coin";
+		function = "coin";
+		color = <LED_COLOR_ID_GREEN>;
 	};
 	led@2 {
 		reg = <2>;
-		label = "blue:coin";
+		function = "coin";
+		color = <LED_COLOR_ID_BLUE>;
 	};
 	led@3 {
 		reg = <3>;
-		label = "red:bill";
+		function = "bill";
+		color = <LED_COLOR_ID_RED>;
 	};
 	led@4 {
 		reg = <4>;
-		label = "green:bill";
+		function = "bill";
+		color = <LED_COLOR_ID_GREEN>;
 	};
 	led@5 {
 		reg = <5>;
-		label = "blue:bill";
+		function = "bill";
+		color = <LED_COLOR_ID_BLUE>;
 	};
 	...
 };
-- 
2.11.0

