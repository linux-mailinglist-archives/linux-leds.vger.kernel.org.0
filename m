Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B33B77C909
	for <lists+linux-leds@lfdr.de>; Tue, 15 Aug 2023 10:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235519AbjHOIAd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Aug 2023 04:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235511AbjHOIAI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Aug 2023 04:00:08 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3557D173F
        for <linux-leds@vger.kernel.org>; Tue, 15 Aug 2023 01:00:06 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RQ3Yb4XC2z1GDYJ;
        Tue, 15 Aug 2023 15:58:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 15 Aug
 2023 16:00:01 +0800
From:   Li Zetao <lizetao1@huawei.com>
To:     <pavel@ucw.cz>, <lee@kernel.org>, <andrew@lunn.ch>,
        <ansuelsmth@gmail.com>, <davem@davemloft.net>, <kuba@kernel.org>,
        <dan.carpenter@linaro.org>
CC:     <lizetao1@huawei.com>, <yang.lee@linux.alibaba.com>,
        <linux-leds@vger.kernel.org>
Subject: [PATCH -next 0/2] Simplify the code with declaration-driven macros
Date:   Tue, 15 Aug 2023 15:59:42 +0800
Message-ID: <20230815075944.1089298-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The patch set uses the declaration-driven macros to simplify the code.

Li Zetao (2):
  leds: trigger: netdev: Use module_led_trigger macro to simplify the
    code
  leds: Use module_misc_device macro to simplify the code

 drivers/leds/trigger/ledtrig-netdev.c | 13 +------------
 drivers/leds/uleds.c                  | 12 +-----------
 2 files changed, 2 insertions(+), 23 deletions(-)

-- 
2.34.1

