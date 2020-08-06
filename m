Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4FC23D6DD
	for <lists+linux-leds@lfdr.de>; Thu,  6 Aug 2020 08:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgHFGiB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 6 Aug 2020 02:38:01 -0400
Received: from m12-15.163.com ([220.181.12.15]:32968 "EHLO m12-15.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726051AbgHFGiA (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 6 Aug 2020 02:38:00 -0400
X-Greylist: delayed 939 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Aug 2020 02:37:57 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=b4Vljfz11N5B3BsXB/
        jU+jLNNdpMd3l8kupGK/FIHnQ=; b=SN5MGle4MIp3KSKXRDPu290DgzSt7dTQJD
        fGhFwn8vRFwNlRWqFKLxUn2oEe0BV14NgDRduHZobrliuXmYHOJ//xfcrpLKwMIP
        59FW5K294r5swrb4TWJ8RACE+6l2YZtwag5bk3BtF9mRAlrnhko4xTdMAarFnO+B
        bwUdHtark=
Received: from localhost.localdomain (unknown [58.33.126.62])
        by smtp11 (Coremail) with SMTP id D8CowADnbcp1oStf0rT5EQ--.55997S3;
        Thu, 06 Aug 2020 14:21:48 +0800 (CST)
From:   Grant Feng <von81@163.com>
To:     von81@163.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] DT: leds: Add an optional property named 'sdb-gpios'
Date:   Thu,  6 Aug 2020 14:21:30 +0800
Message-Id: <20200806062130.25187-2-von81@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806062130.25187-1-von81@163.com>
References: <20200806062130.25187-1-von81@163.com>
X-CM-TRANSID: D8CowADnbcp1oStf0rT5EQ--.55997S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw4fCFWfXFW7XFy3XrWfAFb_yoWkKFX_G3
        Z7JrsFqas8uF1vgr4qvr15Wr43Cr47AF1kCw15ZF48Aw1fXas09FZ7t34Yyr15WFZxurZx
        C3ykCr4qqr17GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0_Oz5UUUUU==
X-Originating-IP: [58.33.126.62]
X-CM-SenderInfo: xyrqmii6rwjhhfrp/1tbiNxx4OlWBhkubuAAAsT
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The chip enters hardware shutdown when the SDB pin is pulled low.
The chip releases hardware shutdown when the SDB pin is pulled high.

Signed-off-by: Grant Feng <von81@163.com>
---
 Documentation/devicetree/bindings/leds/leds-is31fl319x.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt b/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt
index fc2603484544..e8bef4be57dc 100644
--- a/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt
+++ b/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt
@@ -16,6 +16,7 @@ Optional properties:
 - audio-gain-db : audio gain selection for external analog modulation input.
 	Valid values: 0 - 21, step by 3 (rounded down)
 	Default: 0
+- sdb-gpios : Specifier of the GPIO connected to SDB pin.
 
 Each led is represented as a sub-node of the issi,is31fl319x device.
 There can be less leds subnodes than the chip can support but not more.
@@ -44,6 +45,7 @@ fancy_leds: leds@65 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	reg = <0x65>;
+	sdb-gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
 
 	red_aux: led@1 {
 		label = "red:aux";
-- 
2.17.1


