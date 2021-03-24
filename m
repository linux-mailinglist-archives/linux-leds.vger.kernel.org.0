Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5948534730D
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 08:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236035AbhCXH5R (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Mar 2021 03:57:17 -0400
Received: from smtp2.axis.com ([195.60.68.18]:45697 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232783AbhCXH4y (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 24 Mar 2021 03:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616572614;
  x=1648108614;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9F4Q2zF0g7Nwx55yNFsklkY9Qcy4OjwQ9P2qCaIxHYc=;
  b=QAlhvUj4k1YC+B62KmH0dmZuuZdx0E3hRYbv7fwPqjrnG79M/f0cd2R4
   ux1eeXYiSO/E720wAOas3tsDkFHn97hZ0nYk7GspKAmSSsimDLx/YHofE
   eycYAEHqaXUZU3rK7SElMaPBVah3xWPqrvMhguZ20ga1S8RFY798yGwbB
   50aERh8syTSuH70rbsYIFiAgo+FWJSmKws8ittpqbwvu+00N9rYWMdoQA
   jdMH3YSyd/A2GmOb1PhpKYrunvAr+yyOPpbAes1yDiuHPHU/p0BS/HZbL
   Qhr8gQKKd40C1WypWahbzvPaFrMZbo8n07dZmpW0SS6b5K6z06eaYqRxm
   w==;
From:   Hermes Zhang <chenhui.zhang@axis.com>
To:     <pavel@ucw.cz>, <dmurphy@ti.com>, <robh+dt@kernel.org>
CC:     <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <chenhuiz@axis.com>,
        <lkml@axis.com>, <kernel@axis.com>
Subject: [PATCH 0/2] New multiple GPIOs LED driver
Date:   Wed, 24 Mar 2021 15:56:29 +0800
Message-ID: <20210324075631.5004-1-chenhui.zhang@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Hermes Zhang <chenhuiz@axis.com>

*** BLURB HERE ***

New multiple GPIOs LED driver


Hermes Zhang (2):
  leds: leds-multi-gpio: Add multiple GPIOs LED driver
  dt-binding: leds: Document leds-multi-gpio bindings

 .../bindings/leds/leds-multi-gpio.yaml        |  50 +++++++
 drivers/leds/Kconfig                          |  12 ++
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-multi-gpio.c                | 140 ++++++++++++++++++
 4 files changed, 203 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
 create mode 100644 drivers/leds/leds-multi-gpio.c

-- 
2.20.1

