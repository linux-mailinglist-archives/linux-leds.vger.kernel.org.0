Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CED063AB52
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730176AbfFITIr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:08:47 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38760 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729776AbfFITIr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:47 -0400
Received: by mail-wr1-f65.google.com with SMTP id d18so6975915wrs.5;
        Sun, 09 Jun 2019 12:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dTlh5qePS5SClnGZawHQ38y8XHKIBj+B7pxOigaHFYY=;
        b=a8CuYfRtVT1iU3APdY1+UCjXWgMNDXV7OLFmDl/+yVg9RG26lirUjDe673rXy51uu4
         XB/ahOc2BJXwoGfkCVJ913THDDLJCifzeD9X4iLEivppALoXXFpJbBQ5sp671gvQcXl+
         vtIr+NFF4mZfXOvrPJygXgu6dSrOFpnQ0Aq+ap5pBFG3XgA04JNL51t8xipU2q7/vRzD
         xwVYTtvMeZNN9FImlnWAxAiynUKIETPRn3rppZScSVDCzo6a550YneKZog70JMoHoL8K
         VmpSle3JeAvL1Ol6+II+Ifg3+yZpYx7z0u+p72xdb8pvJeGx0heln0gOqo1XXHOumAVb
         Aurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dTlh5qePS5SClnGZawHQ38y8XHKIBj+B7pxOigaHFYY=;
        b=JuNVR3ato9xkHkaGbIBWD1mYjjA2JgRJLycLwRIxUBbtJjEa2U0LLtRwj3nx59H1nS
         1Z0bFKwp/vQrvjwliSIzxMrXHloEjCGOk9HRNdmnJc0dY4LRRATleuAs5s6YpK8JbcHN
         LxElF9UMfKT3/fXa/JdAGjYenX9UbazHzzT/AO+ZKAUFRiDIqgw/VZoZtbxdHeGkI+Eq
         Vh+shu9hE2/BCcKGO5lVh6OwKDEyIIjBxCZBVs20TELphuy3Uw+ob5DZ+/oVrCOVB60/
         RsegUwmgSEhPn1MwbWEH+UvdLC1cjdg9Pq4hE8CG+jVCiIcv0zM7z+VJ6Hf4LF0dyMVA
         RZVg==
X-Gm-Message-State: APjAAAVAM63bcRTasiZWNNNKb1HuBFa3BKn/o3+XKnSbO4hvQtEAHSgO
        cOfncw/NOeVAr5V+r+gjyLclRFw2
X-Google-Smtp-Source: APXvYqwvy6VauZ5pUiRrjwlGDMH2ncgq5SIsOHdoxV8cXYgzP0rgSfdqsFjYRjyL+baMfaqXb61WoA==
X-Received: by 2002:adf:e2c3:: with SMTP id d3mr14797877wrj.314.1560107324956;
        Sun, 09 Jun 2019 12:08:44 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:44 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com
Subject: [PATCH v5 10/26] dt-bindings: lp8860: Add function and color properties
Date:   Sun,  9 Jun 2019 21:07:47 +0200
Message-Id: <20190609190803.14815-11-jacek.anaszewski@gmail.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Dan Murphy <dmurphy@ti.com>
---
 Documentation/devicetree/bindings/leds/leds-lp8860.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index 5f0e892ad759..9863220db4ba 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
@@ -20,12 +20,16 @@ Required child properties:
 	- reg : 0
 
 Optional child properties:
-	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- function : see Documentation/devicetree/bindings/leds/common.txt
+	- color : see Documentation/devicetree/bindings/leds/common.txt
+	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
 	- linux,default-trigger :
 	   see Documentation/devicetree/bindings/leds/common.txt
 
 Example:
 
+#include <dt-bindings/leds/common.h>
+
 led-controller@2d {
 	compatible = "ti,lp8860";
 	#address-cells = <1>;
@@ -36,7 +40,8 @@ led-controller@2d {
 
 	led@0 {
 		reg = <0>;
-		label = "white:backlight";
+		function = LED_FUNCTION_BACKLIGHT;
+		color = <LED_COLOR_ID_WHITE>;
 		linux,default-trigger = "backlight";
 	};
 }
-- 
2.11.0

