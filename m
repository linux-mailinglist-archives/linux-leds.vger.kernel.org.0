Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAE3A333618
	for <lists+linux-leds@lfdr.de>; Wed, 10 Mar 2021 08:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhCJHBC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Mar 2021 02:01:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhCJHAm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Mar 2021 02:00:42 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE4DC06174A;
        Tue,  9 Mar 2021 23:00:42 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id u18so24185705ljd.3;
        Tue, 09 Mar 2021 23:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v5ZZC/0Om+mEQFj9Ia0pAoMSzePO9tzxjFI9VQrdPvE=;
        b=rj3VCr3DLaMQ9RH30wQni2sJRlzEw0FeVRnbqdj+a7lGmDcGhPxgu1Jnxd5tEueWGO
         h97SLSbF+tkEcVP3D76rGGWnATxxzrTUYJccgWl37itPPw66A6aM458LTfEwi4soewX/
         6MGR272phgQAvyftM/VS1OU3UdIKmAX7GuJKT8zl+2wF0mvfO5Zryi8wtSLAaWah/U/t
         1avCBKTTr8/n0+qzJYssck4W+hHvjMoa4cCBrZJCYnVkZ0biLgEIjyXnDFvDTlTQalgJ
         agih4mp1vUmzzGZrM3c58qW8Wc8wGaWk7x7Pq1jYupRXX/ow8ZMIljPuGc4wkfxo1/I7
         H37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v5ZZC/0Om+mEQFj9Ia0pAoMSzePO9tzxjFI9VQrdPvE=;
        b=f+Fg3vqZG8WAVWUj/zhkNGvqbvFI5UmpD80YXMFL3P8ywQGVStKyjAj6qz+qevWRBt
         Wwzp3bEE2wmL/f5YMOPNhU+VVocZXJ6JixJsC6R95c1qN48UCY9iUAo9/TokLrRA6Ga/
         qyx6Kx7NxBx8flJW0dcF8n1yDRUpVTrUzcQ8Hx4kEUCAMfP5Cncz63Q9MWX5Fr6lGbws
         FU/BbPz6VUXX2GW+oralGbg+U9e1yI9jNhS1FEhoWkQvbBoy5ROOfucy3udC6DLP8pb8
         wKYN6RlytlyDUo03Daahbaje+HVklJrdkZOCsexxHfEa5K6GzyaeTx6Xx/uKHHDjkUfi
         xfrA==
X-Gm-Message-State: AOAM532CLJXchV+di99wm1qjgzXb61wCfVnnhnP/6b0Yh0EBPUgpJeSy
        Xge+eOapx6WSi8QZgvjrpBc=
X-Google-Smtp-Source: ABdhPJy6660A8QR/KZxGUr8B9lOyYeXFtZxBFusFwcc8BtdX2rvYOSD2raVjKBueCqs3lhoUHR5SHw==
X-Received: by 2002:a2e:3913:: with SMTP id g19mr591736lja.294.1615359640830;
        Tue, 09 Mar 2021 23:00:40 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id j15sm2575554lfm.138.2021.03.09.23.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 23:00:40 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: leds: leds-gpio: fix & extend node regex
Date:   Wed, 10 Mar 2021 08:00:25 +0100
Message-Id: <20210310070025.9150-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

The old regex allowed only 1 character to follow the "led-" prefix which
was most likely just an overlook. Fix it and while at it allow dashes in
node names. It allows more meaningful names and it helpful e.g. when
having the same function name with 2 different colors. For example:
1. led-power-white
2. led-power-blue

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/leds/leds-gpio.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
index 7ad2baeda0b0..ae46a43e480f 100644
--- a/Documentation/devicetree/bindings/leds/leds-gpio.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
@@ -21,7 +21,7 @@ properties:
 patternProperties:
   # The first form is preferred, but fall back to just 'led' anywhere in the
   # node name to at least catch some child nodes.
-  "(^led-[0-9a-f]$|led)":
+  "(^led-[0-9a-f][0-9a-f-]*$|led)":
     type: object
 
     $ref: common.yaml#
-- 
2.26.2

