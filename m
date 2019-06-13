Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 301E543C71
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2019 17:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbfFMPf0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Jun 2019 11:35:26 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34868 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbfFMKXY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Jun 2019 06:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=CdLBRYvVCv2xx4Vg1tCPu4Ijl4wJSy52l8LQrHW+nC8=; b=GSsdZ1Y5MZw/OjXYzrBWk48S8
        R7BngR9n5IYQ9US97kiU0fNOPMhtuX1EDvR/dZQQYus890Vb1LJa+GY/UGV0MZnKIG1s8xhjFoVwO
        nepPgfFS1rpqCZ+pP7LT2Ca6spc/tENjWg2gPP7CSrjyLLBqZKVTWLI+Flqy73mz+P2WsEi6w/SHv
        p008o3wO1/FshcgdBxInZS7VUJEJ2UtVED0XKqoqvg+QqW+GXB4CjYd4LGhYPzhZETwskmb/IYCWe
        LqvcoCRGSvssbMEgwQGAuoS+usllbHwlHSGyZQTJM2JREUrd2iaHWgzlSEN0jaLuePc4fS0kjEA4E
        UNrwtyj0g==;
Received: from 201.86.169.251.dynamic.adsl.gvt.net.br ([201.86.169.251] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hbMt9-0005fa-93; Thu, 13 Jun 2019 10:23:23 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hbMt7-0005lq-9g; Thu, 13 Jun 2019 07:23:21 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt: leds-lm36274.txt: fix a broken reference to ti-lmu.txt
Date:   Thu, 13 Jun 2019 07:23:15 -0300
Message-Id: <79b9bf3388eb231da77c6a804862d21339262d0a.1560421387.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There's a typo there:
	ti_lmu.txt -> ti-lmu.txt

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/devicetree/bindings/leds/leds-lm36274.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lm36274.txt b/Documentation/devicetree/bindings/leds/leds-lm36274.txt
index 456a589c65f0..39c230d59a4d 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm36274.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm36274.txt
@@ -6,7 +6,7 @@ up to 29V total output voltage. The 11-bit LED current is programmable via
 the I2C bus and/or controlled via a logic level PWM input from 60 uA to 30 mA.
 
 Parent device properties are documented in
-Documentation/devicetree/bindings/mfd/ti_lmu.txt
+Documentation/devicetree/bindings/mfd/ti-lmu.txt
 
 Regulator properties are documented in
 Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
-- 
2.21.0

