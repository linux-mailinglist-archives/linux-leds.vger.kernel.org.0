Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36FB32DF36E
	for <lists+linux-leds@lfdr.de>; Sun, 20 Dec 2020 04:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbgLTDp4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Dec 2020 22:45:56 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10053 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbgLTDp4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Dec 2020 22:45:56 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cz7ks2xkczM6xs;
        Sun, 20 Dec 2020 11:44:21 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.174) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Sun, 20 Dec 2020 11:45:07 +0800
From:   Xiaoming Ni <nixiaoming@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <pavel@ucw.cz>, <dmurphy@ti.com>, <akpm@linux-foundation.org>,
        <keescook@chromium.org>, <gpiccoli@canonical.com>,
        <penguin-kernel@i-love.sakura.ne.jp>, <rdunlap@infradead.org>
CC:     <nixiaoming@huawei.com>, <wangle6@huawei.com>
Subject: [PATCH v2 0/4] panic: Add new API in_panic_state()
Date:   Sun, 20 Dec 2020 11:45:01 +0800
Message-ID: <20201220034505.113118-1-nixiaoming@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.189.174]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

For some features (such as hang_task, ledtrig-activity, ledtrig-heartbeat)
different processing logics need to be performed based on whether the
current system is in panic state:
	1: Register hook for panic_notifier_list.
	2. Assign a value to the global variable in the hook function.
	3. Determine whether the system is in panic state based on the
          global variable and perform different processing.
Duplicate code snippets exist, and the timing judgment is relatively lag.
Therefore, consider extracting the new API: bool in_panic_state(void).

----------------

v2: Rename api to in_panic_state as recommended by Pavel Machek, Tetsuo
 Handa, Randy Dunlap.

v1: https://lore.kernel.org/lkml/20201218114406.61906-1-nixiaoming@huawei.com/
  API name: is_being_panic
----------------

Xiaoming Ni (4):
  panic: Add new API in_panic_state()
  hung_task: Replace "did_panic" with in_panic_state()
  leds:trigger:ledtrig-activity Replace "panic_detected" with
    in_panic_state()
  leds:trigger:ledtrig-heartbeat: Replace "panic_heartbeats" with
    in_panic_state()

 drivers/leds/trigger/ledtrig-activity.c  | 19 +------------------
 drivers/leds/trigger/ledtrig-heartbeat.c | 19 +------------------
 include/linux/kernel.h                   |  1 +
 kernel/hung_task.c                       | 17 +----------------
 kernel/panic.c                           |  6 ++++++
 5 files changed, 10 insertions(+), 52 deletions(-)

-- 
2.27.0

