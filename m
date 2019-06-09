Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF4D3AB82
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731158AbfFITJ6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:09:58 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33805 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730121AbfFITIx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:53 -0400
Received: by mail-wr1-f66.google.com with SMTP id e16so7006162wrn.1;
        Sun, 09 Jun 2019 12:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1REZxe3P1+JW6Xm7KwYXE71LWPK1YU+cJhkDympEObA=;
        b=iAg78eDjDTX6pcg8tWePERcY/I449Qb7CLzf9AwMe6mae+GqbyBtNAROHVvkqVya1O
         KgmCLfaF2OcNG5t1yjFD+MjTyvb0dbdp+jreT2K4kyRsnKw+0psGwgRncEMg+TYc8VG/
         rS1Zln3vazU1vfjegl3P1FNcJRkmznYJ/Bx+qPNCHooN8zF6t7S4qCs3uvBQjDPmXCP+
         XQmPPULRrGBC08jZPyGvxu+6Du7vdNz+4jeBDux22tF4NutvMUzj9eCsB2kbOZhK+7wH
         BVAzULeJzzgSidzsBjxIyYrt9gdpkMiHa1GY2db/Vc4QF0Gf2fv6fTnSwv/vosSAJJP0
         5r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1REZxe3P1+JW6Xm7KwYXE71LWPK1YU+cJhkDympEObA=;
        b=RGxK2zgpKngvNHVxr5X9TGX5qq+Xbz55DFxRy6QrkD62x4HyTAIngFbbyi3HwkWGDm
         zgrqyn4HhXoW8C5H4cbaMtlPiseAPZm2k/b6wnSAIk7usx62SQFV6erh3eWUyje8O0E5
         qByMx8OQj1yTvGxHoN58y5zKm5MG4QDwg+nUHmYb3MkLegNxDftntxde15eVW/z/d74U
         arKxCuPLfmygm3v7HW/2pkCkBKcLJ1UahRdDonPOUXMqyzGB8rVsIIufpnDt7iL4Q6kf
         mW+RF5eXu+kOppI5QSz6xPG7aSABoC3hpW2Gwkv5iS0vocMtw+XMlNvmS+3sVZxsgYFh
         44Cg==
X-Gm-Message-State: APjAAAXOV2uWtFB+3cvlLDLLZIWWqUM0yu3HD7Y87zTyw6wcpcsyUsuZ
        u4vPKxuUkA8n9piemyk4e4W7sqK8
X-Google-Smtp-Source: APXvYqwKlhzr8/ctM7Lmu7hNCO7SOJJbF8dXA4Pa6L8RtpPF+LWREmzNcyAK4dM6MrMCqpSJWT9kVQ==
X-Received: by 2002:a5d:52c7:: with SMTP id r7mr40896040wrv.110.1560107331458;
        Sun, 09 Jun 2019 12:08:51 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:50 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com
Subject: [PATCH v5 14/26] dt-bindings: lm36010: Add function and color properties
Date:   Sun,  9 Jun 2019 21:07:51 +0200
Message-Id: <20190609190803.14815-15-jacek.anaszewski@gmail.com>
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
Reviewed-by: Dan Murphy <dmurphy@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/leds/leds-lm3601x.txt | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3601x.txt b/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
index a88b2c41e75b..095dafb6ec7f 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
@@ -22,9 +22,14 @@ Required properties for flash LED child nodes:
 	- led-max-microamp : Range from 2.4mA - 376mA
 
 Optional child properties:
-	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- function : see Documentation/devicetree/bindings/leds/common.txt
+	- color : see Documentation/devicetree/bindings/leds/common.txt
+	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
 
 Example:
+
+#include <dt-bindings/leds/common.h>
+
 led-controller@64 {
 	compatible = "ti,lm36010";
 	#address-cells = <1>;
@@ -33,7 +38,8 @@ led-controller@64 {
 
 	led@0 {
 		reg = <1>;
-		label = "white:torch";
+		function = LED_FUNCTION_TORCH;
+		color = <LED_COLOR_ID_WHITE>;
 		led-max-microamp = <376000>;
 		flash-max-microamp = <1500000>;
 		flash-max-timeout-us = <1600000>;
-- 
2.11.0

