Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA42C26E08
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 21:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732444AbfEVTqX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 15:46:23 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50654 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732405AbfEVT1u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 15:27:50 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4MJRjqw079732;
        Wed, 22 May 2019 14:27:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558553265;
        bh=mb9DtpGK++v8kJ0PeDAjLnaIBJtP4888+bgXxUdkl88=;
        h=From:To:CC:Subject:Date;
        b=ta1jPaeU4FnSNZVQlH51XLxYFchglSs8CoDqyl1FdasyFYosfISgT6H2Du21gRtZ2
         UIXRspA2dPO5w+Op2h2VNu2nuSVOhIY9uOBsHUIH2JgUTAn3PNQyjh2w/GOdwejE/k
         zwaR9N1QMgEN2iCwFuDRHXWlB8gRKeNU1s90SedU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4MJRj3O031994
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 May 2019 14:27:45 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 22
 May 2019 14:27:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 22 May 2019 14:27:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4MJRid2096385;
        Wed, 22 May 2019 14:27:44 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>
CC:     <lee.jones@linaro.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 0/6] LM36274 Introduction
Date:   Wed, 22 May 2019 14:27:27 -0500
Message-ID: <20190522192733.13422-1-dmurphy@ti.com>
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

