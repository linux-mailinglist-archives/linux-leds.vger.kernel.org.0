Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 566F111C400
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 04:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbfLLDkD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Dec 2019 22:40:03 -0500
Received: from mx2.suse.de ([195.135.220.15]:58556 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727641AbfLLDkD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Dec 2019 22:40:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id EADCCAE40;
        Thu, 12 Dec 2019 03:40:01 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        sales@fdhisi.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [RFC 11/25] dt-bindings: leds: tm1628: Add Fuda Hisi Microelectronics FD628
Date:   Thu, 12 Dec 2019 04:39:38 +0100
Message-Id: <20191212033952.5967-12-afaerber@suse.de>
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

Add a compatible string for FD628.

Cc: sales@fdhisi.com
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml b/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
index 024875656e79..3f2cc4cec04d 100644
--- a/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
+++ b/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+    - fdhisi,fd628
     - titanmec,tm1628
 
   reg:
-- 
2.16.4

