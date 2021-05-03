Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54BD43711D6
	for <lists+linux-leds@lfdr.de>; Mon,  3 May 2021 09:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhECHFt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 May 2021 03:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhECHFt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 May 2021 03:05:49 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4801CC06174A;
        Mon,  3 May 2021 00:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=wRCjCKxHpNInqPMfFUoxJStHDaHWfqQnS0cpIhupj4o=; b=LXItw8fbBGQw3nwnSjP6NaQbRD
        2qonOhNEDdrs1ALLgc9YK1sVx9LvXe5DQtcO6W+njkmcYKY4LJP7AVNGpJVTP1Hxgagvr6GDlctVf
        Jh4RUPWwcPEqlvQJ4HHf2bHRxTLHkvN8JB0hu+seWnSsn22/mtI1XCC3CZSKHWwYcgU2aGmAp85Pj
        WDLK2INZtuxrB/c76uGFTJzLY12Z5p7euJQ+fc8bB2MEKI+IYoukJuDzdj1RH2Eft8R+5K4ugxpR5
        NYdzLAmjRHn157pV+CpnoL9jOmXotJAZXyHfgJXn3OsvCSN+jbQEPZqv0cCw1ZdMMzd9gfbziATAL
        hVUkmeHw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1ldSd5-00Elo6-AC; Mon, 03 May 2021 07:04:36 +0000
Date:   Mon, 3 May 2021 08:04:31 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Enzo Matsumiya <ematsumiya@suse.de>
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        u.kleine-koenig@pengutronix.de, Jens Axboe <axboe@kernel.dk>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] block: export block_class and disk_type symbols
Message-ID: <20210503070431.GA3520077@infradead.org>
References: <20210430183216.27458-1-ematsumiya@suse.de>
 <20210430183216.27458-2-ematsumiya@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430183216.27458-2-ematsumiya@suse.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Apr 30, 2021 at 03:32:10PM -0300, Enzo Matsumiya wrote:
> Export symbols to be used by _for_each_blk() helper in LED block
> trigger.

No way.
