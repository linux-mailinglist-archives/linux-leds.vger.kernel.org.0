Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F78317EA29
	for <lists+linux-leds@lfdr.de>; Mon,  9 Mar 2020 21:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgCIUgo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Mar 2020 16:36:44 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:57364 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726266AbgCIUg3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 9 Mar 2020 16:36:29 -0400
Received: from localhost.localdomain (80-110-126-226.cgn.dynamic.surfer.at [80.110.126.226])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id C62F4C3FCA;
        Mon,  9 Mar 2020 20:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1583786187; bh=OHuOuAn8dDK8twim3X48JfmlWA8R2S+SMV+iVj445pE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=lS7kCk0CvDscR40c2+DWE5YXM1+8WXBRYev7dEzrcsoaNZ8LIZF4e+NHiUewURAem
         cN5C9tA0vP6D5v61lUqar9pPb1iJXo1xyJUUtroTTJWQ4PWBw5L8JdVN1Yxc6Z+OX3
         VUFSobg9lJrwz9HTrS1h3YvuNwfMkiBtE/DBPDoM=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-leds@vger.kernel.org
Cc:     Dan Murphy <dmurphy@ti.com>, Heiko Stuebner <heiko@sntech.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 1/3] dt-bindings: Add vendor prefix for SG Micro Corp
Date:   Mon,  9 Mar 2020 21:35:56 +0100
Message-Id: <20200309203558.305725-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200309203558.305725-1-luca@z3ntu.xyz>
References: <20200309203558.305725-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

"SG Micro Corp (SGMICRO) specializes in high performance, high quality
analog IC design, marketing and sales." (http://www.sg-micro.com/)

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes since RFC:
- new patch

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 8d306af435a3..059ff7bc0c79 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -843,6 +843,8 @@ patternProperties:
     description: Small Form Factor Committee
   "^sgd,.*":
     description: Solomon Goldentek Display Corporation
+  "^sgmicro,.*":
+    description: SG Micro Corp
   "^sgx,.*":
     description: SGX Sensortech
   "^sharp,.*":
-- 
2.25.1

