Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 327801984CA
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2020 21:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgC3TsM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 30 Mar 2020 15:48:12 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:38670 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727276AbgC3TsM (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 30 Mar 2020 15:48:12 -0400
Received: from localhost.localdomain (80-110-124-168.cgn.dynamic.surfer.at [80.110.124.168])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 7ECCFC44BD;
        Mon, 30 Mar 2020 19:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1585597690; bh=DfZj97sVXnjdGhg+aqdNjmaXNiEPy6qoTuB6Y4+lNOA=;
        h=From:To:Cc:Subject:Date;
        b=SKA3KGVW6oWyeCHj8W6mTXUeipfKD4f4BiKkm+LGClyDnWLnXreAelFQNdNnEr6y8
         XB4P8NPKeGsHZfIX1RUHHu3tQTLwtcU8SY0hjp3TCPhx35vH4SD7nitAnClHmvcLFE
         ZZcm30xLZ0a62hMjC9OCOOv/XdEr9kWTg644s2Vs=
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
Subject: [PATCH v2 0/2] Add sgm3140 flash led driver
Date:   Mon, 30 Mar 2020 21:47:55 +0200
Message-Id: <20200330194757.2645388-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series introduces a driver for the SGMICRO SGM3140 charge pump
used in the PinePhone smartphone.

Luca Weiss (2):
  dt-bindings: leds: Add binding for sgm3140
  leds: add sgm3140 driver

 .../bindings/leds/leds-sgm3140.yaml           |  61 ++++
 drivers/leds/Kconfig                          |   9 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-sgm3140.c                   | 317 ++++++++++++++++++
 4 files changed, 388 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
 create mode 100644 drivers/leds/leds-sgm3140.c

-- 
2.26.0

