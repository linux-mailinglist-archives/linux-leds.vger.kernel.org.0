Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10F4317EA1C
	for <lists+linux-leds@lfdr.de>; Mon,  9 Mar 2020 21:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgCIUg3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Mar 2020 16:36:29 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:57336 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgCIUg3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 9 Mar 2020 16:36:29 -0400
Received: from localhost.localdomain (80-110-126-226.cgn.dynamic.surfer.at [80.110.126.226])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 0B743C3FB3;
        Mon,  9 Mar 2020 20:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1583786186; bh=awz8KYyR1mFeuL9bVkD1x82S9ZomZ83jlRqOYvBFojo=;
        h=From:To:Cc:Subject:Date;
        b=LQOC0IcpM39Cnvyxmc69xAF3o0s/E3x/weuQs/vLTgkaoy2Ruf3Z3KFU7+Csb1+Dn
         x4Ezb3ClVXrYbZNZvjTmxddxTXXgrgNdT/7zd7boXY0NMgXR+owaxoG0wZ5Gn2Zwhw
         yxMz2pFe4JcRIA5i6r5TySJ7edcb+ahFgZWDrkoA=
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
Subject: [PATCH 0/3] Add sgm3140 flash led driver
Date:   Mon,  9 Mar 2020 21:35:55 +0100
Message-Id: <20200309203558.305725-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series introduces a driver for the SGMICRO SGM3140 charge pump
used in the PinePhone smartphone.

Luca Weiss (3):
  dt-bindings: Add vendor prefix for SG Micro Corp
  dt-bindings: leds: Add binding for sgm3140
  leds: add sgm3140 driver

 .../bindings/leds/leds-sgm3140.yaml           |  53 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/leds/Kconfig                          |   9 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-sgm3140.c                   | 260 ++++++++++++++++++
 5 files changed, 325 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
 create mode 100644 drivers/leds/leds-sgm3140.c

-- 
2.25.1

