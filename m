Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192FC40C035
	for <lists+linux-leds@lfdr.de>; Wed, 15 Sep 2021 09:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236665AbhIOHKk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Sep 2021 03:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236514AbhIOHKg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Sep 2021 03:10:36 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4BCC061766;
        Wed, 15 Sep 2021 00:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=MstlZ/WGGsTWSrOweLURi5+38ovZzPTCPxZkss3yN9s=; b=iqFJ/xWdvH0ifN9x+IuK+5Joxy
        Bh53Ce32009lkactxK/FrXCR++gOoHCI38CMzPZNbD9vAsbKzfj8EA2Pz9D7oaoM9Zbswxh+YKZzo
        aylKl8X5taqcuDtQqHu5WKmRrvnM5RomhnLSMaMD9aRiMN2QlZPlWT0NCyXu3jIr6vMiZ/M/o72KK
        cvz4/4ZOxqsk7cViyc3rwUrOOhSoFjJdNE0oSCDpxZz7MWjVX3nZP46cDa15R9c2CE8eD/XJGcwl0
        PQaf8r11akBoCsUVBGu65vxRUBTmzbSQg3/vPMuK/iG7kSrXXtr90De/d6twENL+soTSMcVvr/Pzs
        MbGdXq5Q==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mQP1T-00FRqg-QF; Wed, 15 Sep 2021 07:08:21 +0000
Date:   Wed, 15 Sep 2021 08:07:59 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, kabel@kernel.org, chaitanyak@nvidia.com
Subject: Re: [PATCH v3 2/3] block: export block_class for use by the blkdev
 LED trigger
Message-ID: <YUGbz1uxPNLTz6tA@infradead.org>
References: <20210914201713.14922-1-arequipeno@gmail.com>
 <20210914201713.14922-3-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914201713.14922-3-arequipeno@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

NAK.  block_class has no business being used outside the core block
layer.
