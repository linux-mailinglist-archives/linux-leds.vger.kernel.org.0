Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D2D269AC4
	for <lists+linux-leds@lfdr.de>; Tue, 15 Sep 2020 02:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgIOAzB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Sep 2020 20:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgIOAyz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Sep 2020 20:54:55 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35664C06174A;
        Mon, 14 Sep 2020 17:54:53 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 61231140AAB;
        Tue, 15 Sep 2020 02:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600131291; bh=MQum99TWcQMrKlutmkZwqmCQqTf8b/pDL4qSj7Kc4FE=;
        h=From:To:Date;
        b=W9rYftJZmVkosMqwwYHD6p0R28CNfSqsFtGkNqPMrI3PIbh8NsdTIPA81PE8QrvmZ
         qOSwByCoDaLYq8+MIfXcxtEXl7K4INo0k54mnJgZxdr8CTKXWOETtMD6pdD4vhf0xz
         xRvERZt94kI3GxUNJIJux+A32971kEixYMfh4Qhg=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH leds] dt-bindings: leds: cznic,turris-omnia-leds: fix error in binding
Date:   Tue, 15 Sep 2020 02:54:26 +0200
Message-Id: <20200915005426.15957-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There is a bug in the device tree binding for cznic,turris-omnia-leds
which causes make dt_binding_check to complain.

The reason is that the multi-led property binding's regular expression
does not contain the `@` character, while the example nodes do.

Fix this, and also allow for longer address in property name.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>
---
 .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
index 24ad1446445ea..486ab27d75f2f 100644
--- a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
+++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
@@ -30,7 +30,7 @@ properties:
     const: 0
 
 patternProperties:
-  "^multi-led[0-9a-f]$":
+  "^multi-led@[0-9a-f]+$":
     type: object
     allOf:
       - $ref: leds-class-multicolor.yaml#
-- 
2.26.2

