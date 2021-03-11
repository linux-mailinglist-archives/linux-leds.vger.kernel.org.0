Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA80337800
	for <lists+linux-leds@lfdr.de>; Thu, 11 Mar 2021 16:39:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbhCKPim (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 11 Mar 2021 10:38:42 -0500
Received: from mail.nic.cz ([217.31.204.67]:52356 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233653AbhCKPiQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 11 Mar 2021 10:38:16 -0500
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id EC1751408BD;
        Thu, 11 Mar 2021 16:38:14 +0100 (CET)
Date:   Thu, 11 Mar 2021 16:38:14 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Hermes Zhang <chenhui.zhang@axis.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        <kernel@axis.com>, Hermes Zhang <chenhuiz@axis.com>,
        <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: leds-dual-gpio: Add dual GPIO LEDs driver
Message-ID: <20210311163814.74c1885f@nic.cz>
In-Reply-To: <20210311130408.10820-1-chenhui.zhang@axis.com>
References: <20210311130408.10820-1-chenhui.zhang@axis.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

LED_FULL, LED_HALF, LED_OFF are deprecated.

And this driver is redundant. This can be done with leds-regulator,
with a gpio-regulator.

Marek
