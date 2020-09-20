Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9564227165C
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 19:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgITRj4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 13:39:56 -0400
Received: from mail.nic.cz ([217.31.204.67]:53766 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbgITRj4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 20 Sep 2020 13:39:56 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 1D7B41409E0;
        Sun, 20 Sep 2020 19:39:54 +0200 (CEST)
Date:   Sun, 20 Sep 2020 19:39:53 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH leds + devicetree 02/13] leds: tca6507: use fwnode API
 instead of OF
Message-ID: <20200920193953.3eccaf31@nic.cz>
In-Reply-To: <20200920193503.735bc66c@nic.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
        <20200919221548.29984-3-marek.behun@nic.cz>
        <BD25CCC6-343D-4624-9718-276B3C7C6510@goldelico.com>
        <20200920193503.735bc66c@nic.cz>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 20 Sep 2020 19:35:03 +0200
Marek Behun <marek.behun@nic.cz> wrote:

> On Sun, 20 Sep 2020 19:10:19 +0200
> H. Nikolaus Schaller <hns@goldelico.com> wrote:
> 
> > I wanted to test, but was not able to git am this patch to my working
> > environment (v5.9-rc5 or linux-next). So maybe some prerequisite is missing.
> 
> Could you try applying on Pavel's for-next?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/log/?h=for-next
> 
> Marek

Or even better, could you try my branch leds-cleanup-for-pavel? This is
applied on top of Pavel's for-next branch.

https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git/log/?h=leds-cleanup-for-pavel

Marek
Marek
