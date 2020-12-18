Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6244A2DE22B
	for <lists+linux-leds@lfdr.de>; Fri, 18 Dec 2020 12:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgLRLpF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Dec 2020 06:45:05 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:9462 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbgLRLpE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Dec 2020 06:45:04 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cy6T11M4RzhtKb;
        Fri, 18 Dec 2020 19:43:49 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.174) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Fri, 18 Dec 2020 19:44:11 +0800
From:   Xiaoming Ni <nixiaoming@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <pavel@ucw.cz>, <dmurphy@ti.com>, <akpm@linux-foundation.org>,
        <keescook@chromium.org>, <gpiccoli@canonical.com>,
        <penguin-kernel@i-love.sakura.ne.jp>
CC:     <nixiaoming@huawei.com>, <wangle6@huawei.com>
Subject: [PATCH 0/4] Add new API is_being_panic() 
Date:   Fri, 18 Dec 2020 19:44:02 +0800
Message-ID: <20201218114406.61906-1-nixiaoming@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.189.174]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add is_being_panic() to check whether the system is in panic state.
Used to replace the global variable used to determine the panic status
in other features: hung_task ledtrig-activity ledtrig-heartbeat


Xiaoming Ni (4):
  panic: Add new API is_being_panic()
  hung_task: Replace "did_panic" with is_be_panic()
  leds:trigger:ledtrig-activity Replace "panic_detected" with
    is_be_panic()
  leds:trigger:ledtrig-heartbeat: Replace "panic_heartbeats" with
    is_be_panic()

 drivers/leds/trigger/ledtrig-activity.c  | 19 +------------------
 drivers/leds/trigger/ledtrig-heartbeat.c | 19 +------------------
 include/linux/kernel.h                   |  1 +
 kernel/hung_task.c                       | 17 +----------------
 kernel/panic.c                           |  6 ++++++
 5 files changed, 10 insertions(+), 52 deletions(-)

-- 
2.27.0

