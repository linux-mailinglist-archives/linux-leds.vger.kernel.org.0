Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5B2611C424
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 04:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727743AbfLLDk5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Dec 2019 22:40:57 -0500
Received: from mx2.suse.de ([195.135.220.15]:58662 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727551AbfLLDkF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Dec 2019 22:40:05 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 50BA0AECA;
        Thu, 12 Dec 2019 03:40:04 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [RFC 16/25] dt-bindings: leds: tm1628: Add Fude Microelectronics AiP1618
Date:   Thu, 12 Dec 2019 04:39:43 +0100
Message-Id: <20191212033952.5967-17-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191212033952.5967-1-afaerber@suse.de>
References: <20191212033952.5967-1-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Define a compatible string for AiP1618 chipset.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 @Rob: This one would conditionally need to further restrict reg ranges then.
 
 Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml b/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
index 3f2cc4cec04d..50205e3c3624 100644
--- a/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
+++ b/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
     - fdhisi,fd628
+    - szfdwdz,aip1618
     - titanmec,tm1628
 
   reg:
-- 
2.16.4

