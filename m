Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD5016237F
	for <lists+linux-leds@lfdr.de>; Tue, 18 Feb 2020 10:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgBRJiN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 Feb 2020 04:38:13 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50261 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbgBRJiN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 18 Feb 2020 04:38:13 -0500
Received: by mail-wm1-f68.google.com with SMTP id a5so2042626wmb.0
        for <linux-leds@vger.kernel.org>; Tue, 18 Feb 2020 01:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=diNDoQJLLiILeBSp0QO0Lz48zF47Rfh9Ax7IA6XtwgQ=;
        b=J67inxLIMYJUPkxO7T96ySwzQg3VxXmPuDj5Mr3P4vSQ6vBQzVdg1ltFniAtpgq5EC
         RryNiZ4n7lUwbyLLUQEI1lXWR9yObHs+Unc6iMGzzbEifWA4QVwxPXJ1Bs43i3A8/Qdd
         VKck2+h+hCN8tE4912oW8dF6WdikqXnniVbtI2yZeRQn3uCBqj3bbHvRwPtYEGlZW/p2
         vl11Xu1/snsnWHDWlf3d4M2DVXHsILuD92J5yxHUHc/cJz0N0ztEzB3jEEgs5pA23h1O
         I5zy5+GYZcs2vNX2YwCJHmNwZohq38MjX7RAi9bMy1jl2tfiFdlzTH5M8WaIytfRRESU
         5gVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=diNDoQJLLiILeBSp0QO0Lz48zF47Rfh9Ax7IA6XtwgQ=;
        b=C4W1WulkPZCtruEAiGpUz1k58LQXLYbYWFZgZ5rczhlmZ+fHJx53DOdQgnt6+Xx6pk
         8cSby8ZwOJdYUROCX+2RiRjE+6Q6vyZoGAlAEFeA8uH0CXJT/X3ynvWFr2QujlYqmUfi
         Qv2wEZiQWT3D7msyREshy2vhiQ11YG/vJfBC1LiLdjAAaziB05K+S2Dvd0vFdzZ48LPi
         fYx1SjKz6ZtG9mFuVsifgp2lN1mNUQmE7y7VvXp+xPehjBkRozdrs34q1v20lzAz5L45
         oGvVD1qTiW5uwmEAA4uXrOi0EMiUDQB3vW/5fMhjPeO+8u1gfbmOUjcSRbMuRmbtq77w
         kWOQ==
X-Gm-Message-State: APjAAAWftrVAuFfk7AX1EDFBRhgYWj9DHL5NEUUc75MvqwRRx3amWMfD
        xiWap/TewvaL5zL7avATFuEYvFKSUnk=
X-Google-Smtp-Source: APXvYqzeD7oa4mok6DIG3T4dYqFSsOjTCWha3eJlu4pRVvxeD/u5na/yqU1ULsV45Nqx1fBw0lgYKA==
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr2171022wmb.42.1582018690334;
        Tue, 18 Feb 2020 01:38:10 -0800 (PST)
Received: from nbelin-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f127sm2740626wma.4.2020.02.18.01.38.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 01:38:09 -0800 (PST)
From:   Nicolas Belin <nbelin@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc:     Nicolas Belin <nbelin@baylibre.com>
Subject: [PATCH 0/3] leds: add support for apa102c leds
Date:   Tue, 18 Feb 2020 10:37:34 +0100
Message-Id: <1582018657-5720-1-git-send-email-nbelin@baylibre.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch series adds the driver and its related documentation 
for the APA102C RGB Leds.

Patch 1 adds the APA102C led manufacturer to the vendor-prefixes list.

Patch 2 Documents the APA102C led driver.

Patch 3 contains the actual driver code and modifications in the Kconfig 
and the Makefile.

Nicolas Belin (3):
  dt-bindings: Document shiji vendor-prefix
  dt-bindings: leds: Shiji Lighting APA102C LED driver
  drivers: leds: add support for apa102c leds

 .../devicetree/bindings/leds/leds-apa102c.yaml     |  91 +++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-apa102c.c                        | 268 +++++++++++++++++++++
 5 files changed, 373 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-apa102c.yaml
 create mode 100644 drivers/leds/leds-apa102c.c

-- 
2.7.4

