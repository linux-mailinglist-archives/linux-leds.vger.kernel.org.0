Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECE0317013B
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 15:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbgBZOdh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 09:33:37 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38760 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727426AbgBZOdh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 09:33:37 -0500
Received: by mail-wm1-f67.google.com with SMTP id a9so3358060wmj.3
        for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2020 06:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E/6gF09OIYAAYDcV57fzVa8XqTwVQognyAPormZwLXA=;
        b=hegrlG36+pNJ7eQm7ecF25m/6jmdt9xJtyaZkyKYXTTcIhQSHUrlFOGC7QM1ZkSs1f
         z8Cii0H2nyG4YFC3gRgyZqEe2HVDgPGAMFF8Oi0EKGpftdOEUEHVDSusQ1+Mx4/446C1
         mQ0rmvHluc25ztTOpLq60P35Fc/x7qwrIxndv01K9RtTNXPG2vhs8y90wuanfqXD2BkE
         fiDkHDNcWL2e7tHjtHwPqJaSfCIBOB5Ep+IcSpKSngLEO8P66LZOkF04iJq2Q7vPKClx
         /mIzKnEUHgviGqFsQYG6Imig61ZMZ8fejNc3vleGlSvmQUwt+gqVDwG0LoxZykRNAY0Q
         Oo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=E/6gF09OIYAAYDcV57fzVa8XqTwVQognyAPormZwLXA=;
        b=TV4TeRWSVoYAX0HRYIUOgnNQmsjfvi99w+pDOSOCuRg/+UiARIAkFhvmHUAwChSiCJ
         zK1vXoMPka85d1e58e6kFiZnrtvyiMSnywN7BkC6KX99fXq+vjJ2yDeM60bGUztGouSo
         xoJmaBqlc65MffhPmfBfU0c6S2vbNe/maQxmZGw5sIJ78FJN6G3uTYPp+pG1qp1DXB8n
         8rLOOC6ZRlxxT6SdEVddL4Qp/KLSnifNnygMaeTvQdz8coIEg52fkU2SOsQDgZtP8oP0
         wE5/+ITMTn/LuCPXCal8TUTI9y3BFlKyELhcyBJG68eX6Y7sAbi3VGz6o7B9v5at1+Fx
         jxCw==
X-Gm-Message-State: APjAAAVPTDHLzJd7SRDQ74ic931vugo6Y/7Ght/bYV7R9sl90jwDVZkp
        zYHEdEOkR8jJzQnMSU4k82egpA==
X-Google-Smtp-Source: APXvYqwBKYor34z0MGWsBLW+ZiaHQNfsqktLq4aiSFvylON7V2FQMsPdkd+ygzITY5yRXB619OYQwQ==
X-Received: by 2002:a7b:c7d2:: with SMTP id z18mr6015351wmk.160.1582727615570;
        Wed, 26 Feb 2020 06:33:35 -0800 (PST)
Received: from nbelin-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h10sm3204198wml.18.2020.02.26.06.33.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Feb 2020 06:33:35 -0800 (PST)
From:   Nicolas Belin <nbelin@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org
Cc:     baylibre-upstreaming@groups.io, Nicolas Belin <nbelin@baylibre.com>
Subject: [PATCH RFC v2 1/3] dt-bindings: Document shiji vendor-prefix
Date:   Wed, 26 Feb 2020 15:33:10 +0100
Message-Id: <1582727592-4510-2-git-send-email-nbelin@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582727592-4510-1-git-send-email-nbelin@baylibre.com>
References: <1582727592-4510-1-git-send-email-nbelin@baylibre.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Shenzhen Shiji Lighting Co.,Ltd is a LED manufacturer.

Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9e67944bec9c..a463286c3960 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -863,6 +863,8 @@ patternProperties:
     description: SGX Sensortech
   "^sharp,.*":
     description: Sharp Corporation
+  "^shiji,.*":
+    description: Shenzhen Shiji Lighting Co.,Ltd
   "^shimafuji,.*":
     description: Shimafuji Electric, Inc.
   "^si-en,.*":
-- 
2.7.4

