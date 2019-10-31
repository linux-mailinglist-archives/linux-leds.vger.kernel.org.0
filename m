Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBC8BEB182
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2019 14:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbfJaNsk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 31 Oct 2019 09:48:40 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:33977 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727567AbfJaNsj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 31 Oct 2019 09:48:39 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id B3D106B7B;
        Thu, 31 Oct 2019 09:48:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 31 Oct 2019 09:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=Z7sZc/mS+DIqHU1l0y9g4Urgyp
        E7oJRWd6x17FvkVNE=; b=odXBMtDibR0QeeKvulcqmjbVqHWiJmLMYGMqvhvEiC
        Sj9C6f4usphc8V4BUytdifjrm9zbO9Ngt3VOXG/UPMpwOi9VPQkAyZ14dy1TnEH/
        2qGDAGjTjT5Ot8Hizm3SqctCvDyuiQzAnC5aHcYMKP40Px2EhENtnhk06rj3J0oe
        D3n4bSt0n3ekClL85dPAROgYIOEh2grWiEE7U47sr9qrGLcOI0LyxtpYA4RMsF3j
        YcDCZCmY4zu4sSLw4mZ97uCucWzIZizHJC21PdHWgzHYJ4Qi6G4KUsOhnPLXVGVS
        CClLwvpYbsG36C/UrCoP3BUBU6XqVYwqEuJguhyAgbeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Z7sZc/mS+DIqHU1l0
        y9g4UrgypE7oJRWd6x17FvkVNE=; b=QJrgzIuP6jhlo0p4CKIztWb24lcUh7BEq
        tI+VFDepnBPWe5zKyrrFmbl6IISFouiR0FzKFy1OKsGPtWCAYaTRTMZsy+CN7Q1g
        I7RUwlqXSRDvoSlx+bVetSXWUqibvsRGX7uZS9S+cHdT1VNwcSI7JzfXY+sW30g+
        zwX/uXKJKB/PMRew2uzbYF5Pj4MSZHDcnbBA0/KVEIEz2v5PbPosx8T32GnNDrX+
        uucjL4QgIK0v1HrIThuJvETSQlJQACkNUXLykXqwxUTFpgOo6VwA+2dxCxylTE7h
        r8J3Ge2vnGcdoNFrM4NfFfs/QAgU9s8H60/j/T2PEJdXgXTy+peLg==
X-ME-Sender: <xms:Nea6XZzladOU5qZCq02GiUIqUPKxSX7CXONok_G-PGMyq-KRo9P3Uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddthedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
    tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeekvddrvd
    ehgedrgedrudefkeenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghr
    nhhordhtvggthhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Nea6Xe3YbpCTTQvnjBST_fabJiq2oBC3ANu-No6fxyl_OgWTq0Eb3A>
    <xmx:Nea6XVUiOuLAcbT_1L4DB5-m-1Ma46oenFB_6NmTuGnsHjA8eYWeHQ>
    <xmx:Nea6XaCg6jHCIpWsXvglEj8TNh4_jTVaO2l_LCEZp9iRJcOqqsBFJQ>
    <xmx:Nua6XWoLxGs86y8H8vYGBZZJg3eLe_mF7b7zFSJW5kBTfzFLIDpoLkBhfs0>
Received: from localhost (lns-bzn-32-82-254-4-138.adsl.proxad.net [82.254.4.138])
        by mail.messagingengine.com (Postfix) with ESMTPA id B96528005A;
        Thu, 31 Oct 2019 09:48:36 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] dt-bindings: leds: lm3630a: Fix the example compilation
Date:   Thu, 31 Oct 2019 14:48:33 +0100
Message-Id: <20191031134833.241303-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Commit ae92365cdd75 ("dt-bindings: backlight: lm3630a: Add enable-gpios to
describe HWEN pin") introduced in the example a GPIO flag that isn't
declared anywhere, resulting in a compilation breakage when running the
validation tools. Add the proper define.

Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Lee Jones <lee.jones@linaro.org>
Fixes: ae92365cdd75 ("dt-bindings: backlight: lm3630a: Add enable-gpios to describe HWEN pin")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../devicetree/bindings/leds/backlight/lm3630a-backlight.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
index c8470628fe02..72fc6f7ef90a 100644
--- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
@@ -93,6 +93,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
-- 
2.23.0

