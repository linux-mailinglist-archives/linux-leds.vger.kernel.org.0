Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 150F0698A4
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 17:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730782AbfGOP5e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 11:57:34 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49280 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730257AbfGOP5e (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 11:57:34 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6FFvPqP010346;
        Mon, 15 Jul 2019 10:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563206245;
        bh=GUsIFAcLwu/Lmx/f5iSP9bcMoUUuB0rg2xzJ/SpvqYA=;
        h=From:To:CC:Subject:Date;
        b=Cq2rWJ5jAaAEvuorIG5O3R+UP21Gnj5kAIJMTmwFi7jRa1NdVpvpFSqfIikVAfTsd
         JwpTV1dtzcpvbWkBcrvWcViFD89EdUT6ddXjsbBIMC8L+qv1tYmx6Iu1B7dW8MBQbT
         wXAvKx4vYoop99VbubjE6+4yFd1gcK0yqnajzH5A=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6FFvPSJ084906
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 15 Jul 2019 10:57:25 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 15
 Jul 2019 10:57:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 15 Jul 2019 10:57:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6FFvOhL003859;
        Mon, 15 Jul 2019 10:57:24 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v2 0/2] leds: Add control of the voltage/current regulator to the LED core
Date:   Mon, 15 Jul 2019 17:56:55 +0200
Message-ID: <20190715155657.22976-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series makes it possible for the LED core to manage the power supply
of a LED. It uses the regulator API to disable/enable the power if when the
LED is turned on/off.
This is especially useful in situations where the LED driver/controller is
not supplying the power.

changes in v2:
- use devm_regulator_get_optional() to avoid using the dummy regulator and do
  some unnecessary work

Jean-Jacques Hiblot (2):
  dt-bindings: leds: document the "power-supply" property
  leds: Add control of the voltage/current regulator to the LED core

 .../devicetree/bindings/leds/common.txt       |  6 +++
 drivers/leds/led-class.c                      | 15 ++++++
 drivers/leds/led-core.c                       | 50 +++++++++++++++++--
 drivers/leds/leds.h                           |  1 +
 include/linux/leds.h                          |  4 ++
 5 files changed, 73 insertions(+), 3 deletions(-)

-- 
2.17.1

