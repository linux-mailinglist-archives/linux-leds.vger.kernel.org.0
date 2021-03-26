Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2731934A105
	for <lists+linux-leds@lfdr.de>; Fri, 26 Mar 2021 06:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhCZF25 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Mar 2021 01:28:57 -0400
Received: from smtp2.axis.com ([195.60.68.18]:6449 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229761AbhCZF2t (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Mar 2021 01:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616736529;
  x=1648272529;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8d3dIdNCbdJWcGJMvMj4HnBGxxDVIsB7BROmN+qX1tk=;
  b=gbtSW/uw639nWQvx887Kg2gzjsGRbcKNMyfkjxkFaImtD1RnV3Sln2bC
   nXm9O1SEEbwJiMu1nx6mKnpmumsAdqrXEpG3tj+K9qumHy039CaTvqkl5
   4i2DHOr8DIqt3eUhKZyJKDvjihuSrIT6df/LyKde0KcuYwUs4IiSCOgG2
   shI/GeGuc80s0B3J4imHmCLM+01U9bbvPPGgixGept2KGGGLETey0x81F
   /Zf/BP2KNAdGn2szzvUW5KH6bzyGKo6t5aRYjNPU3YKd7h45yaWzba19o
   IW1QwberW7BT3qLT+ftJG2fHHe0NIIA+lxibG4fKTJXfMPXL9OOVOv3PE
   Q==;
From:   Hermes Zhang <chenhui.zhang@axis.com>
To:     <pavel@ucw.cz>, <dmurphy@ti.com>, <robh+dt@kernel.org>
CC:     <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <chenhuiz@axis.com>,
        <lkml@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 0/2] New multiple GPIOs LED driver
Date:   Fri, 26 Mar 2021 13:27:59 +0800
Message-ID: <20210326052801.17666-1-chenhui.zhang@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Hermes Zhang <chenhuiz@axis.com>

changes v2:
- use max_brightness(=2^gpio number) instead of LED_FULL
- alloc priv at once
- move driver code to new simple folder
- update commit message for dt-binding commit
- move dt-binding commit before driver code

Hermes Zhang (2):
  dt-binding: leds: Document leds-multi-gpio bindings
  leds: leds-multi-gpio: Add multiple GPIOs LED driver

 .../bindings/leds/leds-multi-gpio.yaml        |  50 ++++++
 drivers/leds/Kconfig                          |   3 +
 drivers/leds/Makefile                         |   3 +
 drivers/leds/simple/Kconfig                   |  23 +++
 drivers/leds/simple/Makefile                  |   3 +
 drivers/leds/simple/leds-multi-gpio.c         | 144 ++++++++++++++++++
 6 files changed, 226 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
 create mode 100644 drivers/leds/simple/Kconfig
 create mode 100644 drivers/leds/simple/Makefile
 create mode 100644 drivers/leds/simple/leds-multi-gpio.c

-- 
2.20.1

