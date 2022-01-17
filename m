Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 460B8490713
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jan 2022 12:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbiAQLVV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Jan 2022 06:21:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34694 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239048AbiAQLVV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 17 Jan 2022 06:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642418479;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=MFk2Yhrf7+vbacvAPXTK15PgmzSBL/7HEQPGEAm06cA=;
        b=TW+/GI2dkndCCARVEFhYjls58IWSIN6EOW6k40iRlLobz2UjVUh73Xpxb5NGKYQrMr2N5S
        KivQOelTjZGO9YEUD1BXreDrzSV03ZjJFOJMX6znyLBdhm6m3gf3UcGZLoCXi3/l2uZPAC
        t/dK+5gXdHGDXJoK7mOHfzOJ7jVjKUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-CW3vOB3mPy-dwE9cx7tC0Q-1; Mon, 17 Jan 2022 06:21:16 -0500
X-MC-Unique: CW3vOB3mPy-dwE9cx7tC0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51241100CCC0;
        Mon, 17 Jan 2022 11:21:15 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.194])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BCB58752C9;
        Mon, 17 Jan 2022 11:21:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org,
        Henning Schild <henning.schild@siemens.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] leds: simatic-ipc-leds: Make simatic_ipc_led_mem_res static
Date:   Mon, 17 Jan 2022 12:21:08 +0100
Message-Id: <20220117112109.215695-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

simatic_ipc_led_mem_res is not used outside of the driver, make it static.

Cc: Henning Schild <henning.schild@siemens.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/simple/simatic-ipc-leds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/simple/simatic-ipc-leds.c b/drivers/leds/simple/simatic-ipc-leds.c
index ff2c96e73241..179110448659 100644
--- a/drivers/leds/simple/simatic-ipc-leds.c
+++ b/drivers/leds/simple/simatic-ipc-leds.c
@@ -39,7 +39,7 @@ static struct simatic_ipc_led simatic_ipc_leds_io[] = {
 };
 
 /* the actual start will be discovered with PCI, 0 is a placeholder */
-struct resource simatic_ipc_led_mem_res = DEFINE_RES_MEM_NAMED(0, SZ_4K, KBUILD_MODNAME);
+static struct resource simatic_ipc_led_mem_res = DEFINE_RES_MEM_NAMED(0, SZ_4K, KBUILD_MODNAME);
 
 static void *simatic_ipc_led_memory;
 
-- 
2.33.1

