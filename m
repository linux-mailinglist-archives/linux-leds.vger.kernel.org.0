Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D40316BF3
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 22:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfEGUMG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 16:12:06 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41348 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbfEGUMG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 16:12:06 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x47KBrXb103329;
        Tue, 7 May 2019 15:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557259913;
        bh=mb9DtpGK++v8kJ0PeDAjLnaIBJtP4888+bgXxUdkl88=;
        h=From:To:CC:Subject:Date;
        b=QLHWta7VBsbo3+PCq/r4cAfxo+MiBf7t7qa3TLwRp1SB4WH/6prt3Jm0ebOazm260
         J4loBa9KZwssB4sq4NPMmkc/3JnFAiPrDWMO4yy/ovTwd0HWSl8ENGCc8uwkzZODfF
         57+VXHE6+l9HhMZcq4H67zQ8bMUSMBV3FoPju2sM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x47KBrTv104682
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 May 2019 15:11:53 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 7 May
 2019 15:11:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 7 May 2019 15:11:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x47KBrDL013898;
        Tue, 7 May 2019 15:11:53 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <lee.jones@linaro.org>, <rdunlap@infradead.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 0/6] LM36274 Introduction
Date:   Tue, 7 May 2019 15:11:53 -0500
Message-ID: <20190507201159.13940-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

This is patch set v4 for the LM36274.  There were no changes made
to this patch set except to rebase this on top of the latest TI LMU common code
patchset.

This patch set was rebased on the series at:
https://lore.kernel.org/patchwork/project/lkml/list/?series=393071

Dan

Dan Murphy (6):
  regulator: lm363x: Make the gpio register enable flexible
  dt-bindings: mfd: Add lm36274 bindings to ti-lmu
  mfd: ti-lmu: Add LM36274 support to the ti-lmu
  regulator: lm363x: Add support for LM36274
  dt-bindings: leds: Add LED bindings for the LM36274
  leds: lm36274: Introduce the TI LM36274 LED driver

 .../devicetree/bindings/leds/leds-lm36274.txt |  82 +++++++++
 .../devicetree/bindings/mfd/ti-lmu.txt        |  54 ++++++
 drivers/leds/Kconfig                          |   7 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-lm36274.c                   | 174 ++++++++++++++++++
 drivers/mfd/Kconfig                           |   5 +-
 drivers/mfd/ti-lmu.c                          |  14 ++
 drivers/regulator/Kconfig                     |   2 +-
 drivers/regulator/lm363x-regulator.c          |  56 +++++-
 include/linux/mfd/ti-lmu-register.h           |  23 +++
 include/linux/mfd/ti-lmu.h                    |   4 +
 11 files changed, 416 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
 create mode 100644 drivers/leds/leds-lm36274.c

-- 
2.21.0.5.gaeb582a983

