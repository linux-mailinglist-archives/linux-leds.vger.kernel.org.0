Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE643AB6D
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730680AbfFITJG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:09:06 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46143 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730367AbfFITJF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:09:05 -0400
Received: by mail-wr1-f67.google.com with SMTP id n4so6933390wrw.13;
        Sun, 09 Jun 2019 12:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r6aBBYHFZw+wLKTYMr8fmPQAN4BPkiDFppaKmykjpMw=;
        b=kNEoJcZt5nsXjy8JVCX4nA/RHPOc0ZzeIMHnG33F/fcUuBjub+baEwb5FhMnyB9XOg
         DQrjEY9ixDso5jtUQdcWtTSXMhSUtieeIv0BogGcvmeFPy6+rdv1jAp7cEMotcviMF3d
         fQRF1frCxNHAsjJzjBXPkPiSUp8UQmQvHW+3W8TdfF6LlUzo4MzcaTyxfTplATplB/cd
         YCwithQ/wP7/GDCw/Ysnx+qz+WiDMDSk4eWWLxo0jlzsDdKQ0BsayJKMiPj0H77pJdmw
         /7oXJER8F1lmdQGjRq0i0NN2wzAKv3305XQPfZ/Wmjeu8TqkLYeCvW+0pwfhWX5AnPHR
         /hKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r6aBBYHFZw+wLKTYMr8fmPQAN4BPkiDFppaKmykjpMw=;
        b=ZeEVYpkBbU0OafR7tDLi3LnQmIeDybAUZheLSW0rFv90uXgDjnvRxm4uSqY2E7eH7v
         aZt96K/OprnKLFaP/XU7+STHe5n1hufOyB87BubQe7spe3pxxYmO4byQ5hnua2o/awcO
         acQBNzPxRFLJ+AIb/qv7/DuA3iNZwheawEPFEwPYoaw/KWWpCXEN35Fa8DZplzPjEJz1
         ZKTnPABTjy0jviREmVdjUlQ3q6HCrxM8nBKBwg2EtvFuClT7EZ1RlJXSDXBGl7Im1k2f
         0fRzdNmYMFLeQWaE4/h1t4XEeuV+ST5jnqPIK0rVUvUpQh/1QyT55N75fjWpb3favprY
         XgtA==
X-Gm-Message-State: APjAAAUZGqdiROWnFiWQPBPQxEXgWU6zG8P0+SjKLZq821zCVDAt68+V
        z0PCGT2kZj8nxfaNtWVHRKZw2kus
X-Google-Smtp-Source: APXvYqyU5eUlQZsS32OOz7DzSerG7e4yvNUwoYFs+8SDfidlSOpLRe+hf3XlguNtVW6f8fAO/x1hEA==
X-Received: by 2002:adf:b60f:: with SMTP id f15mr17412155wre.283.1560107342968;
        Sun, 09 Jun 2019 12:09:02 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.09.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:09:02 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v5 20/26] dt-bindings: as3645a: Add function and color properties
Date:   Sun,  9 Jun 2019 21:07:57 +0200
Message-Id: <20190609190803.14815-21-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Also, fix malformed syntax of address-cells and size-cells
in the example.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/leds/ams,as3645a.txt       | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.txt b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
index fdc40e354a64..4af2987b25e9 100644
--- a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
+++ b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
@@ -39,7 +39,9 @@ ams,input-max-microamp: Maximum flash controller input current. The
 Optional properties of the flash child node
 ===========================================
 
-label		: The label of the flash LED.
+function	:  See Documentation/devicetree/bindings/leds/common.txt.
+color		:  See Documentation/devicetree/bindings/leds/common.txt.
+label		:  See Documentation/devicetree/bindings/leds/common.txt (deprecated).
 
 
 Required properties of the indicator child node (1)
@@ -52,28 +54,32 @@ led-max-microamp: Maximum indicator current. The allowed values are
 Optional properties of the indicator child node
 ===============================================
 
-label		: The label of the indicator LED.
+function	:  See Documentation/devicetree/bindings/leds/common.txt.
+color		:  See Documentation/devicetree/bindings/leds/common.txt.
+label		:  See Documentation/devicetree/bindings/leds/common.txt (deprecated).
 
 
 Example
 =======
 
+#include <dt-bindings/leds/common.h>
+
 	as3645a@30 {
-		#address-cells: 1
-		#size-cells: 0
+		#address-cells = <1>;
+		#size-cells = <0>;
 		reg = <0x30>;
 		compatible = "ams,as3645a";
-		flash@0 {
+		led@0 {
 			reg = <0x0>;
 			flash-timeout-us = <150000>;
 			flash-max-microamp = <320000>;
 			led-max-microamp = <60000>;
 			ams,input-max-microamp = <1750000>;
-			label = "as3645a:flash";
+			function = LED_FUNCTION_FLASH;
 		};
-		indicator@1 {
+		led@1 {
 			reg = <0x1>;
 			led-max-microamp = <10000>;
-			label = "as3645a:indicator";
+			function = LED_FUNCTION_INDICATOR;
 		};
 	};
-- 
2.11.0

