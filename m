Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51B1D17D440
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2020 15:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgCHOpD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Mar 2020 10:45:03 -0400
Received: from mail.manjaro.org ([176.9.38.148]:45882 "EHLO mail.manjaro.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726297AbgCHOpD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 8 Mar 2020 10:45:03 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.manjaro.org (Postfix) with ESMTP id 8158337A1C4A;
        Sun,  8 Mar 2020 15:27:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
        by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OeG10X-an8uS; Sun,  8 Mar 2020 15:27:29 +0100 (CET)
From:   Tobias Schramm <t.schramm@manjaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tobias Schramm <t.schramm@manjaro.org>
Subject: [RFC PATCH 0/1] Add generic inverted led triggers
Date:   Sun,  8 Mar 2020 15:27:21 +0100
Message-Id: <20200308142722.1199260-1-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch adds generic inverted LED triggers. With this patch applied
any trigger can be used with inverted brightness levels by appending
"-inverted" to the name of a trigger.

This is can be useful for devices that do not have dedicated LEDs for e.g.
disk activity indication. With this patch applied the power led can be set
 to default-state = on and trigger = disk-activity-inverted. Then the led
will be on by default, indicating the power state of the device but it
will turn off briefly whenever there is disk activity.

I think dual-use of LEDs might come in handy for quite a few devices since
a lot of embedded boards and upcoming ARM based notebooks do only have one
or two LEDs.


Best regards,

Tobias

Tobias Schramm (1):
  leds: add generic inverted led trigger support

 drivers/leds/led-triggers.c | 148 +++++++++++++++++++++++++++---------
 include/linux/leds.h        |   1 +
 2 files changed, 111 insertions(+), 38 deletions(-)

-- 
2.24.1

