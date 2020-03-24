Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5092C1918CD
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2020 19:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbgCXSU3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Mar 2020 14:20:29 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37716 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbgCXSU3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Mar 2020 14:20:29 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02OIKOEm076038;
        Tue, 24 Mar 2020 13:20:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585074024;
        bh=J3mZ3nmzF0wHtBE0U1+YbpsX0WsYfOsuVjuEIKOh1Sk=;
        h=From:To:CC:Subject:Date;
        b=RPz3pC5/4VDZvh7wc9lDH2YkNVbi2H/P0Kkll4kLJDYYRGyimjc2We0tPzyFGSHhm
         pLf9a2YgeaJpLrzchk6TDAeMVm3ReDTkQltuvFEAN0jUPEcuLczQMUyWJnPkPJ/gxw
         vsZJEKLMNkBShWBllg0xKrOwZrRG48GJ8YTAyX6A=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02OIKO6u112968
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Mar 2020 13:20:24 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 24
 Mar 2020 13:20:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 24 Mar 2020 13:20:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02OIKNww037641;
        Tue, 24 Mar 2020 13:20:23 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v18 0/4] Multi Color LED Framework Patches
Date:   Tue, 24 Mar 2020 13:14:30 -0500
Message-ID: <20200324181434.24721-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

This is the multi color LED framework.   This framework presents clustered
colored LEDs into an array and allows the user space to adjust the brightness
of the cluster using a single file write.  The individual colored LEDs
intensities are controlled via a single file that is an array of LEDs

A design alternative to having files that have multiple values written to a
single file is here:

https://lore.kernel.org/patchwork/patch/1186194/

Dan

Dan Murphy (4):
  dt: bindings: Add multicolor class dt bindings documention
  dt-bindings: leds: Add multicolor ID to the color ID list
  leds: Add multicolor ID to the color ID list
  leds: multicolor: Introduce a multicolor class definition

 .../ABI/testing/sysfs-class-led-multicolor    |  51 ++++
 .../bindings/leds/leds-class-multicolor.txt   |  98 ++++++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-class-multicolor.rst  | 110 +++++++++
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/led-class-multicolor.c           | 224 ++++++++++++++++++
 drivers/leds/led-core.c                       |   1 +
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          | 124 ++++++++++
 10 files changed, 622 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.25.1

