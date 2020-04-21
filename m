Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55A01B2FDB
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2020 21:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgDUTOd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Apr 2020 15:14:33 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:60960 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgDUTOc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 21 Apr 2020 15:14:32 -0400
Received: from localhost.localdomain (80-110-124-168.cgn.dynamic.surfer.at [80.110.124.168])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 476EFC4CA6;
        Tue, 21 Apr 2020 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1587496469; bh=uN6Y6A8DTNuiV7e2MudBISx2fjf0/H0BvRP4mfJU1e4=;
        h=From:To:Cc:Subject:Date;
        b=zC4u9JMiQNrblvuC/A4RV27RcUEPcxzT0+Z8op6Wa+XnQsIT3/I6tbalVOi2GIbQc
         K5/OfWhIKxV+mOSQEGLGJX5utwHRGqVmHZe2vuRA07a612+gSoZI+S2i0v4Y8QJzv2
         Na0E/8E8vaNFBGyTofMC1G2zvEE6w8rqKHhJqB/I=
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
Subject: [PATCH v3 0/2] Add sgm3140 flash led driver
Date:   Tue, 21 Apr 2020 21:13:52 +0200
Message-Id: <20200421191354.1443017-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.26.1
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

 .../bindings/leds/leds-sgm3140.yaml           |  62 ++++
 drivers/leds/Kconfig                          |   8 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-sgm3140.c                   | 320 ++++++++++++++++++
 4 files changed, 391 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
 create mode 100644 drivers/leds/leds-sgm3140.c

-- 
2.26.1

