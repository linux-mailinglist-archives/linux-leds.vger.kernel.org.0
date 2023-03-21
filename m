Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32DF76C35D7
	for <lists+linux-leds@lfdr.de>; Tue, 21 Mar 2023 16:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjCUPif (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Mar 2023 11:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbjCUPie (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 Mar 2023 11:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD0A3BDBB
        for <linux-leds@vger.kernel.org>; Tue, 21 Mar 2023 08:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679413070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=BSu+HBn+v8KiJF9EJk6suuV05tJHsOmrbCuOwtMzHAc=;
        b=dvP+7NFmOmj86xlFAN/PHthDi3zEqjMsXIJx5COxaj5S+YR/NY4f9d/nDLTjfTy/D8Y4Mf
        KvTO2DJ5E1W+ty+BljdjVvqpDJHslp4f3a0aMkS1h951PR/jbv+FXKAm4csglQLQXPiIX1
        JOPYsiMd+V0AEZWM6DsSdxyCCcjkg+Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-wi4KaI6mPcCVBwAL9wvmkg-1; Tue, 21 Mar 2023 11:37:46 -0400
X-MC-Unique: wi4KaI6mPcCVBwAL9wvmkg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27CBB884340;
        Tue, 21 Mar 2023 15:37:46 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.17])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D4A1F40BC797;
        Tue, 21 Mar 2023 15:37:41 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 0/3] leds: tps68470: LED driver for TPS68470
Date:   Tue, 21 Mar 2023 23:37:15 +0800
Message-Id: <20230321153718.1355511-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The v3 patch includes:
1. Move the LEDB current setting to a function and also assume the value
of the current setting is based on tps68470 datasheet.
2. Alphabetical order.
3. Return -ENOMEM when memory allocation returns an error.


Kate Hsuan (3):
  platform: x86: int3472: Add MFD cell for tps68470 LED
  include: mfd: tps68470: Add masks for LEDA and LEDB
  leds: tps68470: Add LED control for tps68470

 drivers/leds/Kconfig                          |  12 ++
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-tps68470.c                  | 185 ++++++++++++++++++
 drivers/platform/x86/intel/int3472/tps68470.c |   5 +-
 include/linux/mfd/tps68470.h                  |   5 +
 5 files changed, 206 insertions(+), 2 deletions(-)
 create mode 100644 drivers/leds/leds-tps68470.c

-- 
2.39.2

