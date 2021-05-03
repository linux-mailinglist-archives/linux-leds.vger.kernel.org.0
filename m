Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1A2371C96
	for <lists+linux-leds@lfdr.de>; Mon,  3 May 2021 18:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234239AbhECQxa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 May 2021 12:53:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:39758 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233413AbhECQv0 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 3 May 2021 12:51:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B79D6B239;
        Mon,  3 May 2021 16:50:31 +0000 (UTC)
Date:   Mon, 3 May 2021 13:50:26 -0300
From:   Enzo Matsumiya <ematsumiya@suse.de>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        u.kleine-koenig@pengutronix.de, Jens Axboe <axboe@kernel.dk>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] block: export block_class and disk_type symbols
Message-ID: <20210503165026.j2gdk6pfljjo566s@hyori>
References: <20210430183216.27458-1-ematsumiya@suse.de>
 <20210430183216.27458-2-ematsumiya@suse.de>
 <20210503070431.GA3520077@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210503070431.GA3520077@infradead.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 05/03, Christoph Hellwig wrote:
>On Fri, Apr 30, 2021 at 03:32:10PM -0300, Enzo Matsumiya wrote:
>> Export symbols to be used by _for_each_blk() helper in LED block
>> trigger.
>
>No way.

Thanks everyone, I'll fix this in the next patch version.


Cheers,

Enzo
