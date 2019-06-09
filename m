Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCA953AB7C
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729568AbfFITJp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:09:45 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40618 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730568AbfFITJB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:09:01 -0400
Received: by mail-wr1-f66.google.com with SMTP id p11so6975630wre.7;
        Sun, 09 Jun 2019 12:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZGGI8+XNPQ/mhBqa4ZeZnzYhQSPJlhcGCoMTR20evDo=;
        b=n+kin/zCZ1SP9XdEMhLhVA+RaSdpD6BmQG/pggrZbOGrPKfjGJPVbgHxL37V7UuqaX
         LiRI2foflgnt9Pg4DITvSef4dsksfOWnjdgZGDH/ErpGHw/40dySblC//z9uyF5uzm9r
         DeCJwH+cG2uY6WaHxJ02f/Yf3LZpF7IP9MMWqJg35hM/SNCsgVXc5CbLBpGR6jGGzsVl
         eYd2udMAybHvsl1XiHYH/t2sCBIfCX3DQ67Mg6RUk1J77eAOEob9mCYMOHek7CmI1u2K
         tMOXlLFMbeWDuLZg2H9f3xG7tyLEpirsoxO2HENt070Ra3bFlRQqehLvUNuOAkeCL2xW
         96Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZGGI8+XNPQ/mhBqa4ZeZnzYhQSPJlhcGCoMTR20evDo=;
        b=jyjZ/I8C7HjGWFfqVQP5HkLrEFc5OrQzlmSq8Fg/ym5xFKN/bg1lqSkWZSvxLSko2r
         89sTa9Z3dky1KMbjM1gMwkf9r5ujgDgC9EBeV3SZ3gfHL6CCWb3EfzX8PDiCp5JF6M62
         18YZ+etBJic0YkS7YstQ+ISlDR4Wlx/oyQbuAcycsTkVq/UGv1f5FVffyrrB13mzYhme
         mQgIb0ZhZ+x8u/zb7yxFQp2eqNDC2A6vGKvVfYvL4JBeCXltu6c4dKHGhk7DreA3QlZ4
         1yKM4KBOFR/4s2dnQuStsaVhxBUA/iuvEWyRGZFpq0A+j0oaUwkhByUj0/PfFBYuF7+R
         ZOvA==
X-Gm-Message-State: APjAAAUlRi74wzRWHL2bv+sK1nMYk9GkzIlLnrtWMnrM107wXzP0KIXq
        DC9t4YHeZCN5yeSDkSo2BEYYMFqw
X-Google-Smtp-Source: APXvYqy5jYBINbeYVM7VbKB1ilMkmKAX/S4S3DAT7SFNbXh8MMbYbaveFSqCRjBEsgvWdzzo0ow00g==
X-Received: by 2002:a5d:6652:: with SMTP id f18mr26275372wrw.19.1560107339363;
        Sun, 09 Jun 2019 12:08:59 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:58 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com
Subject: [PATCH v5 18/26] dt-bindings: aat1290: Add function and color properties
Date:   Sun,  9 Jun 2019 21:07:55 +0200
Message-Id: <20190609190803.14815-19-jacek.anaszewski@gmail.com>
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
---
 Documentation/devicetree/bindings/leds/leds-aat1290.txt | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-aat1290.txt b/Documentation/devicetree/bindings/leds/leds-aat1290.txt
index 85c0c58617f6..62ed17ec075b 100644
--- a/Documentation/devicetree/bindings/leds/leds-aat1290.txt
+++ b/Documentation/devicetree/bindings/leds/leds-aat1290.txt
@@ -32,15 +32,18 @@ Required properties of the LED child node:
                          formula: T = 8.82 * 10^9 * Ct.
 
 Optional properties of the LED child node:
-- label : see Documentation/devicetree/bindings/leds/common.txt
+- function : see Documentation/devicetree/bindings/leds/common.txt
+- color : see Documentation/devicetree/bindings/leds/common.txt
+- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
 
 Example (by Ct = 220nF, Rset = 160kohm and exynos4412-trats2 board with
 a switch that allows for routing strobe signal either from the host or from
 the camera sensor):
 
 #include "exynos4412.dtsi"
+#include <dt-bindings/leds/common.h>
 
-aat1290 {
+led-controller {
 	compatible = "skyworks,aat1290";
 	flen-gpios = <&gpj1 1 GPIO_ACTIVE_HIGH>;
 	enset-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
@@ -50,8 +53,9 @@ aat1290 {
 	pinctrl-1 = <&camera_flash_host>;
 	pinctrl-2 = <&camera_flash_isp>;
 
-	camera_flash: flash-led {
-		label = "aat1290-flash";
+	camera_flash: led {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
 		led-max-microamp = <520833>;
 		flash-max-microamp = <1012500>;
 		flash-max-timeout-us = <1940000>;
-- 
2.11.0

