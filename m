Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784A832C302
	for <lists+linux-leds@lfdr.de>; Thu,  4 Mar 2021 01:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbhCCX7u (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Mar 2021 18:59:50 -0500
Received: from mail.nic.cz ([217.31.204.67]:42870 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1840788AbhCCEc5 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 2 Mar 2021 23:32:57 -0500
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 44A0613FFCC;
        Wed,  3 Mar 2021 05:32:15 +0100 (CET)
Date:   Wed, 3 Mar 2021 05:32:14 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Antoni Przybylik <antoni.przybylik@wp.pl>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Leds: made enum led_brightness into typedef
Message-ID: <20210303053214.7a3fbaeb@nic.cz>
In-Reply-To: <20210302230459.523410-1-antoni.przybylik@wp.pl>
References: <20210302230459.523410-1-antoni.przybylik@wp.pl>
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

This patch touches only code in drivers/leds and include/linux/leds.h.

Meanwhile enum led_brightness is used in many other parts of kernel as
well, just try
  git grep "enum led_brightness"

Also changing it probably to a simple int would be better. But if we
wanted a typedef anyway, it should be called led_brightness_t.

Marek
