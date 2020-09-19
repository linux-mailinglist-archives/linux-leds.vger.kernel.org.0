Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AFCD271132
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 00:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgISWbQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 18:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgISWbP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 18:31:15 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D4DC0613CE
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 15:31:15 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 073001407B1;
        Sun, 20 Sep 2020 00:31:14 +0200 (CEST)
Date:   Sun, 20 Sep 2020 00:31:13 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH leds + devicetree 02/13] leds: tca6507: use fwnode API
 instead of OF
Message-ID: <20200920003113.5dd8fa2c@nic.cz>
In-Reply-To: <20200919221548.29984-3-marek.behun@nic.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
        <20200919221548.29984-3-marek.behun@nic.cz>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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

This patch should also remove the use of of_match_ptr, since the
definition of variable of_tca6507_leds_match isn't guarded by CONFIG_OF
anymore. (If kernel test robot enables this driver but disables
CONFIG_OF, a warning will be issued).

Pavel, should I respin this, or send another patch afterwards?

Marek
