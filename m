Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D347512A91F
	for <lists+linux-leds@lfdr.de>; Wed, 25 Dec 2019 22:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfLYVB0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Dec 2019 16:01:26 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43044 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbfLYVBZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Dec 2019 16:01:25 -0500
Received: by mail-pf1-f193.google.com with SMTP id x6so11229480pfo.10;
        Wed, 25 Dec 2019 13:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UKiEtbhKpkoXrN73naEOrx88kzwa9vSUmljrzrCA5Cc=;
        b=bGOQxTFwxP1otsSd5NeJRqc73rlwFRxg/BNztDOWXV5KLxJ+1RfJ2kpkZg+sVY3uij
         OVh3NdcAk4y/mxEwVyOplTqsO47IOJkEVDN7CZFXJX+0v6vG4Nw2UaC3KoaEdxPmjgeF
         M9/pgXuVrJiMifN48wI8wpdJQdjqlho32Cjtc9zqikzLBehFm2an+UKWoC3ylDJ4gsHV
         gOaKvk5WzhAk0AtPiPUgDrqa6Dj1uoLhkPfQEtNzX6Qq5rhgD4bmckHOCvghdSKOfxIr
         yEfLSxdvRSo88b4Y+ED3KGEm4+Y0y1PUOjUdrJkdiW/ZNJBD3YhHX3LUxC4nlwDTV9Oc
         N8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UKiEtbhKpkoXrN73naEOrx88kzwa9vSUmljrzrCA5Cc=;
        b=nVYL1ABIgIqESlbYMwkHy1UIAuc7OoKvAgBWYmGylwPrQw97u2G2s+ZHp3BR4jzxRs
         6/PlTVODtI3DkEOWZDqdE4aigN3FOjAkHlEU7FrFVrsXqJfBqpcGLt2HMH7k5OURrWVG
         dQryHg0vdNtvm9AiJulo4gEjbE6+L2V/wu11aPcS26/dLYVYjKVxZBsJPt1jpHq+xQM6
         BrbDuBSe5JH3ZBktV0fldjM0e+eIY447NpCTjOrxGZUAIJZfDNhVusTFca1qXue084sG
         5KRxXFH7drNjCcNTBnGfU/zMlZ5w/EWZzOhI6fjrkojAqVEPxCuFRj9U9VLIP89vVG/3
         GLqQ==
X-Gm-Message-State: APjAAAW1+nGCpLoaDaf5yggMH5msG0bzQecvRvZi9Jd/qKaMRfhx4Qg3
        vhSxMSvR7zEN9ZnfiAqHVbw=
X-Google-Smtp-Source: APXvYqxW5SaK5vVHtdzTRDHjbGXNaL7hHDnAwfUtpMj0wFspBzJa9z06R5wG/TCqvfOKZkLD6PH5ow==
X-Received: by 2002:a63:26c4:: with SMTP id m187mr45446784pgm.410.1577307684968;
        Wed, 25 Dec 2019 13:01:24 -0800 (PST)
Received: from localhost.localdomain ([113.30.156.69])
        by smtp.googlemail.com with ESMTPSA id k5sm7560232pju.5.2019.12.25.13.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2019 13:01:24 -0800 (PST)
From:   Mohana Datta Yelugoti <ymdatta.work@gmail.com>
To:     jacek.anaszewski@gmail.com
Cc:     trivial@kernel.org, Mohana Datta Yelugoti <ymdatta.work@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: spi-ir-led: fix spelling mistake "balue"->"value"
Date:   Thu, 26 Dec 2019 02:29:39 +0530
Message-Id: <20191225205941.28429-1-ymdatta.work@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There is a spelling mistake in:
      Documentation/bindings/leds/irled/spi-ir-led.txt.
Fix it.

Signed-off-by: Mohana Datta Yelugoti <ymdatta.work@gmail.com>
---
 Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt b/Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt
index 21882c8d4b0c..83ff1b4d70a6 100644
--- a/Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt
+++ b/Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt
@@ -8,7 +8,7 @@ Required properties:
 	- compatible: should be "ir-spi-led".
 
 Optional properties:
-	- duty-cycle: 8 bit balue that represents the percentage of one period
+	- duty-cycle: 8 bit value that represents the percentage of one period
 	  in which the signal is active.  It can be 50, 60, 70, 75, 80 or 90.
 	- led-active-low: boolean value that specifies whether the output is
 	  negated with a NOT gate.
-- 
2.17.1

