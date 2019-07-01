Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA3685BFB9
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2019 17:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbfGAP0K (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jul 2019 11:26:10 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59514 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728801AbfGAP0K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jul 2019 11:26:10 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61FQ6Of005375;
        Mon, 1 Jul 2019 10:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561994766;
        bh=9UljRItItFXC7gllaubfBPsW/fvjSb11D/1K/Aban6E=;
        h=From:To:CC:Subject:Date;
        b=omIb7CjgeuwlvLCyVNz26T1pzLBWRbwJdQ6AU/pgwS4bU2dQte3I1WRLVb58PsNpu
         dXgOEEtJ1CDhPqIOu/+X71dDsJCw2zxiMDPoYcu9/92dO3aCEUEEqBaIZ9bZId8wx5
         /LOcWDz8Ofp65/St3szECiClD3nVuFTGngIH8VrA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61FQ6Xi068630
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 1 Jul 2019 10:26:06 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 10:26:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 10:26:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61FQ5ax022326;
        Mon, 1 Jul 2019 10:26:06 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <dmurphy@ti.com>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH 0/2] leds: tlc591xx: switch to OF and managed API
Date:   Mon, 1 Jul 2019 17:26:00 +0200
Message-ID: <20190701152602.31716-1-jjhiblot@ti.com>
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

[0] https://lore.kernel.org/patchwork/project/lkml/list/?series=400524

Jean-Jacques Hiblot (2):
  leds: tlc591xx: simplify driver by using the managed led API
  leds: tlc591xx: Use the OF version of the LED registration function

 drivers/leds/leds-tlc591xx.c | 81 ++++++++++--------------------------
 1 file changed, 21 insertions(+), 60 deletions(-)

-- 
2.17.1

