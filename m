Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA04AEBB8
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 15:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbfIJNid (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 09:38:33 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43202 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfIJNid (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Sep 2019 09:38:33 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ADcT25076996;
        Tue, 10 Sep 2019 08:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568122709;
        bh=EcMSu4m42xGnN8JKAeX2Bwa3OOPO+UWNpzBhOLNRiVE=;
        h=From:To:CC:Subject:Date;
        b=uIct9BvbpF+T3tBHyKU6q08ZPd5T2ZFxTFsJtQQ10otTjRgLHwKJoP16veDR2arYC
         KRb7oLGWXcgEH0nTa932lTSmn/Op/DuuAXP52vvWJnJvjaDTCPKIv5THdEVXHw5CiT
         R7RK6VzYTBPubSnPmj/7EraNVsScR1mZp55H9IeQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ADcTog097629
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 10 Sep 2019 08:38:29 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 10
 Sep 2019 08:38:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 10 Sep 2019 08:38:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ADcSBd065480;
        Tue, 10 Sep 2019 08:38:28 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <dmurphy@ti.com>
CC:     <tomi.valkeinen@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [RESEND,v2 0/2] leds: tlc591xx: switch to OF and managed API
Date:   Tue, 10 Sep 2019 15:38:12 +0200
Message-ID: <20190910133814.10275-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This mini-series updates the tlc591xx driver to use the managed API. The
driver is also modified to pass the DT node to the LED core layer.
The goal is to be able to the generic led-backlight [0] driver on top of
it.

changes in v2:
- fixed LED indexing. Previous version did not allow for holes: if n LEDs
  were used, they had to be led(0) to led(n-1)

Jean-Jacques Hiblot (2):
  leds: tlc591xx: simplify driver by using the managed led API
  leds: tlc591xx: Use the OF version of the LED registration function

 drivers/leds/leds-tlc591xx.c | 79 +++++++++---------------------------
 1 file changed, 20 insertions(+), 59 deletions(-)

-- 
2.17.1

