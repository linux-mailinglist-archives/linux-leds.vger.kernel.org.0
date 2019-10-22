Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4022FE0707
	for <lists+linux-leds@lfdr.de>; Tue, 22 Oct 2019 17:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387814AbfJVPHV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Oct 2019 11:07:21 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36162 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387575AbfJVPHV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Oct 2019 11:07:21 -0400
Received: by mail-pg1-f194.google.com with SMTP id 23so10130678pgk.3;
        Tue, 22 Oct 2019 08:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MBSZDKa9xV4z2i+6bWwRnZbkMv2YTAGUd9qpSzUgq2U=;
        b=WQ+WxYKFio8mTUCpO6BaWvQmsWiqrfsB0lI8zXv39O8TU0oC7SCbUw4sQIq7eSluEA
         1IpSAHYd9iwge9Y/3NCIMz3u5ZFgJPA7WMqvfdzPkyjGduTPJF2O8XJ2dq4Eb5Vs9Edw
         9q9b+HZUN0x2Krro/9Fu7s+I8+6fToM/aQ/UEXK3dH1++D8Sj9nw9BtsDDZevo7MxcDp
         afYKftE9BcP3BWTeuoxxh2Fmv7TrP7E56X+34aT1lItYOTFMn9tVXMKaWs26Z2susd2z
         1wPE8E07+KvjNYYW6ILPHa//TdXaEewM/R6/we0tJlvjwEmu14kmQW8Hh+j2lowl+IcL
         Lqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MBSZDKa9xV4z2i+6bWwRnZbkMv2YTAGUd9qpSzUgq2U=;
        b=KHr5klNky8FbTExZ6RWura13IrDInXufujyrxDb9RAOD8TB6zPWsYO9zyjukZMnWg9
         9uzqf5QN2DlA1kYejk94Fi9TvtmrcqFdLpxMI+XhoAqUPxUz+S1lJPrH8F/idy/7xKHM
         ajlz9grdlmVZjk9+Ic9Wk8hbyam4Z7HWgqkixc28SbKvNCpQMGYlksdPIlPPpxyNyYOe
         Fdlbxnl01YsLozoCLPdOn2OJs9nTeWrezo3T0c/IFHSsH9sLaS+OyNWUq2EBky+ChGii
         aD2jTaCxANoB3BBMWEjd71LIUTPntB+Eq4rS19dZcgDnh4KkoOOUCaiy3vRyRJN61xcD
         PfZQ==
X-Gm-Message-State: APjAAAUg2PhQW/kMgtGGaOug0b8wI2QxWBecOQZXTuOQNu+LxOJzBg5D
        IhbNhKGdERYJGgnvQlSb7kJGRxnB
X-Google-Smtp-Source: APXvYqy75eUT9bI6FNEw/o5RLnWQH65cRFB1+vCj27mJwt1pKpJF/sburXnk3wvexABvZ8JScA/4QQ==
X-Received: by 2002:a17:90a:8d13:: with SMTP id c19mr5266993pjo.136.1571756840190;
        Tue, 22 Oct 2019 08:07:20 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id k66sm19882001pjb.11.2019.10.22.08.07.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 22 Oct 2019 08:07:19 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn@kryo.se>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] leds: meter: add leds-meter binding
Date:   Wed, 23 Oct 2019 00:06:52 +0900
Message-Id: <1571756812-19005-3-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571756812-19005-1-git-send-email-akinobu.mita@gmail.com>
References: <1571756812-19005-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add DT binding for leds-meter.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Bjorn Andersson <bjorn@kryo.se>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 .../devicetree/bindings/leds/leds-meter.yaml       | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-meter.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-meter.yaml b/Documentation/devicetree/bindings/leds/leds-meter.yaml
new file mode 100644
index 0000000..d5dfa261
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-meter.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-meter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic LED level meter
+
+maintainers:
+  - Akinobu Mita <akinobu.mita@gmail.com>
+
+description:
+  Generic LED level meter consists of multiple LED devices by different drivers.
+
+properties:
+  compatible:
+    const: meter-leds
+
+  leds:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    description: List of phandles to LED node that are members of a level meter.
+
+  brightness-weights:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    description: Each integer represents a contribution ratio within a level
+      meter.
+
+required:
+ - compatible
+ - leds
+
+examples:
+  - |
+    leds {
+        compatible = "meter-leds";
+        leds = <&led0>, <&led1>, <&led2>, <&led3>;
+        brightness-weights = <3 1 1 1>;
+    };
+
+...
-- 
2.7.4

