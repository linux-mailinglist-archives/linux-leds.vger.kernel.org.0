Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F048529F8EF
	for <lists+linux-leds@lfdr.de>; Fri, 30 Oct 2020 00:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgJ2XO5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 19:14:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:56852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgJ2XO4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Oct 2020 19:14:56 -0400
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 585092076E;
        Thu, 29 Oct 2020 23:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604013296;
        bh=gTNfXJGtxbnszyR6UQzmog+Uta66SVkG3bk+ErfAkzM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pL+xF2C1RFGDXg597rTdnybpZAhc4AQOjbPKfQmFrs0e8dzY4ec+SxX2eDN2ioK0+
         ZLQFg8Wfg4iGcEpoerFHgqFkngjRP1YQ9bjSl1zhlX1QPWJSkuXAkt7r7DPmC8TjyO
         FYDcTcmmLS8K9Q6D1VCWG+M+HoWCVNi/kQkywcPE=
Date:   Fri, 30 Oct 2020 00:14:45 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Ben Whitten <ben.whitten@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: ledtrig netdev: what is the purpose of spinlock usage?
Message-ID: <20201030001445.40154b4a@kernel.org>
In-Reply-To: <984dfc46-f9a0-fb6e-0eef-3837e3fec0b7@gmail.com>
References: <20201029070000.15472666@kernel.org>
        <20201029174529.GA26053@duo.ucw.cz>
        <20201029191347.6d509614@kernel.org>
        <984dfc46-f9a0-fb6e-0eef-3837e3fec0b7@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 29 Oct 2020 23:49:19 +0100
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> register_netdevice_notifier() registers raw notifier chain,
> whose callbacks are not called from atomic context and there are
> no restrictions on callbacks. See include/linux/notifier.h.
> 
> So it looks like the spin_lock_bh() can be safely changed to
> mutex_lock().
> 

Niiiiceeee, this simplifies things much. Thank you, Jacek :)
